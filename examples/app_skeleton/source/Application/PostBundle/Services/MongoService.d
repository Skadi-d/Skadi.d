/**
 * Skadi.d Web Framework
 *
 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module Application.PostBundle.Services.MongoService;

import skadi.framework;

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
