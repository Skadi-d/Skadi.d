/**
 * Skadi.d Web Framework
 * Validation Component

 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module skadi.components.validation.messageinterface;

import skadi.components.validation.message;

interface MessageInterface
{

	/**
	 * Sets message type
	 */
	Message setType(string type);

	/**
	 * Returns message type
	 */
	string getType();

	/**
	 * Sets verbose message
	 */
	Message setMessage(string message);

	/**
	 * Returns verbose message
	 *
	 * @return string
	 */
	string getMessage();

	/**
	 * Sets field name related to message
	 */
	Message setField(string field);

	/**
	 * Returns field name related to message
	 *
	 * @return string
	 */
	string getField();

	/**
	 * Magic toString method returns verbose message
	 */
	string toString();

}
