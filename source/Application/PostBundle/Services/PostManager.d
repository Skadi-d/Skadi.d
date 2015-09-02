module Application.PostBundle.Services.PostManager;

import vibe.d;
import skadi.core.container;
import std.stdio;

class PostManager
{

   @Autowire
   public MongoClient client;

   Json getPost()
   {
       auto coll = this.client.getCollection("test.nettuts");
       return Json(coll.find!Json.array);
   }

   Json getPost(string name)
   {
       auto coll = this.client.getCollection("test.nettuts");
       auto result = coll.findOne(["first": name]);
       return result.toJson();
   }

}
