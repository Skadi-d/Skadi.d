/**
 * Skadi.d Web Framework
 *
 * component/string - PHP alike functions.
 *
 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module skadi.components.string.transform;

string ctToLower(string str) pure
{
    char[] mstr = str.dup;
    foreach(i, c; mstr)
    {
        if (c >= 'A' && c <= 'Z')
        {
            mstr[i] += 32;
        }
    }
    return mstr.idup;
}

/**
 * Quick and dirty hack for making the first character of a string lower case
 *
 * Note: The first character must be upper case
 *
 * Params:
 *  str = string to operate on
 * Returns:
 *  Same string but with the first character using lowercase
 */
string lcfirst(string str)
{
    assert(str[0] >= 'A' && str[0] <= 'Z');
    return cast(char)(str[0]+32) ~ str[1..$];
}

/**
 * Quick and dirty hack for making the first character of a string upper case
 *
 * Note: The first character must be lower case
 *
 * Params:
 *  str = string to operate on
 * Returns:
 *  Same string but with the first character using uppercase
 */
string ucfirst(string str)
{
    assert(str[0] >= 'a' && str[0] <= 'z');
    return cast(char)(str[0]-32) ~ str[1..$];
}
