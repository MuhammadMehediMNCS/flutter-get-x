import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_state_management/db/notes_draft.dart';
import 'package:get_x_state_management/model/notes.dart';

class DraftPage extends StatefulWidget {
  const DraftPage({super.key});

  @override
  State<DraftPage> createState() => _DraftPageState();
}

class _DraftPageState extends State<DraftPage> {
  final NotesDrafts controller = Get.put(NotesDrafts());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Draft Box'),
      ),
      body: GetBuilder<NotesDrafts>(
        builder: (_) {
          return ListView.builder(
            itemCount: controller.drafts.length,
            itemBuilder: (context, index) {
              Notes note = controller.drafts[index];

              return ListTile(
                leading: Image.file(note.image),
                title: Text(note.title),
                subtitle: Text(note.description),
              );
            }
          );
        }
      ),
    );
  }
}