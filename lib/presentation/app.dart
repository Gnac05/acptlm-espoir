import 'package:espoir_model_application/presentation/detector/start_page.dart';
import 'package:espoir_model_application/presentation/inventory/inventory_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyAppPage extends StatelessWidget {
  const MyAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Détection ACPTLM"),
          centerTitle: true,
        ),
        body: const Column(
          children: [
            Expanded(
              child: TabBar(
                tabs: [
                  Tab(
                    text: 'Model',
                    icon: Icon(Icons.account_tree_rounded),
                  ),
                  Tab(
                    text: 'Inventaires',
                    icon: Icon(Icons.inventory),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 11,
              child: TabBarView(
                dragStartBehavior: DragStartBehavior.down,
                children: [
                  StartPage(),
                  InventoryPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
