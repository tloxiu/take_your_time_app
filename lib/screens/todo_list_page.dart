import 'package:flutter/material.dart';
import 'package:take_your_time_app/components/todo_list.dart';
import 'package:take_your_time_app/data/todo_list.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});
  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final taskController = TextEditingController();
  List<ListItem> tasks = todoUserList;

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  void addTask(String taskText) {
    setState(() {
      tasks.add(
        ListItem(todoText: taskText, isChecked: false),
      );
    });
  }

  void removeTask(int taskIndex) {
    setState(() {
      tasks.removeAt(taskIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                Icon(Icons.message_sharp),
                SizedBox(width: 10), // Add space between icons
                Icon(Icons.person_2_outlined),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MARCH 13, 2022',
                      style: TextStyle(color: Colors.grey, letterSpacing: 3),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Good Morning Roksana,\nhere are your daily tasks',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Pink Crestelle",
                          fontSize: 25),
                    ),
                  ],
                ),
                FloatingActionButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  backgroundColor: Colors.white,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Add a new task"),
                          content: TextField(
                            controller: taskController,
                            decoration: const InputDecoration(
                              label: Text('Task'),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                addTask(taskController.text);
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Icon(
                    Icons.add,
                    size: 28,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            TodoList(todoUserList: tasks, onRemoveTask: removeTask),
          ],
        ),
      ),
    );
  }
}
