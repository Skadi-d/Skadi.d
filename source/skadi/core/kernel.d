module skadi.core.kernel;

import vibe.d;
import skadi.core.container;
import skadi.core.router;
import skadi.utils.dynamic;
import skadi.core.namespaces;
import std.functional;
import std.typetuple;
import std.stdio;
import std.file;
import std.format;
import std.traits;
import config.namespaces;
import config.config;
import config.container;


final class Kernel
{
	void boot()
	{
		this.buildContainer();

		auto settings = new HTTPServerSettings;
		settings.errorPageHandler = toDelegate(&errorPage);
		settings.port = port;

		listenHTTP(settings, this.buildRouter());
	}

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

	URLRouter buildRouter()
	{
		auto router = new URLRouter;
		auto settings = new HTTPServerSettings;
		auto webSettings = new WebInterfaceSettings;

		foreach(Namespace i; TypeTupleOf!namespaces) {

			if (i.controllers !is null) {
				enum Controller [] controllers = i.controllers;

				foreach(Controller controller; TypeTupleOf!controllers)
				{
					if (controller.prefix) {
						webSettings.urlPrefix = controller.prefix;
						mixin(format(
							q{
								import Application.%s.Controller.%s;
								router.registerWebInterface(new %s(), webSettings);
						 	},
							i.bundle,
							controller.name,
							controller.name,
						));
					} else {
						mixin(format(
							q{
								import Application.%s.Controller.%s;
								router.registerWebInterface(new %s());
							},
							i.bundle,
							controller.name,
							controller.name,
						));
					}
				}

			}

		}

		return router;
	}
}

void errorPage(HTTPServerRequest req, HTTPServerResponse res, HTTPServerErrorInfo error)
{
	res.render!("error.dt", req, error);
}
