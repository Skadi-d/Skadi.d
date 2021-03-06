/**
 * Skadi.d Web Framework
 *
 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module skadi.core.kernel;

import std.functional;
import std.typetuple;
import std.stdio;
import std.file;
import std.format;
import std.traits;

import vibe.d;
import skadi.core.container;
import skadi.core.router;
import skadi.utils.dynamic;
import skadi.core.namespaces;

static if(__traits(compiles, {
	import config.config;
})) {
  import config.config;
} else {
	enum port = 8080;
	enum bindAddresses = ["::1", "0.0.0.0"];
}

static if(__traits(compiles, {
	import config.namespaces;
})) {
  import config.namespaces;
} else {
	enum Namespace[] namespaces = [];
}

static if(__traits(compiles, {
	import config.container;
})) {
  import config.container;
} else {
	enum Service[] services = [];
}


final class Kernel
{
	URLRouter router;
	HTTPServerSettings settings;

	this ()
	{
		this.buildContainer();
		this.buildRouter();
		this.configureSettings();
	}

	URLRouter getRouter()
	{
		return this.router;
	}

	HTTPServerSettings getSettings()
	{
		return this.settings;
	}

	/**
	* Configure Http Settings settings
	**/
	void configureSettings()
	{
		this.settings = new HTTPServerSettings;
		this.settings.bindAddresses = bindAddresses;
		this.settings.port = port;
	}

	/**
	* Register our services.
	**/
	void buildContainer()
	{
		auto containerIoc = Container.getInstance();
		foreach(Service s; TypeTupleOf!services) {
		    mixin(format(
		        q{
		            import %s;
		            containerIoc.register!(%s);
		        },
		        s.path,
		        s.className
		    ));
		}
	}

	void buildRouter()
	{
		this.router = new URLRouter;
		auto webSettings = new WebInterfaceSettings;

		foreach(Namespace i; TypeTupleOf!namespaces) {

			if (i.controllers !is null) {
				enum Controller[] controllers = i.controllers;

				foreach(Controller controller; TypeTupleOf!controllers)
				{
					if (controller.prefix) {
						webSettings.urlPrefix = controller.prefix;
						mixin(format(
							q{
								import Application.%s.Controller.%s;
								this.router.registerWebInterface(new %s(), webSettings);
						 	},
							i.bundle,
							controller.name,
							controller.name,
						));
					} else {
						mixin(format(
							q{
								import Application.%s.Controller.%s;
								this.router.registerWebInterface(new %s());
							},
							i.bundle,
							controller.name,
							controller.name,
						));
					}
				}

			}
		}

	}

	void boot()
	{
		listenHTTP(this.settings, this.router);
	}

}
