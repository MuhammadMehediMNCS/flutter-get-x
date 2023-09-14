import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;

  const TabBarWidget({super.key, required this.index, required this.onChangedTab});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    const placeholder = Opacity(
      opacity: 0,
      child: IconButton(onPressed: null, icon: Icon(Icons.no_cell)),
    );

    return BottomAppBar(
      height: 54,
      color: Colors.pink.shade100,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildTabItems(
              index: 0,
              icon: const Icon(Icons.save)
            ),
            placeholder,
            buildTabItems(
              index: 1,
              icon: const Icon(Icons.drafts)
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabItems({required int index, required Icon icon}) {
    final isSelected = index == widget.index;

    return CircleAvatar(
      backgroundColor: isSelected ? Colors.pink : Colors.grey,
      child: IconTheme(
        data: const IconThemeData(
          color: Colors.white
        ),
        child: IconButton(
          onPressed: () => widget.onChangedTab(index),
          icon: icon
        ),
      ),
    );
  }
}