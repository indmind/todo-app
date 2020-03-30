import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final Function(Task) onDelete;
  final Function({Task task, bool state}) onCheck;

  TaskItem({this.task, this.onDelete, this.onCheck});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 100),
        opacity: task.done ? 0.2 : 1,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          decoration: BoxDecoration(
            color: task.done
                ? Theme.of(context).primaryColor
                : Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Checkbox(
                  value: task.done,
                  onChanged: (state) {
                    if (onCheck != null) {
                      onCheck(state: state, task: task);
                    }
                  }),
              Text(
                task.name,
                style: TextStyle(
                  fontSize: 18,
                  decoration: task.done
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('delete ${task.name}');

                  if (onDelete != null) {
                    onDelete(task);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
