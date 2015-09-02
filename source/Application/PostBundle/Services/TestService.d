module Application.PostBundle.Services.TestService;

import skadi.framework;
import Application.PostBundle.Services.MongoService;
import std.stdio;

class TestService
{

   @Autowire
   public MongoService mongoService;

}
