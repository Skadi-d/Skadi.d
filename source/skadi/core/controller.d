/**
	Package: Skadi.d
	Copyright: © 2015 Faianca
	License: Subject to the terms of the MIT license, as written in the included LICENSE.txt file.
	Authors: Faianca
*/
module skadi.core.controller;

import skadi.core.container;

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
