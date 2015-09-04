/**
 * Skadi.d Web Framework
 *
 * core/logger - Logger.
 *
 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module skadi.core.Log;

import std.stream;
import std.string;

version(X86_64) import core.vararg;

class Logger
{
    private string mName;
    this(string name)
    {
        mName = name;
    }

    void info(T...)(string msg, T args)
    {
        Log.mStream.writeLine(format("[info] [%s]: " ~ msg, mName, args));
    }

    bool error() { return true; }
    void error(string,...) {}
}

static class Log
{
    /// Logging style
    enum Type
    {
        None   = 0,
        Stdout = 1 << 0,
        Stderr = 1 << 1,
        File   = 1 << 2,
        Files  = 1 << 3,
        Mail   = 1 << 4,
        Socket = 1 << 5
    }
    enum Level
    {
        Trace,
        Info,
        Warn,
        Error,
        Fatal
    }

    private static OutputStream mStream;
    private static string mFileFile;
    private static int mFileCount;
    private static long mFileSize;

    /**
     * Set the logging type
     *
     * Params:
     *  type = |'d list of logging types
     */
    static void type(Type type)
    {

    }

    /**
     * Get the logger with the given name
     *
     * Params:
     *  name = name of the logger
     * Returns:
     *  The requested logger
     */
    static Logger getLogger(string name)
    {
        return new Logger(name);
    }

    static package void setStream(OutputStream os)
    {
        mStream = os;
    }

    /**
     * Log a generic debugging error message
     *
     * Params:
     *  message = message to print
     *  params  = parameters, if any for formatting
     */
    debug static void error(T...)(string message, T params)
    {
        mStream.writeLine(format("[debug]: " ~ message, params));
    }

    /**
     * Set the logging level
     *
     * Params:
     *  level = minimum level to log
     * See_Also:
     *  tango.util.log.Log.Logger.Level
     */
    static void level(Level level)
    {
        //TangoLog.root.level(level, true);
    }

    /**
     * Set the options for Type.File and Type.Files logging
     *
     * Params:
     *  file = (Base) file to log to
     *  noFiles = Number of files to log to
     *  maxSize = Maximum log file size before rotation
     */
    static void setFileOptions(string file, int noFiles=0, long maxSize=0)
    {
        mFileFile = file;
        mFileCount = noFiles;
        mFileSize = maxSize;
    }
}
