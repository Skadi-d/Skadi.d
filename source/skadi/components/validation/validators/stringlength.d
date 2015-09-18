/**
 * Skadi.d Web Framework
 * Validation Component

 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module skadi.components.validation.validators.stringlength;

import skadi.components.validation.validatorInterface;
import skadi.components.validation.validation;
import skadi.components.validation.validator;
import skadi.components.validation.message;

import std.conv;
import std.string;
import std.stdio;

/**
 * Validates that a string has the specified maximum and minimum constraints
 * The test is passed if for a string's length L, min<=L<=max, i.e. L must
 * be at least min, and at most max.
 *
 * Check Unittests for examples at the bottom of the file.
 */
struct StringOptions
{
	int min;
	int max;
	string label;
	bool allowEmpty = false;
	string messageMinimum;
	string messageMaximum;
}

class StringLength : Validator
{

	protected StringOptions _options;

	/**
	 * constructor
	 */
	this(StringOptions options)
	{
		this._options = options;
	}

	bool validate(string field = null)
	{
		bool valid = false;
		string value = field;

		if (!this._options.min && !this._options.max) {
			throw new Exception("A minimum or maximum must be set");
		}

		if (this._options.allowEmpty && value.length == 0) {
			return true;
		}

		if (this._options.min) {
			if (field.length >= this._options.min) {
				valid = true;
			} else {
				return false;
			}
		}

		if (this._options.max) {
			valid = (field.length <= this._options.max);
		}

		return valid;
	}

	/**
	 * Executes the validation
	 */
	override bool validate(Validation validation, string field = null)
	{
		bool valid = false;
		string value = validation.getValue(field);

		string label = (this._options.label.length == 0)
						? validation.getLabel(field)
						: this._options.label;

		if (!this._options.min && !this._options.max) {
			throw new Exception("A minimum or maximum must be set");
		}

		if (this._options.allowEmpty && value.length == 0) {
			return true;
		}

		if (this._options.min) {
			if (field.length >= this._options.min) {
				valid = true;
			} else {
				string message = this._options.messageMinimum;

				if (message.length == 0) {
					message = validation.getDefaultMessage("TooShort");
				}

				validation.appendMessage(new Message(format(message, label, this._options.min), field, "TooShort"));
				return false;
			}
		}

		if (this._options.max) {
			valid = (field.length <= this._options.max);

			if (!valid) {
				string message = this._options.messageMaximum;

				if (message.length == 0) {
					message = validation.getDefaultMessage("TooLong");
				}
				validation.appendMessage(new Message(format(message, label, this._options.max), field, "TooLong"));
				return false;
			}
		}

		return valid;
	}
}

unittest
{
	// WITH VALIDATOR

	auto validation = new Validation();

	auto options = StringOptions();
		 options.max = 10;

	StringLength test = new StringLength(options);
	assert(test.validate(validation, "test") == true);
	assert(test.validate(validation, "testtesttesttestetetetetetete") == false);
	assert(validation.isValid() == false);

	///// SIMPLE

	test = new StringLength(StringOptions(2,50));
	assert(test.validate("test") == true);
	assert(test.validate("t") == false);

	options = StringOptions();
		 options.max = 10;

	test = new StringLength(options);
	assert(test.validate("test") == true);
	assert(test.validate("testtesttesttestetetetetetete") == false);

	options = StringOptions();
		 options.allowEmpty = true;
		 options.max = 10;
		 options.min = 2;

	test = new StringLength(options);
	assert(test.validate("") == true);
	assert(test.validate("test") == true);
	assert(test.validate("testtesttesttestetetetetetete") == false);
	assert(test.validate("t") == false);
}
