import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_state_management/controller/draft_controller.dart';
import 'package:get_x_state_management/model/model.dart';
import 'package:get_x_state_management/page/note_details_page.dart';

class DraftPage extends StatefulWidget {
  const DraftPage({super.key});

  @override
  State<DraftPage> createState() => _DraftPageState();
}

class _DraftPageState extends State<DraftPage> {
  DraftController draftController = Get.put(DraftController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Draft Box'),
      ),
      body: GetBuilder<DraftController>(
        builder: (_) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: draftController.drafts.length,
            itemBuilder: (context, index) {
              NoteModel note = draftController.drafts[index];

              return ListTile(
                leading: Image.file(note.image),
                title: Text(note.title),
                subtitle: Text(note.description),
                onTap: () {
                  Get.to(NoteDetailsPage(note: note));
                },
              );
            }
          );
        }
      ),
    );
  }
}