module core.controller;

import core.container;

abstract class Controller
{
    this ()
    {
        this.container = Container.getInstance();
    }

protected:
    shared(Container) container;

}
