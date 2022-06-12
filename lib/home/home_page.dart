import 'package:flutter/material.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 50,
          itemBuilder: (context, index) {
            return MenuListCell(title: 'LongPress me $index');
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 8),
        ),
      ),
    );
  }
}
