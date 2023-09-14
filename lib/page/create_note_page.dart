import 'dart:io';

import 'package:flutter/material.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({super.key});

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  GlobalKey formKey = GlobalKey<FormState>();

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  File? image;
  String imageHint = 'Choose Image';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  return "Field can't be empty";
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
                    onPressed: () {}
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
    );
  }
}