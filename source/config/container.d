/**
 * Skadi.d Web Framework
 *
 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module config.container;

import skadi.framework;

enum Service[] services = [
	Service("post.manager.service", "Application.PostBundle.Services.PostManager"),
	Service("mongo.service", "Application.PostBundle.Services.MongoService"),
	Service("test.service", "Application.PostBundle.Services.TestService"),
];
