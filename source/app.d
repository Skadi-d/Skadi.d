/**
 * Skadi.d Web Framework
 *
 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
import skadi.framework;
import Application.PostBundle.Forms.contactform;

import std.stdio;

void errorPage(HTTPServerRequest req, HTTPServerResponse res, HTTPServerErrorInfo error)
{
	res.render!("error.dt", req, error);
}

shared static this()
{
	auto form = new ContactForm();

	string[string] testinput = ["name": "11"];

	writeln(form.render("name"));

	if ( form.isValid(testinput) ) {
		writeln("YYYYYYYESSS");
	} else {
		foreach(message; form.getMessages()) {
			writeln(message.getField());
			writeln(message.getType());
			writeln(message.getMessage());
		}

	}

	/*auto kernel = new Kernel();
	kernel.getSettings().errorPageHandler = toDelegate(&errorPage);

	// Assets
	kernel.getRouter().get("*", serveStaticFiles("./public/"));
	kernel.boot();*/
}
