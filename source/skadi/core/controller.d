module skadi.core.controller;

import skadi.core.container;

abstract class SkadiController
{
    this ()
    {
        this.container = Container.getInstance();
    }

protected:
    shared(Container) container;

}
