import 'package:clean_arquitecture/ui/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit_outlined), title: SizedBox.shrink()),
        BottomNavigationBarItem(icon: Icon(Icons.settings),  title: SizedBox.shrink()),
      ]),
    );
  }
}