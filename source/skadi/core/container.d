module skadi.core.container;

public import skadi.container.container;

import std.string;
import std.array;

struct Service
{
    string name;
    string path;

    string className()
    {
         return this.path.split(".")[$-1..$].join();
    }
}
