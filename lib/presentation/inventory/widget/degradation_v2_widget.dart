import 'dart:math';

import 'package:espoir_model_application/domain/_common/app_colors.dart';
import 'package:espoir_model_application/domain/_common/app_image.dart';
import 'package:espoir_model_application/presentation/inventory/widget/custom_row_text_widget.dart';
import 'package:espoir_model_application/presentation/report/report_v2_page.dart';
import 'package:flutter/material.dart';

List imagesDegradations = [
  AppImage.degradation,
  AppImage.degradation2,
  AppImage.degradation3,
  AppImage.degradation4,
];

class DegradationV2Widget extends StatelessWidget {
  const DegradationV2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    int rand = Random.secure().nextInt(3);
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("13/08/2024"),
              Text("19:30:08"),
            ],
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Scan 9",
                        style: TextStyle(
                          color: Colors.green.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const CustomRowTextWidget(
                        title: 'Nbr. de Dégradation',
                        subTitle: '07 fractures',
                      ),
                      const CustomRowTextWidget(
                        title: 'Longitude',
                        subTitle: '122363.3513',
                      ),
                      const CustomRowTextWidget(
                        title: 'Latitude',
                        subTitle: '122363.3513',
                      ),
                      const CustomRowTextWidget(
                        title: 'Altitude',
                        subTitle: '122363.3513',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5.0,
                          bottom: 8,
                        ),
                        child: Center(
                          child: SizedBox(
                            height: 28,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ReportV2Page(
                                        image: imagesDegradations[rand],
                                      ),
                                    ));
                              },
                              label: const Text("Rapport"),
                              style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(AppColors.primary),
                                  foregroundColor: const WidgetStatePropertyAll(
                                      Colors.white)),
                              icon: const Icon(
                                Icons.note_add_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 175,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                      image: DecorationImage(
                          image: Image.asset(imagesDegradations[rand]).image,
                          fit: BoxFit.cover)),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
