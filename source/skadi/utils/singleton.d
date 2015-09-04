/**
 * Skadi.d Web Framework
 *
 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module singleton;

mixin template Singleton ()
{
	mixin .SingletonBase;
}

mixin template Singleton ( alias Ctor )
{
	mixin .SingletonBase;

	protected this ()
    {
		static if ( is( typeof( super() ) ) ) {
			super();
		}
		Ctor();
	}

}

mixin template Singleton ( string CtorImpl )
{
	mixin .SingletonBase;

	protected this ()
    {
		static if ( is( typeof( super() ) ) ) {
			super();
		}
		mixin( CtorImpl );
	}
}

mixin template SingletonBase ()
{
	static @property RealClass instance ( this RealClass ) ()
    {
		static RealClass self;

		if ( self is null ) {
			self = new RealClass;
		}
		return self;
	}

	alias instance opCall;
}
