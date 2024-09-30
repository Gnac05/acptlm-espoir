// import 'package:espoir_model_application/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:camera/camera.dart';
import 'package:espoir_model_application/domain/_common/app_colors.dart';
// import 'package:espoir_model_application/domain/degradation.dart';
// import 'package:espoir_model_application/geolocator_exemple.dart';
import 'package:espoir_model_application/presentation/app.dart';
import 'package:flutter/material.dart';

// import 'camera_exemple_view.dart';

// late List<CameraDescription> cameras;
// List<Degradation> myDegradations = [];
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
        ),
        // useMaterial3: true,
      ),
      home: const MyAppPage(),
    );
  }
}
