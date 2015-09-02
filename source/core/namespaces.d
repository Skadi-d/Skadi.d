module core.namespaces;

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

enum Namespace[] namespaces = [
    Namespace("PostBundle", [
        Controller("PostController", "/post")
    ]),
];
