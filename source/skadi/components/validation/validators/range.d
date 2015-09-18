/**
 * Skadi.d Web Framework
 * Validation Component

 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module skadi.components.validation.validators.range;

import skadi.components.validation.validatorInterface;
import skadi.components.validation.validation;
import skadi.components.validation.validator;
import skadi.components.validation.message;

import std.string;
import std.ascii;
import std.algorithm;
import std.conv;
import std.stdio;

/**
 * Check for alphabetic character(s)

 * Check Unittests for examples at the bottom of the file.
 */
struct RangeOptions
{
	int min;
	int max;
	string label;
	bool allowEmpty = false;
	string message;
}

class Range : Validator
{

	protected RangeOptions _options;

	/**
	 * constructor
	 */
	this(RangeOptions options)
	{
		this._options = options;
	}

	bool validate(string field = null)
	{
		bool valid = false;

		if (this._options.allowEmpty && field.length == 0) {
			return true;
		}

		int value = to!(int)(field);

		if (!this._options.min || !this._options.max) {
			throw new Exception("A minimum and a maximum must be set.");
		}

		if (value < this._options.min || value > this._options.max) {
			return false;
		}

		return true;
	}


	/**
	*  For the form component
	 * Executes the validation
	 */
	override bool validate(Validation validation, string field = null)
	{
		bool valid = false;

		if (this._options.allowEmpty && validation.getValue(field).length == 0) {
			return true;
		}

		int value = to!(int)(validation.getValue(field));

		if (!this._options.min || !this._options.max) {
			throw new Exception("A minimum and a maximum must be set.");
		}

		if (value < this._options.min || value > this._options.max) {

			string label = (this._options.label.length == 0)
							? validation.getLabel(field)
							: this._options.label;

			string message = this._options.message;

			if (message.length == 0) {
				message = validation.getDefaultMessage("Range");
			}

			validation.appendMessage(new Message(format(message, label, this._options.min, this._options.max), field, "Range"));
			return false;
		}

		return true;
	}

}

unittest
{
	// WITH VALIDATOR
	auto validation = new Validation();

	auto options = RangeOptions();
		options.min = 10;
		options.max = 15;

	Range test = new Range(options);
	assert(test.validate(validation, "11") == true);
	assert(test.validate(validation, "12") == true);
	assert(test.validate("9") == false);
	assert(test.validate("16") == false);

}
