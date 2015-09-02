import core.kernel;

shared static this()
{
	auto kernel = new Kernel();
	kernel.boot();
}
