/**
 * Skadi.d Web Framework
 * Validation Component

 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module skadi.components.validation.message;

import skadi.components.validation.messageinterface;

class Message : MessageInterface
{

protected:

	string _type;
	string _message;
	string _field;

public:
	/**
	 * @param string message
	 * @param string field
	 * @param string type
	 */
	this(string message, string field = null, string type = null)
	{
		this._message = message,
		this._field = field,
		this._type = type;
	}

	/**
	 * Sets message type
	 */
	Message setType(string type)
	{
		this._type = type;
		return this;
	}

	/**
	 * Returns message type
	 */
	string getType()
	{
		return this._type;
	}

	/**
	 * Sets verbose message
	 */
	Message setMessage(string message)
	{
		this._message = message;
		return this;
	}

	/**
	 * Returns verbose message
	 */
	string getMessage()
	{
		return this._message;
	}

	/**
	 * Sets field name related to message
	 */
	Message setField(string field)
	{
		this._field = field;
		return this;
	}

	/**
	 * Returns field name related to message
	 *
	 * @return string
	 */
	string getField()
	{
		return this._field;
	}

	/**
	 * Magic toString method returns verbose message
	 */
	override string toString()
	{
		return this._message;
	}

}
