/**
	Package: Skadi.d
	Copyright: © 2015 Faianca
	License: Subject to the terms of the MIT license, as written in the included LICENSE.txt file.
	Authors: Faianca
*/
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
