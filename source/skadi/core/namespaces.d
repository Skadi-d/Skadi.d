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
