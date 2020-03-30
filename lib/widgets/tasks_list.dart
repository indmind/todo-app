import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'package:todo/services/db.dart';
import 'package:todo/widgets/task_item.dart';

class TasksList extends StatelessWidget {
  @required
  final Widget header;

  const TasksList({Key key, this.header}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DatabaseService db = DatabaseService();

    return StreamBuilder<List<Task>>(
        stream: db.streamAllTasks(),
        builder: (BuildContext context, AsyncSnapshot<List<Task>> tasks) {
          if (tasks.hasError) return Text("{Error ${tasks.error}");

          switch (tasks.connectionState) {
            case ConnectionState.waiting:
              return Text('Loading...');
            default:
              List<Task> tasksData = tasks.data;

              // return AnimatedList(
              //   initialItemCount: tasksData.length,
              //   itemBuilder: (_, index, animation) {
              //     return TaskItem(
              //       task: tasksData[index],
              //       onCheck: ({task, state}) {
              //         db.setTaskDone(task, state);
              //       },
              //       onDelete: (task) {
              //         db.deleteTask(task);
              //       },
              //     );
              //   },
              // );

              return ListView.builder(
                itemCount: tasksData.length == null ? 1 : tasksData.length + 1,
                itemBuilder: (_, index) {
                  if (index == 0) {
                    return header;
                  }

                  index -= 1;

                  return TaskItem(
                    task: tasksData[index],
                    onCheck: ({task, state}) {
                      db.setTaskDone(task, state);
                    },
                    onDelete: (task) {
                      db.deleteTask(task);
                    },
                  );
                },
              );
          }
        });
  }
}
