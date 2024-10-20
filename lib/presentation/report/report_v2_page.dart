import 'dart:io';

import 'package:espoir_model_application/domain/_common/app_colors.dart';
import 'package:espoir_model_application/presentation/report/widget/report_v2_widget.dart';
import 'package:flutter/material.dart';

class ReportV2Page extends StatelessWidget {
  const ReportV2Page(
      {super.key, required this.image, this.islocalFile = false});
  final String image;
  final bool islocalFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
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
        title: const Text('RESULTAT DE LA DETECTION'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.grey.shade400,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Scan 9",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: AppColors.primary,
                    ),
                    child: Stack(
                      children: [
                        Container(
                          height: 322,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: islocalFile
                                    ? Image.file(File(image)).image
                                    : Image.asset(image).image,
                                fit: BoxFit.cover),
                          ),
                        ),
                        Positioned(
                          left: 55,
                          top: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.blue,
                                child: const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    "Nid de poule",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 130,
                                width: 250,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue,
                                    width: 2.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Column(
              children: [
                ReportV2Widget(title: 'Nbr. de dégradation', value: "12"),
                ReportV2Widget(
                    title: 'Type de dégradation', value: "Nid de poule"),
                ReportV2Widget(
                    title: "Localisation", value: "Cotonou, Étoile Rouge"),
                ReportV2Widget(title: 'Réparations', value: "..."),
                ReportV2Widget(title: 'Indice de fissuration', value: "..."),
                ReportV2Widget(title: 'Indice de déformation', value: "..."),
                ReportV2Widget(
                    title: 'Indice de dégradation de surface', value: "..."),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
