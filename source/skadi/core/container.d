/**
 * Skadi.d Web Framework
 *
 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
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
