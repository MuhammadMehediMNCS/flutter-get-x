import 'dart:io';

class Notes {
  String title;
  String description;
  File image;

  Notes({
    required this.title,
    required this.description,
    required this.image
  });
}