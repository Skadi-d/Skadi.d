/**
 * Skadi.d Web Framework
 * Validation Component

 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module skadi.components.validation.validators.alphanum;

import skadi.components.validation.validatorInterface;
import skadi.components.validation.validation;
import skadi.components.validation.validator;
import skadi.components.validation.message;

import std.string;
import std.ascii;
import std.algorithm;

/**
 * Check for alphabetic character(s)

 * Check Unittests for examples at the bottom of the file.
 */
struct AlphaNumOptions
{
	string label;
	bool allowEmpty = false;
	string message;
}

class AlphaNum : Validator
{

	protected AlphaNumOptions _options;

	/**
	 * constructor
	 */
	this(AlphaNumOptions options)
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

		return all!isAlphaNum(value);
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

		if (!all!isAlphaNum(value)) {

			string label = (this._options.label.length == 0)
							? validation.getLabel(field)
							: this._options.label;

			string message = this._options.message;

			if (message.length == 0) {
				message = validation.getDefaultMessage("Alnum");
			}

			validation.appendMessage(new Message(format(message, label), field, "Alnum"));
			return false;
		}

		return true;
	}

}

unittest
{
	// WITH VALIDATOR

	auto validation = new Validation();

	auto options = AlphaNumOptions();

	AlphaNum test = new AlphaNum(options);
	assert(test.validate(validation, "test") == true);
	assert(test.validate(validation, "1") == true);
	assert(test.validate(validation, "jorgefaiancag|@mail.comp") == false);

	test = new AlphaNum(options);
	assert(test.validate("jorgefaiancagmail121323") == true);
	assert(test.validate("test.com") == false);
	assert(test.validate("123213123") == true);
	assert(test.validate(validation, "321.23") == false);

}
