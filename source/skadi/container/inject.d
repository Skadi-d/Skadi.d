/**
	Based on https://github.com/mbierlee/poodinis
	Package: Skadi.d
	Copyright: © 2015 Faianca
	License: Subject to the terms of the MIT license, as written in the included LICENSE.txt file.
	Authors: Faianca
*/
module skadi.container.inject;

public import skadi.container.container;

import std.exception;
import std.stdio;
import std.string;
import std.traits;
import std.range;

struct UseMemberType {};

/**
 * UDA for annotating class members as candidates for Injecting.
 *
 * Optionally a template parameter can be supplied to specify the type of a qualified class. The qualified type
 * of a concrete class is used to inject members declared by supertype. If no qualifier is supplied, the type
 * of the member is used as qualifier.
 *
 * The members of an instance of "HybridCar" will now be injectd properly, because the inject mechanism will
 * inject member "fuelEngine" as if it's of type "FuelEngine". This means that the members of instance "fuelEngine"
 * will also be injectd because the inject mechanism knows that member "fuelEngine" is an instance of "FuelEngine"
 */
struct Inject(QualifierType = UseMemberType)
{
	QualifierType qualifier;
};

/**
 * UDA for annotating class members to be injectd with a new instance regardless of their registration scope.
 *
 * antenna will always be assigned a new instance of class Antenna.
 */
struct AssignNewInstance {}

private void printDebugInjectedInstance(TypeInfo instanceType, void* instanceAddress)
{
	writeln(format("DEBUG: Injecting members of [%s@%s]", instanceType, instanceAddress));
}

/**
 * Injects members of a given instance using dependencies registered in the given container.
 *
 * All public members of the given instance, which are annotated using the "Inject" UDA, are injectd.
 * All members are resolved using the given container. Qualifiers are used to determine the type of class to
 * resolve for any member of instance.
 *
 * Note that private members will not be injectd because the autowiring mechanism is not able to by-pass
 * member visibility protection.
 *
 * See_Also: Inject
 */
public void inject(Type)(shared(Container) container, Type instance)
{
	debug(skadiVerbose) {
		printDebugInjectedInstance(typeid(Type), &instance);
	}

	foreach (member ; __traits(allMembers, Type)) {
		injectMember!member(container, instance);
	}
}

private void printDebugInjectingCandidate(TypeInfo candidateInstanceType, void* candidateInstanceAddress, TypeInfo instanceType, void* instanceAddress, string member)
{
	writeln(format("DEBUG: Injected instance [%s@%s] to [%s@%s].%s", candidateInstanceType, candidateInstanceAddress, instanceType, instanceAddress, member));
}

private void printDebugInjectingArray(TypeInfo superTypeInfo, TypeInfo instanceType, void* instanceAddress, string member)
{
	writeln(format("DEBUG: Inject all registered instances of super type %s to [%s@%s].%s", superTypeInfo, instanceType, instanceAddress, member));
}

private void injectMember(string member, Type)(shared(Container) container, Type instance)
{
	static if(__traits(compiles, __traits(getMember, instance, member)) && __traits(compiles, __traits(getAttributes, __traits(getMember, instance, member)))) {
		foreach(injectAttribute; __traits(getAttributes, __traits(getMember, instance, member))) {
			static if (__traits(isSame, injectAttribute, Inject) || is(injectAttribute == Inject!T, T)) {
				if (__traits(getMember, instance, member) is null) {
					alias MemberType = typeof(__traits(getMember, instance, member));

					enum assignNewInstance = hasUDA!(__traits(getMember, instance, member), AssignNewInstance);

					static if (isDynamicArray!MemberType) {
						alias MemberElementType = ElementType!MemberType;
						auto instances = container.resolveAll!MemberElementType;
						__traits(getMember, instance, member) = instances;
						debug(skadiVerbose) {
							printDebugInjectingArray(typeid(MemberElementType), typeid(Type), &instance, member);
						}
					} else {
						debug(skadiVerbose) {
							TypeInfo qualifiedInstanceType = typeid(MemberType);
						}

						MemberType qualifiedInstance;
						static if (is(injectAttribute == Inject!T, T) && !is(injectAttribute.qualifier == UseMemberType)) {
							alias QualifierType = typeof(injectAttribute.qualifier);
							qualifiedInstance = createOrResolveInstance!(MemberType, QualifierType, assignNewInstance)(container);
							debug(skadiVerbose) {
								qualifiedInstanceType = typeid(QualifierType);
							}
						} else {
							qualifiedInstance = createOrResolveInstance!(MemberType, MemberType, assignNewInstance)(container);
						}

						__traits(getMember, instance, member) = qualifiedInstance;

						debug(skadiVerbose) {
							printDebugInjectingCandidate(qualifiedInstanceType, &qualifiedInstance, typeid(Type), &instance, member);
						}
					}
				}

				break;
			}
		}
	}
}

private QualifierType createOrResolveInstance(MemberType, QualifierType, bool createNew)(shared(Container) container)
{
	static if (createNew) {
		auto instanceFactory = new NewInstanceScope(typeid(MemberType));
		return cast(MemberType) instanceFactory.getInstance();
	} else {
		return container.resolve!(MemberType, QualifierType);
	}
}

/**
 * Inject the given instance using the globally available dependency container.
 *
 * See_Also: Container
 */
public void globalInject(Type)(Type instance)
{
	Container.getInstance().inject(instance);
}

class InjectedRegistration(RegistrationType : Object) : Registration
{
	private shared(Container) container;

	public this(TypeInfo registeredType, shared(Container) container)
	{
		enforce(!(container is null), "Argument 'container' is null. Injected registrations need to inject using a container.");
		this.container = container;
		super(registeredType, typeid(RegistrationType));
	}

	public override Object getInstance(InstantiationContext context = new InjectInstantiationContext())
	{
		RegistrationType instance = cast(RegistrationType) super.getInstance(context);

		InjectInstantiationContext injectContext = cast(InjectInstantiationContext) context;
		enforce(!(injectContext is null), "Given instantiation context type could not be cast to an InjectInstantiationContext. If you relied on using the default assigned context: make sure you're calling getInstance() on an instance of type InjectedRegistration!");
		if (injectContext.injectInstance) {
			container.inject(instance);
		}

		return instance;
	}

}

class InjectInstantiationContext : InstantiationContext
{
	public bool injectInstance = true;
}
