import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt number = 0.obs;

  void increment() {
    number++;
  }
}