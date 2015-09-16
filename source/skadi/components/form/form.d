/**
 * Skadi.d Web Framework
 * Form Component

 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module skadi.components.form.form;

import skadi.components.form.elementInterface;
import skadi.components.validation.messagelist;
import skadi.components.validation.validation;
import skadi.components.validation.validatorInterface;
import skadi.components.validation.validator;



class Form
{

protected:
    MessageList[] _messages;
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
	 * Returns the messages generated in the validation
	 */
	MessageList[] getMessages()
	{
		return this._messages;
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

    /**
	 * Validates the form
	 *
	 * @param array data
	 * @param object entity
	 * @return boolean
	 */
	bool isValid(string[string] data)
	{
        import std.stdio;
        auto validation = new Validation();

        foreach(key, value; data) {
            if (key in this._elements) {
                ValidatorInterface[] validators = this._elements[key].getValidators();
                foreach(ValidatorInterface validator; validators) {
                    validator.validate(validation, value); // noticeee
                }
            }
        }

		return validation.getMessages().isEmpty();
	}

}
