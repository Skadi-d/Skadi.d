/**
 * Skadi.d Web Framework
 * Form Component

 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module skadi.components.form.elements.text;

import skadi.components.form.element;
import skadi.components.form.form;

class Text : Element
{

    /**
	 * @param string name
	 * @param array attributes
	 */
	this(string name, string[string] attributes = null)
	{
		super(name);
	}

	/**
	 * Renders the element widget
	 */
	string render()
	{
		return "input.(name='"~ this._name ~"' value='"~ this._value ~"')";
	}

}
