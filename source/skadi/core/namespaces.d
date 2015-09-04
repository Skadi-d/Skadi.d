/**
	Package: Skadi.d
	Copyright: © 2015 Faianca
	License: Subject to the terms of the MIT license, as written in the included LICENSE.txt file.
	Authors: Faianca
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
