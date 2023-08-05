import 'package:flutter/material.dart';
import 'package:frontend/models/HomeMenuModel.dart';
import 'package:frontend/views/home/buttons/home_button_list.dart';

class HomePageLayout extends StatefulWidget {
  final String title;
  final List<Widget> screens;
  final List<HomeMenuModel> menu;

  const HomePageLayout(
      {super.key,
      required this.title,
      required this.menu,
      required this.screens});

  @override
  State<StatefulWidget> createState() => HomePageLayoutState();
}

class HomePageLayoutState extends State<HomePageLayout> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: widget.screens[current],
      bottomNavigationBar: HomeButtonList(
        menu: widget.menu,
        selected: current,
        onTap: (selected) {
          setState(() {
            current = selected;
          });
        },
      ),
    );
  }
}