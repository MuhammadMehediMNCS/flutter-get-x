import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_state_management/db/notes_draft.dart';
import 'package:get_x_state_management/model/notes.dart';
import 'package:image_picker/image_picker.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({super.key});

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  GlobalKey formKey = GlobalKey<FormState>();

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  File? finalImage;
  String imageHint = 'Choose Image';

  NotesDrafts draftsController = Get.put(NotesDrafts());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        draftsController.addDrafts(
          Notes(
          title: title.text,
          description: description.text,
          image: finalImage!
          )
        );
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.pink,
          title: const Text('Create Note'),
          centerTitle: true,
        ),
        body: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(12.0),
            children: [
              TextFormField(
                controller: title,
                decoration: const InputDecoration(
                  hintText: 'Title',
                ),
                validator: (value) {
                  if(value!.isEmpty) {
                    return "Field can't be empty";
                  }
                },
              ),
              TextFormField(
                controller: description,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Description',
                ),
                validator: (value) {
                  if(value!.isEmpty) {
                    return "The field can't be empty";
                  }
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(imageHint, overflow: TextOverflow.ellipsis)
                  ),
                  Expanded(
                    child: IconButton(
                      icon: const Icon(Icons.image_search),
                      onPressed: () => _getFromGrllery()
                    )
                  )
                ],
              ),
              const SizedBox(height: 44),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: const StadiumBorder()
                ),
                child: const Text('Save'),
                onPressed: () {}
              )
            ],
          ),
        ),
      ),
    );
  }

  _getFromGrllery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 1800,
      maxWidth: 1800
    );
    if(pickedFile != null) {
      File imageFile = File(pickedFile.path);
      setState(() {
        finalImage = imageFile;
        imageHint = pickedFile.path;
      });
    }
  }
}