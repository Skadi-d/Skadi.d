/**
 * Skadi.d Web Framework
 *
 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module Application.PostBundle.Controller.DefaultController;

import Application.PostBundle.Services.PostManager;
import Application.PostBundle.Forms.contactform;
import skadi.framework;
import std.stdio;

class DefaultController : SkadiController
{
	this ()
	{
		super();
	 	postManager = this.container.resolve!PostManager;
	}

	@path("/about-us")
	void getAboutUs()
	{
		render!("about-us.dt");
	}

	@path("/contact-us")
	void getContactUs(HTTPServerRequest req, HTTPServerResponse res)
	{
		ContactForm form = new ContactForm();

		writeln(req.form);

		res.render!("contact-us.dt", form);
	}

private:
    PostManager postManager;

}
