import 'package:get/get.dart';
import 'package:get_x_state_management/model/model.dart';

class NoteController extends GetxController {
  List<NoteModel> notes = [];

  void addNote(NoteModel note) {
    notes.add(note);
    update();
  }
}