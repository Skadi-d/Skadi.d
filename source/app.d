/**
 * Skadi.d Web Framework
 *
 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
import skadi.framework;
import std.stdio;

void errorPage(HTTPServerRequest req, HTTPServerResponse res, HTTPServerErrorInfo error)
{
	res.render!("error.dt", req, error);
}

shared static this()
{
	import skadi.components.form.form;
	import skadi.components.form.elements.text;
	import skadi.components.validation.validators.stringlength;
	import skadi.components.validation.validation;

	auto form = new Form();

	auto text = new Text("name");
	auto options = StringOptions();
		 options.min = 1;
		 options.max = 50;
	text.addValidator(new StringLength(options));

	form.add(text);

	string[string] testinput = ["name": "a"];

	if ( form.isValid(testinput) ) {
		writeln("YYYYYYYESSS");
	} else {
		writeln("ERROR!");
	}

	/*auto kernel = new Kernel();
	kernel.getSettings().errorPageHandler = toDelegate(&errorPage);

	// Assets
	kernel.getRouter().get("*", serveStaticFiles("./public/"));
	kernel.boot();*/
}
