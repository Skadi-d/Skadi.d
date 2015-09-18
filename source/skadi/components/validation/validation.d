/**
 * Skadi.d Web Framework
 * Validation Component

 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module skadi.components.validation.validation;

import skadi.components.validation.messageinterface;
import skadi.components.validation.messagelist;

/**
 * Allows to validate data using custom or built-in validators
 */
class Validation
{

protected:
    MessageList _messages;

    string[string] _labels;

    enum string[string] _defaultMessages = [
       "Alnum": "Field %s must contain only letters and numbers",
       "Alpha": "Field %s must contain only letters",
       "Range": "Field %s must be within the range of %d to %d",
       "Confirmation": "Field %s must be the same as :with",
       "Digit": "Field %s must be numeric",
       "Email": "Field %s must be an email address",
       "ExclusionIn": "Field %s must not be a part of list: %s",
       "FileEmpty": "Field %s must not be empty",
       "FileIniSize": "File %s exceeds the maximum file size",
       "FileMaxResolution": "File %s must not exceed %d resolution",
       "FileMinResolution": "File %s must be at least %d resolution",
       "FileSize": "File %s exceeds the size of %d",
       "FileType": "File %s must be of type: :types",
       "FileValid": "Field %s is not valid",
       "Identical": "Field %s does not have the expected value",
       "InclusionIn": "Field %s must be a part of list: %s",
       "Numericality": "Field %s does not have a valid numeric format",
       "PresenceOf": "Field %s is required",
       "Regex": "Field %s does not match the required format",
       "TooLong": "Field %s must not exceed %d characters long",
       "TooShort": "Field %s must be at least %d characters long",
       "Uniqueness": "Field %s must be unique",
       "Url": "Field %s must be a url"
   ];

public:

    this()
    {
        this._messages = new MessageList();
    }

    /**
	 * Get default message for validator type
	 *
	 * @param string type
	 */
	string getDefaultMessage(string type)
	{
        if (type !in this._defaultMessages) {
			return "";
		}
		return this._defaultMessages[type];
	}

	/**
	 * Appends a message to the messages list
	 */
	Validation appendMessage(MessageInterface message)
	{
		this._messages.appendMessage(message);
		return this;
	}

    /**
	 * Returns the registered validators
	 */
	MessageList getMessages()
	{
		return this._messages;
	}

    /**
	 * Get label for field
	 *
	 * @param string field
	 * @return string
	 */
	string getLabel(string field)
	{
        if (field !in this._labels) {
			return field;
		}
		return this._labels[field];
	}

	/**
	 * Gets the a value to validate
	 */
	string getValue(string field)
	{
        return field;
	}

    bool isValid()
    {
        return this._messages.isEmpty();
    }

}
