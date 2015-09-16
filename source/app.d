/**
 * Skadi.d Web Framework
 *
 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
import skadi.framework;
import skadi.components.form.form;
import skadi.components.form.elements.text;
import std.stdio;

void errorPage(HTTPServerRequest req, HTTPServerResponse res, HTTPServerErrorInfo error)
{
	res.render!("error.dt", req, error);
}

shared static this()
{
	/*import skadi.components.validation.validators.stringlength;
	import skadi.components.validation.validation;

	auto form = new Form();

	form.add(
			new Text("name")
				.addFilter("test")
	);*/

	auto kernel = new Kernel();
	kernel.getSettings().errorPageHandler = toDelegate(&errorPage);

	// Assets
	kernel.getRouter().get("*", serveStaticFiles("./public/"));
	kernel.boot();
}
