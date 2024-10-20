import 'package:espoir_model_application/domain/_common/app_colors.dart';
import 'package:espoir_model_application/presentation/inventory/widget/degradation_v2_widget.dart';
import 'package:flutter/material.dart';

class InventoryV2Page extends StatelessWidget {
  const InventoryV2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('INVENTAIRES'),
        foregroundColor: AppColors.primary,
        backgroundColor: Colors.white,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => const DegradationV2Widget(),
        separatorBuilder: (context, index) => const SizedBox(
          height: 25,
        ),
        itemCount: 10,
      ),
    );
  }
}
