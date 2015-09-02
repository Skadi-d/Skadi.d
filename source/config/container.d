module config.container;

import skadi.core.container;

enum Service[] services = [
	Service("post.manager.service", "Application.PostBundle.Services.PostManager"),
	Service("mongo.service", "Application.PostBundle.Services.MongoService")
];
