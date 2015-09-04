/**
 * Skadi.d Web Framework
 *
 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module Application.PostBundle.Controller.PostController;

import Application.PostBundle.Services.PostManager;
import skadi.framework;

class PostController : SkadiController
{
	this ()
	{
		super();
	 	postManager = this.container.resolve!PostManager;
	}

	@path("/")
	void index()
	{
		string author = "Miguel Ferreira";
		render!("index.dt", author);
	}

	@path("/fodasse")
	void getFodasse(HTTPServerRequest req, HTTPServerResponse res)
	{
		res.writeJsonBody("SADSADASD");
	}

	Json getPost()
	{
		string[] test = [
			"test",
			"test2",
			"test3",
			"test4"
		];

		return serializeToJson(test);
		//return postManager.getPost();
	}

	@path("/name/:name")
	Json getPost(HTTPServerRequest req, HTTPServerResponse res)
	{
		auto name = req.params["name"];
		return Json(name);
		/*auto name = req.params["name"];
		return postManager.getPost(name);*/
	}

private:
    PostManager postManager;

}
