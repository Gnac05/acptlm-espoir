import 'package:espoir_model_application/infrastructure/inventory/inventory_remote_datasource.dart';
import 'package:espoir_model_application/main.dart';
import 'package:espoir_model_application/presentation/inventory/widget/degradation_widget.dart';
import 'package:flutter/material.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: InventoryRemoteDatasource().fetchDegradation(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Quelque chose s'est mal passée !!!"),
          );
        }
        if (snapshot.data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return snapshot.data!.isEmpty
              ? const Center(
                  child: Text("Aucune dégradation détecter !!!"),
                )
              : ListView.builder(
                  itemBuilder: (context, index) =>
                      DegradationWidget(degradation: myDegradations[index]),
                  itemCount: 10,
                );
        }
      },
    );
  }
}
