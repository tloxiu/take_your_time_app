import 'package:flutter/material.dart';
import 'package:take_your_time_app/data/todo_list.dart';

class TodoList extends StatefulWidget {
  const TodoList({required this.todoUserList, required this.onRemoveTask, super.key});
  final List<ListItem> todoUserList;
  final Function(int) onRemoveTask;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: todoUserList.length,
        itemBuilder: (context, index) {
          final item = todoUserList[index];
          return Dismissible(
            onDismissed: (direction) {
              widget.onRemoveTask(index);
            },
            key: ValueKey(todoUserList[index]),
            child: Column(
              children: [
                ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: Text(
                            item.todoText,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            item.isChecked = !item.isChecked;
                          });
                        },
                        child: Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1.5),
                            borderRadius: BorderRadius.circular(0),
                            color: item.isChecked
                                ? Colors.white
                                : Colors.transparent,
                          ),
                          child: item.isChecked
                              ? const Icon(Icons.check,
                                  size: 28, color: Colors.black)
                              : Container(),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: Colors.grey.shade700, thickness: 1)
              ],
            ),
          );
        },
      ),
    );
  }
}
