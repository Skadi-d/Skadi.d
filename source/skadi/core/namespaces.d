/**
 * Skadi.d Web Framework
 *
 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module skadi.core.namespaces;

enum controllerType { WEB, REST }

struct Namespace
{
    string bundle;
    Controller[] controllers;
}

struct Controller
{
    string name;
    string prefix;
    int type = controllerType.WEB;
}
