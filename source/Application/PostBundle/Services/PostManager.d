module Application.PostBundle.Services.PostManager;

import Application.PostBundle.Services.MongoService;
import skadi.framework;

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
