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
