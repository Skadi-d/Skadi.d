/**
 * Skadi.d Web Framework
 * Form Component

 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module skadi.components.form.form;

import skadi.components.form.elementInterface;


class Form
{

protected:

    ElementInterface[string] _elements;

public:
    /**
	 * Adds an element to the form
	 */
	Form add(ElementInterface element, string postion = null, bool type = false)
	{
		/**
		 * Gets the element's name
		 */
		string name = element.getName();

		/**
		 * Link the element to the form
		 */
		element.setForm(this);
        this._elements[name] = element;

		return this;
	}

    /**
	 * Renders a specific item in the form
	 */
	string render(string name)
	{
		if (name !in this._elements) {
			throw new Exception("Element with ID=" ~ name ~ " is not part of the form");
		}

		return this._elements[name].render();
	}

}
