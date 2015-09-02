module Application.PostBundle.Services.MongoService;

import vibe.d;

class MongoService
{
   private MongoClient client;

   this ()
   {
       this.client = connectMongoDB("127.0.0.1");
   }

   MongoClient getClient()
   {
       return this.client;
   }

}
