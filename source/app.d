import skadi.core.kernel;

import std.stdio;
import std.array;
import std.string;

shared static this()
{
	string test = "Controller.PostManager".split(".")[$-1..$].join();
	writeln(test);

	auto kernel = new Kernel();
	kernel.boot();
}
