# Skadi.d
Skadi MVC Web Framework D language on top of Vibe.d

 ----------

### More documentation to come.
Still in a early stage.

Installation
-------------------


```
  git clone https://github.com/Faianca/Skadi.d.git 
```
```
  cd Skadi.d
```  
```
  dub
```  

Config
-------------

At the source/config folder you have a few config files.

##### Config.d 
  - Configure Port
  
##### Namespaces.d
 - To register a new bundle 
 
  ```
 enum Namespace[] namespaces = [
	    Namespace("PostBundle", [
	        Controller("PostController", "/")
	    ]),
];
  ```
Application/PostBundle/Controller/PostController.d  with a prefix route match "/"

  ```
 enum Namespace[] namespaces = [
	    Namespace("ApiBundle", [
	        Controller("PostController", "/api/post"),
	        Controller("UserController", "/api/user")
	    ]),
];
```

	Application/ApiBundle/Controller/PostController.d  with a prefix route match "/api/post"

	Application/ApiBundle/Controller/UserController.d  with a prefix route match "/api/user"

##### Services.d
 - To register new services
  
  To inject them

```
	@Inject {
        public MongoService mongoService;
        public TestService testService;
   }
```

# TODO LISt

At the moment working actively on a form builder for Diet templates.

 1. Event Dispatcher
 2. Model | ORM | ODM
 3. Better router 
 4. Vendor strategy
 5. Logger
 6. Api Helper
