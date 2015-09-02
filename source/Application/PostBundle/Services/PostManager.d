module Application.PostBundle.Services.PostManager;

import skadi.core.container;
import Application.PostBundle.Services.MongoService;
import std.stdio;
import vibe.d;

class PostManager
{

   @Autowire
   public MongoService mongoService;

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
