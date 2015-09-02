module skadi.core.controller;

import skadi.core.container;

abstract class Controller
{
    this ()
    {
        this.container = Container.getInstance();
    }

protected:
    shared(Container) container;

}
