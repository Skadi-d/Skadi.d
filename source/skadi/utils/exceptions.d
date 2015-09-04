/**
 * Skadi.d Web Framework
 *
 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module skadi.utils.exceptions;

/// Base exception for all exceptions in Serenity
abstract class SkadiBaseException : Exception
{
    protected ushort mCode = 500;

    /**
     * Constructor for SkadiBaseException
     *
     * Params:
     *  msg = Exception message
     *  code = HTTP status code to use when uncaught
     */
    this(string msg, ushort code=500, string file="", size_t line=0)
    {
        mCode = code;
        super(msg, file, line);
    }

    /**
     * HTTP status code for this exception
     *
     * Returns:
     *  HTTP status code to use when this exception is uncaught
     */
    ushort getCode()
    {
        return mCode;
    }
}

/// Create an exception class with the given name ~ "Exception"
mixin template SkadiException(string name, string code="500", string file=__FILE__, size_t line=__LINE__)
{
    mixin(`class ` ~ name ~ `Exception : SkadiBaseException
           {
               /// code is used to set the HTTP status code when uncaught
               this(string msg, ushort code=` ~ code ~ `)
               {
                   super(msg, code, "` ~ file ~ `", ` ~ line.stringof ~ `);
               }
           }`);
}
