import 'package:get/get.dart';
import 'package:get_x_state_management/model/notes.dart';

class NotesDrafts extends GetxController {
  // For Drafts page.
  List<Notes> drafts = [];

  void addDrafts(Notes note) {
    drafts.add(note);
    update();
  }

  // For Save page
  
}