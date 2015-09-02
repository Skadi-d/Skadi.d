module skadi.core.kernel;

import skadi.core.container;
import std.functional;
import std.typetuple;
import std.stdio;
import std.file;
import std.format;
import vibe.d;
import skadi.core.router;
import utils.typetupleof;
import Application.PostBundle.Services.PostManager;
import config.namespaces;
import config.config;
import std.traits;

void errorPage(HTTPServerRequest req, HTTPServerResponse res, HTTPServerErrorInfo error)
{
	res.render!("error.dt", req, error);
}

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
		MongoClient client;
		client = connectMongoDB("127.0.0.1");

		auto containerIoc = Container.getInstance();
		containerIoc.register!(MongoClient).existingInstance(client);
		containerIoc.register!PostManager;
	}

	URLRouter buildRouter()
	{
		auto router = new URLRouter;
		auto settings = new HTTPServerSettings;
		auto webSettings = new WebInterfaceSettings;

		foreach(Namespace i; TypeTupleOf!namespaces)
		{
			if (i.controllers !is null)
			{
				enum Controller [] controllers = i.controllers;
				foreach(Controller controller; TypeTupleOf!controllers)
				{
					if (controller.prefix)
					{
						webSettings.urlPrefix = controller.prefix;
						mixin(format(
							q {
								import Application.%s.Controller.%s;
								router.registerWebInterface(new %s(), webSettings);
							},
							i.bundle,
							controller.name,
							controller.name,
						));
					}
					else
					{
						mixin(format(
						q {
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
