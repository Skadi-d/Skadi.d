import skadi.framework;

void errorPage(HTTPServerRequest req, HTTPServerResponse res, HTTPServerErrorInfo error)
{
	res.render!("error.dt", req, error);
}

shared static this()
{
	auto kernel = new Kernel();
	kernel.getSettings().errorPageHandler = toDelegate(&errorPage);
	kernel.getRouter().get("*", serveStaticFiles("./public/"));
	kernel.boot();
}
