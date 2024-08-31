import 'dart:io';

import 'package:espoir_model_application/domain/degradation.dart';
import 'package:espoir_model_application/presentation/inventory/widget/my_rich_text.dart';
import 'package:flutter/material.dart';

class DegradationWidget extends StatelessWidget {
  const DegradationWidget({super.key, required this.degradation});
  final Degradation degradation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(15),
        type: MaterialType.card,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                image: DecorationImage(
                  image: Image.file(File(degradation.imageUrl!)).image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyRichText(
                      title: "Longitude",
                      value: degradation.position!.longitude.toString()),
                  MyRichText(
                      title: "Latitude",
                      value: degradation.position!.latitude.toString()),
                  MyRichText(
                      title: "Altitude",
                      value: degradation.position!.altitude.toString()),
                  MyRichText(
                      title: "Nb. dégradation",
                      value: degradation.predictions.length.toString()),
                  MyRichText(
                      title: "Classe de la 1ère",
                      value: degradation.predictions.first.pClass.toString()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
