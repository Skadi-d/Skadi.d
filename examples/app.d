import skadi.framework;
import config.config;
import config.container;
import config.namespaces;

shared static this()
{
	auto kernel = new Kernel(port, namespaces, services);
	kernel.boot();
}
