import 'package:espoir_model_application/domain/_common/app_colors.dart';
import 'package:flutter/material.dart';

class CustomRowTextWidget extends StatelessWidget {
  const CustomRowTextWidget(
      {super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 3,
            child: Text(
              subTitle,
              style: const TextStyle(fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}
