import 'package:get/get.dart';
import 'package:get_x_state_management/model/model.dart';

class DraftController extends GetxController {
  List<NoteModel> drafts = [];

  void addDrafts(NoteModel note) {
    drafts.add(note);
    print(drafts);
    update();
  }
}