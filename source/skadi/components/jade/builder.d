/**
 * Skadi.d Web Framework
 * Validation Component

 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module skadi.components.jade.builder;

import std.stdio;
import std.traits;
import std.typetuple;

/**
* Html attributes in order to be used.
**/
struct HTMLAttributes
{
    string rel;
    string type;
    string src;
    string href;
    string action;
    string id;
    string classes;
    string forAttr;
    string name;
    string value;
    string style;
}


class Builder
{

static:

    /**
	 * Renders parameters keeping order in their HTML attributes
	 */
	string renderAttributes(string code, HTMLAttributes attributes)
	{
        foreach (string field; TypeTuple!(__traits(derivedMembers, HTMLAttributes))) {
            if(string s = __traits(getMember, attributes, field) ) {

                string fieldAttr;

                // Hack for the class keyword
                if (field == "classes") {
                    fieldAttr = "class";
                } else {
                    fieldAttr = field;
                }

                code ~= " "  ~ fieldAttr ~ "=\"" ~ s  ~ "\"";
            }
        }

		return code;
	}
}

unittest
{
    auto attr = HTMLAttributes();
		attr.value = "lol";
		attr.type = "text";
		attr.classes = "super-class test2";
		attr.style = "display:none;";

	string jade = Builder.renderAttributes(".input", attr);
	assert(jade == ".input type=\"text\" class=\"super-class test2\" value=\"lol\" style=\"display:none;\"");
}
