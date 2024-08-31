import 'package:espoir_model_application/camera_exemple_view.dart';
import 'package:espoir_model_application/presentation/detector/model_detector_page.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool _isPressed = false;
  void _onPressed() {
    setState(() {
      _isPressed = !_isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(80),
        onDoubleTap: () {
          _onPressed();
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CameraExampleHome(),
              ));
        },
        onTap: () {
          _onPressed();
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ModelDetectorPage(),
              ));
        },
        child: Material(
          elevation: _isPressed ? 0 : 25,
          type: MaterialType.button,
          color: Colors.green,
          borderRadius: BorderRadius.circular(75),
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: 150,
            width: 150,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                'Démarrer',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
