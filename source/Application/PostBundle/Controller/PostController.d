module Application.PostBundle.Controller.PostController;

import vibe.d;
import std.stdio;
import skadi.core.container;
import Application.PostBundle.Services.PostManager;
import skadi.core.controller;

class PostController : Controller
{
	this ()
	{
		super();
	 	postManager = this.container.resolve!PostManager;
	}

	@path("/")
	void index()
	{
		render!("index.dt");
	}

	@path("/fodasse")
	void getFodasse(HTTPServerRequest req, HTTPServerResponse res)
	{
		res.writeJsonBody("SADSADASD");
	}

	Json getPost()
	{
		return postManager.getPost();
	}

	@path("/name/:name")
	Json getPost(HTTPServerRequest req, HTTPServerResponse res)
	{
		auto name = req.params["name"];
		return postManager.getPost(name);
	}

private:
    PostManager postManager;

}
