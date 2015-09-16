/**
 * Skadi.d Web Framework
 * Form Component

 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module skadi.components.form.element;

import skadi.components.form.elementInterface;
import skadi.components.form.form;
import skadi.components.validation.validatorInterface;

abstract class Element : ElementInterface
{

protected:

	Form _form;
	string _name;
	string _value;
	string _label;
	string[string] _attributes;
	string[] _filters;
	ValidatorInterface[] _validators;

public:
	/**
	 * @param string name
	 * @param array attributes
	 */
	this(string name, string[string] attributes = null)
	{
		this._name = name;
	}

	/**
	 * Sets the parent form to the element
	 */
	ElementInterface setForm(Form form)
	{
		this._form = form;
		return this;
	}

	/**
	 * Returns the parent form to the element
	 */
	Form getForm()
	{
		return this._form;
	}

	/**
	 * Sets the element name
	 */
	ElementInterface setName(string name)
	{
		this._name = name;
		return this;
	}

	/**
	 * Returns the element name
	 */
	string getName()
	{
		return this._name;
	}

	/**
	 * Adds a filter to current list of filters
	 */
	ElementInterface addFilter(string filter)
	{
		this._filters ~= filter;
		return this;
	}

	/**
	 * Returns the element filters
	 *
	 * @return string[]
	 */
	string[] getFilters()
	{
		return this._filters;
	}

	/**
	 * Adds a validator to the element
	 */
	ElementInterface addValidator(ValidatorInterface validator)
	{
		this._validators ~= validator;
		return this;
	}

	/**
	 * Returns the validators registered for the element
	 */
	ValidatorInterface[] getValidators()
	{
		return this._validators;
	}

	/**
	 * Sets the element label
	 */
	ElementInterface setLabel(string label)
	{
		this._label = label;
		return this;
	}

	/**
	 * Returns the element label
	 */
	string getLabel()
	{
		return this._label;
	}

	/**
	 * Sets a default value in case the form does not use an entity
	 * or there is no value available for the element in _POST
	 */
	ElementInterface setDefault(string value)
	{
		this._value = value;
		return this;
	}

	/**
	 * Returns the default value assigned to the element
	 */
	string getDefault()
	{
		return this._value;
	}

	/**
	 * Magic method __toString renders the widget without atttributes
	 */
	string toString()
	{
		return "teste :D";
	}
}
