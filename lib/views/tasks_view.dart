import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/services/db.dart';
import 'package:todo/widgets/tasks_list.dart';

class TasksView extends StatefulWidget {
  @override
  _TasksViewState createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  TextEditingController _controller = TextEditingController();

  _addTask() {
    if (_controller.text != '') {
      DatabaseService().addTask(_controller.text);

      _controller.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: TasksList(
          header: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      "Todo",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    // boxShadow: <BoxShadow>[
                    //   BoxShadow(
                    //     color: Color.fromRGBO(0, 0, 0, 0.1),
                    //     blurRadius: 10,
                    //     offset: Offset(0, 2.5),
                    //   ),
                    // ],
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Add Task',
                    ),
                    onSubmitted: (_) => _addTask(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
