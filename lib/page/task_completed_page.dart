import 'package:flutter/material.dart';

class TaskCompletedPage extends StatefulWidget {
  const TaskCompletedPage({super.key});

  @override
  State<TaskCompletedPage> createState() => _TaskCompletedPageState();
}

class _TaskCompletedPageState extends State<TaskCompletedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Completed Task'),
      ),
    );
  }
}