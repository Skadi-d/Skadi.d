/**
 * Skadi.d Web Framework
 * Form Component

 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module skadi.components.form.elementInterface;

import skadi.components.form.form;
import skadi.components.validation.validatorInterface;

interface ElementInterface
{

	ValidatorInterface[] getValidators();

	/**
	 * Sets the parent form to the element
	 */
	 ElementInterface setForm(Form form);

	/**
	 * Returns the parent form to the element
	 */
	Form getForm();

	/**
	 * Sets the element's name
	 */
	ElementInterface setName(string name);

	/**
	 * Returns the element's name
	 */
	string getName();

	/**
	 * Renders the element widget
	 */
	string render();

}
