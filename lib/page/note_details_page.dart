import 'package:flutter/material.dart';
import 'package:get_x_state_management/model/model.dart';

class NoteDetailsPage extends StatefulWidget {
  NoteModel note;

  NoteDetailsPage({super.key, required this.note});

  @override
  State<NoteDetailsPage> createState() => _NoteDetailsPageState();
}

class _NoteDetailsPageState extends State<NoteDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.pink,
        title: const Text('Note Details'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.file(widget.note.image, height: 180, width: 240, fit: BoxFit.cover)
            ),
            const SizedBox(height: 18),
            const Text(
              'Title',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              alignment: Alignment.topLeft,
              child: Text(
                widget.note.title,
                style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                maxLines: 1,
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              alignment: Alignment.topLeft,
              child: Text(
                widget.note.description,
                style: const TextStyle(fontSize: 16),
                maxLines: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}