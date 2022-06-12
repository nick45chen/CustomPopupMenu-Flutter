import 'package:flutter/material.dart';

import 'menu/arrow.dart';
import 'menu/menu_list_cell.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('demo'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: MenuListCell(title: 'Click me'),
        ),
      ),
    );
  }
}
