import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/config/palette.dart';
import 'package:firebase_database/firebase_database.dart';

class ToDo {
  int id = 0;
  bool done = false;
  String work = "";
  String created = "";
  String due = "";
  bool stable = true;

  ToDo(
      {this.id = 0,
      this.done = false,
      this.work = '',
      this.created = '',
      this.due = ''});
}

class SecondPage extends StatefulWidget {
  //const SecondPage({Key? key}) : super(key: key);
  const SecondPage({Key? key, required this.app}) : super(key: key);
  final FirebaseApp app;


  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final referenceDatase = FirebaseDatabase.instance;
  List<ToDo> todos = <ToDo>[];
  final List<TextEditingController> TextControllers = <TextEditingController>[];
  int tempCnt = 0;

  @override
  Widget build(BuildContext context) {
    final ref = referenceDatase.reference();
    void createPlan() {
      setState(() {
        todos.add(ToDo(
            id: todos.length,
            work: 'Plan_$tempCnt wrtie your plan by clikcing edit button on right',
            created: "yy.mm.dd",
            due: "yy.mm.dd"));
        final controllerTodo = TextEditingController();
        TextControllers.add(controllerTodo);

        final controllerCreated = TextEditingController();
        TextControllers.add(controllerCreated);

        final controllerDue = TextEditingController();
        TextControllers.add(controllerDue);
        tempCnt++;
      });
    }

    void dispose() {
      for (int i = 0; i < tempCnt * 3; i++) {
        TextControllers[i].dispose();
      }
      super.dispose();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Todo List",
          style: TextStyle(color: Palette.textColor3),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Positioned(
                    child: Container(
                      margin: const EdgeInsets.only(top: 9),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.064,
                          ),
                          Text(
                            "check bar",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.015,
                              color: Palette.textColor2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                          ),
                          Text(
                            "To Do",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.015,
                              color: Palette.textColor2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                          ),
                          Text(
                            " Added Date",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.016,
                              color: Palette.textColor2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text(
                            " Due",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.016,
                              color: Palette.textColor2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text(
                            " Edit",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.015,
                              color: Palette.textColor2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text(
                            " Delete",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.015,
                              color: Palette.textColor2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          for (ToDo todo in todos)
                            Container(
                              margin: EdgeInsets.only(top: 12),
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.95,
                              decoration: BoxDecoration(
                                  color: todo.done
                                      ? Palette.searchColor.withOpacity(1)
                                      : Palette.lightBackgroundColor
                                          .withOpacity(1),
                                  borderRadius: BorderRadius.circular(40.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blueGrey.withOpacity(0.5),
                                      blurRadius: 1,
                                      spreadRadius: 3,
                                    )
                                  ]),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.034,
                                  ),
                                  IconButton(
                                    icon: todo.done
                                        ? Icon(
                                            Icons.check,
                                            color: Palette.deleteColor,
                                          )
                                        : Icon(
                                            Icons.check,
                                            color: Palette.searchColor,
                                          ),
                                    onPressed: () {
                                      setState(() {
                                        todo.done = !(todo.done);
                                        if (todo.stable == false) {
                                          todo.stable = true;
                                        }
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.04,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    child: Center(
                                        child: todo.stable
                                            ? Text(
                                                todo.work,
                                                style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.015,
                                                  color: Palette.textColor2,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            : TextFormField(
                                                controller: TextControllers[
                                                    todo.id * 3],
                                              )),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.07,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.075,
                                    child: todo.stable
                                        ? Text(
                                            todo.created,
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.015,
                                              color: Palette.textColor2,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        : TextFormField(
                                            controller: TextControllers[
                                                todo.id * 3 + 1],
                                          ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.024,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.075,
                                    child: todo.stable
                                        ? Text(
                                            todo.due,
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.015,
                                              color: Palette.textColor2,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        : TextFormField(
                                            controller: TextControllers[
                                                todo.id * 3 + 2],
                                          ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.012,
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      icon: todo.stable
                                          ? const Icon(Icons.edit,
                                              color: Colors.indigo, size: 30)
                                          : const Icon(Icons.save,
                                              color: Colors.indigo, size: 30),
                                      onPressed: () {
                                        setState(() {
                                          if (todo.stable == false) {
                                            todo.work =
                                                TextControllers[todo.id * 3]
                                                    .text;
                                            todo.created =
                                                TextControllers[todo.id * 3 + 1]
                                                    .text;
                                            todo.due =
                                                TextControllers[todo.id * 3 + 2]
                                                    .text;
                                          }
                                          todo.stable = !(todo.stable);
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      size: 30,
                                    ),
                                    color: Palette.deleteColor,
                                    onPressed: () {
                                      setState(() {
                                        todos.remove(todo);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createPlan,
        child: const Icon(Icons.add),
      ),
    );
  }
}
