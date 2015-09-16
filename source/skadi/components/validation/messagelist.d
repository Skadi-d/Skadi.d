/**
 * Skadi.d Web Framework
 * Validation Component

 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module skadi.components.validation.messagelist;

import skadi.components.validation.messageinterface;

class MessageList
{

protected:
	MessageInterface[] _messages;

public:

	/**
	 * Appends a message to the group
	 */
	void appendMessage(MessageInterface message)
	{
		this._messages ~= message;
	}

	/**
	 * Appends an array of messages to the group
	 */
	void appendMessages(MessageInterface[] messages)
	{
		this._messages ~= messages;
	}

    bool isEmpty()
    {
        return (this._messages.length == 0);
    }

	/**
	 * Filters the message group by field name
	 */
	MessageInterface[] filter(string fieldName)
	{
        MessageInterface[] filtered;

	     /**
		 * A group of messages is iterated and appended one-by-one to the current list
		 */
		foreach(MessageInterface message; this._messages) {
			if (fieldName == message.getField()) {
				filtered ~= message;
			}
		}

		return filtered;
	}

}
