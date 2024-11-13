import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_todo_app/ui/model/user_dm.dart';
import '../../../model/task_dm.dart';

class FirebaseServices {
  static CollectionReference<TaskDM> getTaskCollection() => getUserCollection()
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection(
          'tasks') //  if there is no collection with this name it will create it
      .withConverter<TaskDM>(
        fromFirestore: (snapshot, _) => TaskDM.fromJason(snapshot.data() ?? {}),
        toFirestore: (value, _) => value.toJason(),
      );
  // the line above will make it easier to push and pull the data with firestore
  static CollectionReference<TheUserDM> getUserCollection() => FirebaseFirestore
      .instance
      .collection(
          'users') //  if there is no collection with this name it will create it
      .withConverter<TheUserDM>(
        fromFirestore: (snapshot, _) =>
            TheUserDM.fromJason(snapshot.data() ?? {}),
        toFirestore: (value, _) => value.toJason(),
      );

  static addTask(TaskDM task) {
    CollectionReference<TaskDM> tasksCollection = getTaskCollection();
    DocumentReference<TaskDM> documentReference =
        tasksCollection.doc(); // this create document with a unique id
    task.theId = documentReference.id;
    return documentReference.set(task);
  }

  static Future<void> deleteTask(String id) {
    CollectionReference<TaskDM> tasksCollection = getTaskCollection();
    return tasksCollection.doc(id).delete();
  }

  // this function gets all the data in the collection in the firebase
  static Future<List<TaskDM>> getTasks() async {
    CollectionReference<TaskDM> tasksCollection = getTaskCollection();
    QuerySnapshot<TaskDM> tasksQuery = await tasksCollection.get();
    return tasksQuery.docs
        .map((e) => e.data())
        .toList(); // this will return list of query docs then by using ' .map ' it convert it to list
  }

  static Future<List<TaskDM>> getTasksByDate(DateTime selectedDate) async {
    CollectionReference<TaskDM> tasksCollection = getTaskCollection();
    QuerySnapshot<TaskDM> tasksQuery = await tasksCollection
        .where('theDate', isEqualTo: Timestamp.fromDate(selectedDate))
        .get();
    return tasksQuery.docs
        .map((e) => e.data())
        .toList(); // this will return list of query docs then by using ' .map ' it convert it to list
  }

  static login(String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    userCredential.user?.uid; // to get the user Id
    log('${userCredential.user?.uid}');
    getUser();
  }

  static Future<TheUserDM> signUp(
      TheUserDM userDataModel, String password) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: userDataModel.theEmail!,
      password: password,
    );
    userCredential.user?.uid; // to get the user Id
    log('${userCredential.user?.uid}');
    userDataModel.theId = userCredential.user?.uid;
    await creatUser(userDataModel);
    return userDataModel;
  }

  // the function below check if the given user is available or not
  static Future<TheUserDM?> getUser() async {
    DocumentSnapshot<TheUserDM> documentSnapshot = await getUserCollection()
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return documentSnapshot.data();
  }

  static Future<void> creatUser(TheUserDM userDataModel) async {
    return await getUserCollection()
        .doc(userDataModel.theId)
        .set(userDataModel);
  }
  static Future<void>  logOut()async
  {
  await FirebaseAuth.instance.signOut();
  }
}
