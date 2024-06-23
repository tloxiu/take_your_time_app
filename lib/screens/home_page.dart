import 'package:flutter/material.dart';
import 'package:take_your_time_app/screens/todo_list_page.dart';
import 'package:typewritertext/typewritertext.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Take\nyour\ntime",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                    fontFamily: "Pink Crestelle"),
              ),
              const SizedBox(height: 220),
              SizedBox(
                height: 80,
                width: 200,
                child: TypeWriter.text(
                  "We are born to be happy, not to race with other people on everything we do...",
                  style: const TextStyle(color: Colors.white),
                  repeat: true,
                  duration: const Duration(milliseconds: 60),
                ),
              ),
              const SizedBox(height: 150),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TodoListPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(110, 10, 110, 10),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: const Text(
                  "Get started",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Pink Crestelle",
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
