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

	@path("/post/:id")
	void getPost(HTTPServerRequest req, HTTPServerResponse res)
	{
		auto id = req.params["id"];
		res.render!("post.dt", id);
	}

	Json getPost()
	{
		string[] test = [
			"test",
			"test2",
			"test3",
			"test4"
		];

		//return serializeToJson(test);
		return postManager.getPost();
	}

private:
    PostManager postManager;

}
