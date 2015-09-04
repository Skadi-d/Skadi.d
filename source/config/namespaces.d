/**
 * Skadi.d Web Framework
 *
 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module config.namespaces;

import skadi.framework;

enum Namespace[] namespaces = [
    Namespace("PostBundle", [
        Controller("PostController", "/")
    ]),
];
