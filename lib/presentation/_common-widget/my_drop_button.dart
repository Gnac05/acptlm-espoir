import 'package:espoir_model_application/domain/_common/app_colors.dart';
import 'package:flutter/material.dart';

class MyDropButton extends StatefulWidget {
  const MyDropButton({super.key});

  @override
  State<MyDropButton> createState() => _MyDropButtonState();
}

class _MyDropButtonState extends State<MyDropButton> {
  String time = '500';
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      style: TextStyle(
        fontWeight: FontWeight.w300,
        color: AppColors.primary,
      ),
      onChanged: (value) {
        time = value!;
        setState(() {});
      },
      value: time,
      items: const [
        DropdownMenuItem(value: "500", child: Text("500 ms")),
        DropdownMenuItem(value: "1000", child: Text("1.000 ms")),
        DropdownMenuItem(value: "5000", child: Text("5.000 ms")),
        DropdownMenuItem(value: "10000", child: Text("10.000 ms")),
      ],
    );
  }
}
