import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_state_management/controller/note_controller.dart';
import 'package:get_x_state_management/model/model.dart';
import 'package:get_x_state_management/page/note_details_page.dart';

class TaskCompletedPage extends StatefulWidget {
  const TaskCompletedPage({super.key});

  @override
  State<TaskCompletedPage> createState() => _TaskCompletedPageState();
}

class _TaskCompletedPageState extends State<TaskCompletedPage> {
  NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Completed Task'),
      ),
      body: GetBuilder<NoteController>(
        builder: (_) {
          return ListView.builder(
            itemCount: noteController.notes.length,
            itemBuilder: (context, index) {
              NoteModel note = noteController.notes[index];

              return Card(
                color: Colors.pink.shade100,
                child: ListTile(
                  leading: Image.file(note.image),
                  title: Text(note.title),
                  subtitle: Text(note.description),
                  onTap: () => Get.to(NoteDetailsPage(note: note)),
                ),
              );
            }
          );
        }
      ),
    );
  }
}