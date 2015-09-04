# Skadi.d
Skadi MVC Web Framework D language

 ----------

### More documentation to come. Check the Application folder for examples.

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
