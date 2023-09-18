import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_state_management/controller/draft_controller.dart';
import 'package:get_x_state_management/controller/note_controller.dart';
import 'package:get_x_state_management/model/model.dart';
import 'package:image_picker/image_picker.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({super.key});

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController titleClt = TextEditingController();
  TextEditingController descriptionClt = TextEditingController();
  File? finalImage;
  String imageHint = 'Choose Image';

  DraftController draftsController = Get.put(DraftController());
  NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        draftsController.addDrafts(
          NoteModel(
          title: titleClt.text,
          description: descriptionClt.text,
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
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(12.0),
            children: [
              TextFormField(
                controller: titleClt,
                decoration: const InputDecoration(
                  hintText: 'Title',
                ),
                validator: (value) {
                  if(value!.isEmpty) {
                    return "The field can't be empty";
                  }
                },
              ),
              TextFormField(
                controller: descriptionClt,
                maxLines: 5,
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
                onPressed: () {
                  final form = _formKey.currentState!;

                  if(form.validate()) {
                    form.save();
                    noteController.addNote(
                      NoteModel(
                        title: titleClt.text,
                        description: descriptionClt.text,
                        image: finalImage!
                      )
                    );
                    Get.back();
                  }
                }
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
      maxHeight: 1000,
      maxWidth: 1000
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