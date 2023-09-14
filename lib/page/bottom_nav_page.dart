import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_state_management/page/create_note_page.dart';
import 'package:get_x_state_management/page/draft_page.dart';
import 'package:get_x_state_management/page/task_completed_page.dart';
import 'package:get_x_state_management/widget/tab_bar_widget.dart';

class BottomNavPage extends StatelessWidget {
  const BottomNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavDesign(),
    );
  }
}

class BottomNavDesign extends StatefulWidget {
  const BottomNavDesign({super.key});

  @override
  State<BottomNavDesign> createState() => _BottomNavDesignState();
}

class _BottomNavDesignState extends State<BottomNavDesign> {
  int index = 0;

  final pages = [
    const TaskCompletedPage(),
    const DraftPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[index],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[300],
        child: const Icon(Icons.edit_note),
        onPressed: () {
          Get.to(const CreateNotePage());
        }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: TabBarWidget(
        index: index,
        onChangedTab: onChangedTab
      )
    );
  }

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}