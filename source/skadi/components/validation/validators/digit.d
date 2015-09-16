/**
 * Skadi.d Web Framework
 * Validation Component

 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module skadi.components.validation.validators.digit;

import skadi.components.validation.validatorInterface;
import skadi.components.validation.validation;
import skadi.components.validation.validator;
import skadi.components.validation.message;

import std.string;
import std.ascii;
import std.stdio;
import std.conv;

/**
 * Checks if a value has a correct e-mail format

 * Check Unittests for examples at the bottom of the file.
 */
struct DigitOptions
{
	string label;
	bool allowEmpty = false;
	string message;
}

class Digit : Validator
{

	protected DigitOptions _options;

	/**
	 * constructor
	 */
	this(DigitOptions options)
	{
		this._options = options;
	}

	bool validate(string field = null)
	{
		bool valid = false;
		string value = field;

		if (this._options.allowEmpty && value.length == 0) {
			return true;
		}

		return isNumeric(value);
	}


	/**
	 * Executes the validation
	 */
	override bool validate(Validation validation, string field = null)
	{
		string value = validation.getValue(field);

		if (this._options.allowEmpty && value.length == 0) {
			return true;
		}

		if (!isNumeric(value)) {

			string label = (this._options.label.length == 0)
							? validation.getLabel(field)
							: this._options.label;

			string message = this._options.message;

			if (message.length == 0) {
				message = validation.getDefaultMessage("Digit");
			}

			validation.appendMessage(new Message(format(message, label), field, "Digit"));
			return false;
		}

		return true;
	}

}

unittest
{
	// WITH VALIDATOR

	auto validation = new Validation();

	auto options = DigitOptions();

	Digit test = new Digit(options);
	assert(test.validate(validation, "test") == false);
	assert(test.validate(validation, "1") == true);

	test = new Digit(options);
	assert(test.validate("jorgefaianca@gmail.") == false);
	assert(test.validate("123213123") == true);
	assert(test.validate(validation, "321.23") == true);

}
