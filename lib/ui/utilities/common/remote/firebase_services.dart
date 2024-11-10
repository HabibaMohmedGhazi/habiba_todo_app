import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../model/task_dm.dart';

class FirebaseServices {
  static CollectionReference<TaskDM> getTaskCollection() => FirebaseFirestore
      .instance
      .collection(
          'tasks') //  if there is no collection with this name it will create it
      .withConverter<TaskDM>(
        fromFirestore: (snapshot, _) => TaskDM.fromJason(snapshot.data() ?? {}),
        toFirestore: (value, _) => value.toJason(),
      );
  // the line above will make it easier to push and pull the data with firestore

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
}
