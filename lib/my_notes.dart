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

*/
