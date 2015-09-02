module skadi.core.namespaces;

struct Namespace
{
    string bundle;
    Controller[] controllers;
}

struct Controller
{
    string name;
    string prefix;
}
