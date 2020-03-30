import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/models/task.dart';

class DatabaseService {
  final CollectionReference _tasksRef = Firestore.instance.collection('tasks');

  Stream<List<Task>> streamAllTasks() {
    return _tasksRef.orderBy('created', descending: true).snapshots().map(
          (list) =>
              list.documents.map((doc) => Task.fromFirestore(doc)).toList(),
        );
  }

  Future<void> addTask(String taskName) {
    Map task = Map<String, dynamic>();

    task["name"] = taskName;
    task["done"] = false;
    task["created"] = Timestamp.now();

    return _tasksRef.add(task);
  }

  Future<void> setTaskDone(Task task, bool state) {
    return _tasksRef.document(task.id).updateData({'done': state});
  }

  Future<void> deleteTask(Task task) {
    return _tasksRef.document(task.id).delete();
  }
}
