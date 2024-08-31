import 'package:flutter/material.dart';

class MyRichText extends StatelessWidget {
  const MyRichText({super.key, required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5),
      child: RichText(
        maxLines: 2,
        text: TextSpan(
          text: "$title : ",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: value,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 13,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
