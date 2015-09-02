module Application.PostBundle.Services.PostManager;

import Application.PostBundle.Services.MongoService;
import Application.PostBundle.Services.TestService;
import skadi.framework;

class PostManager
{

   Json getPost()
   {
       string[] test = ["SSDADSA", "sadsadasdas", "sdadsads"];
       return serializeToJson(test);
       /*auto coll = this.mongoService.getClient().getCollection("test.nettuts");
       return Json(coll.find!Json.array);*/
   }

   Json getPost(string name)
   {
       auto coll = this.mongoService.getClient().getCollection("test.nettuts");
       auto result = coll.findOne(["first": name]);
       return result.toJson();
   }

   @Autowire {
       public MongoService mongoService;
       public TestService testService;
   }

}
