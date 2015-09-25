/**
 * Skadi.d Web Framework
 *
 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module Application.PostBundle.Services.PostManager;

import Application.PostBundle.Services.MongoService;
import Application.PostBundle.Services.TestService;
import skadi.framework;
import std.stdio;

class PostManager
{

    @Inject {
        public MongoService mongoService;
        public TestService testService;
    }

   Json getPost()
   {
       auto coll = this.mongoService.getClient().getCollection("test.nettuts");
       return Json(coll.find!Json.array);
   }

   Json getPost(string name)
   {
       auto coll = this.mongoService.getClient().getCollection("test.nettuts");
       auto result = coll.findOne(["first": name]);
       return result.toJson();
   }

}
