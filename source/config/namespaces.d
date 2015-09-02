module config.namespaces;

import skadi.framework;

enum Namespace[] namespaces = [
    Namespace("PostBundle", [
        Controller("PostController", "/post")
    ]),
];
