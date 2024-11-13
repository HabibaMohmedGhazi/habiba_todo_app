/*

- the data that is stored in firebase must have a unique id
- so we have to but an id in the task jason to use it when needed
- flutterfire will help you in flutter with firebase
- to convert from and to timestamp that is used in firebase you have to use cloud_firestore
- the data model (dm) is a class that carry data
- we use try and catch with the things that deals with backend because if there is an error
  in this part of code it will not crash and help you know where is the problem
- Always try to find things that do not need context in the logic parts as you can not send
  context to the logic part
- We always want to separate the ui and the logic from each other
- we write the type of the provider to use many provider and know which is which
- the double dots ( .. ) in dart allows me to access a function when i crete an object
- using firebase offline is good if this app targets one user and doesn't need authentication
- if you use the app offline you have to put timeout for the things you use (push , delete,add,....)
- the plugin has a native code
- when we add a plugin you have to reload the app again as you changed in the native
- the difference between the plugin and the package is important
- the const happens in the compile time while the final happens in
  the run time
- adding const make your app more efficient
- if the constructor of the class is const you can make the object const
- to handel that the password make a bollen and use it in the parameter named obscure
- we cannot use spacer inside singleChildScroll view as they both expand
- it is not recommended to put fixed sizes in it
- if you see this error " The argument type 'String?' can't be assigned to the parameter type 'String'. (Documentation)"
  this means that he needs a nullable data so put this " ! "
- if you see in the error " C:\Users\bibig\StudioProjects\my_todo_app\android\app\build.gradle:                           │
│ android {                                                                                     │
│   defaultConfig {                                                                             │
│     minSdkVersion 23                                                                          │
│   }                                                                                           │
│ }   "

change the thing he told you in the location given
- if I say ( x is y ) the compiler check if these are the main type
*/
