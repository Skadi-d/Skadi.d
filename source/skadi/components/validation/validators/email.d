/**
 * Skadi.d Web Framework
 * Validation Component

 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module skadi.components.validation.validators.email;

import skadi.components.validation.validatorInterface;
import skadi.components.validation.validation;
import skadi.components.validation.validator;
import skadi.components.validation.message;

import std.string;
import std.regex;
import std.stdio;

/**
 * Checks if a value has a correct e-mail format

 * Check Unittests for examples at the bottom of the file.
 */
struct EmailOptions
{
	string label;
	bool allowEmpty = false;
	string messageEmail;
}

class Email : Validator
{

	protected EmailOptions _options;

	/**
	 * constructor
	 */
	this(EmailOptions options)
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

		return this.validateEmail(value);
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

		if (!this.validateEmail(value)) {

			string label = (this._options.label.length == 0)
							? validation.getLabel(field)
							: this._options.label;

			string message = this._options.messageEmail;

			if (message.length == 0) {
				message = validation.getDefaultMessage("Email");
			}

			validation.appendMessage(new Message(format(message, label), field, "Email"));
			return false;
		}

		return true;
	}

	/**
	*  Simple Regex
	**/
	private bool validateEmail(string value)
	{
		auto t = match(value, regex(`(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)`));
		return !t.empty;
	}
}

unittest
{
	// WITH VALIDATOR

	auto validation = new Validation();

	auto options = EmailOptions();

	Email test = new Email(options);
	assert(test.validate(validation, "test") == false);
	assert(test.validate(validation, "jorgefaianca@gmail.com") == true);

	test = new Email(options);
	assert(test.validate("jorgefaianca@gmail.") == false);
	assert(test.validate("jorgefaianca.gmail.com") == false);
	assert(test.validate(validation, "teste@test.com") == true);

}
