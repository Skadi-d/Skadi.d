module config.namespaces;

public import skadi.core.namespaces;

enum Namespace[] namespaces = [
    Namespace("PostBundle", [
        Controller("PostController", "/post")
    ]),
];
