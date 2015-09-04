/**
 * Skadi.d Web Framework
 *
 * core/controller - Base Controller.
 *
 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module skadi.core.controller;

import skadi.core.container;
import skadi.utils.exceptions;
import std.string;

/**
 * Thrown when Controller not found
 */
mixin SkadiException!("ControllerNotFound", "404");

/**
 * Thrown when the specified Controller is not derived from Controller
 */
mixin SkadiException!("InvalidController");

/**
* Main Controller
* TODO: Handle the Request and Response
**/
abstract class SkadiController
{
    this ()
    {
        this.container = Container.getInstance();
    }

protected:
    shared(Container) container;

}
