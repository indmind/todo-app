import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String id;
  final String name;
  final bool done;
  final Timestamp created;

  Task({this.id, this.name, this.done, this.created});

  factory Task.fromMap(Map<String, dynamic> data) {
    return Task(
      id: '',
      name: data['name'],
      done: data['done'],
      created: data['created'],
    );
  }

  factory Task.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Task(
      id: doc.documentID,
      name: data['name'],
      done: data['done'],
      created: data['created'],
    );
  }
}
