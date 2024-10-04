import 'package:espoir_model_application/domain/_common/app_colors.dart';
import 'package:espoir_model_application/domain/_common/app_image.dart';
import 'package:espoir_model_application/domain/_common/app_svg.dart';
import 'package:espoir_model_application/presentation/_common-widget/my_drop_button.dart';
import 'package:espoir_model_application/presentation/inventory/inventory_v2_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppPage extends StatelessWidget {
  const MyAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Custom background with curved shape
          Positioned.fill(
            child: CustomPaint(
              painter: CurvedBackgroundPainter(),
              isComplex: true,
            ),
          ),
          // Your content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(AppSvg.report),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => settingAlertDialog(context),
                            barrierDismissible: false,
                          );
                        },
                        child: SvgPicture.asset(AppSvg.setting),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 85.0),
                  child: Image.asset(
                    AppImage.logoPrimary,
                    // height: 200,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: Text(
                    'FAIRE UN TRAJET',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, bottom: 125),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InventoryV2Page(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    child: Text(
                      'INVENTAIRES',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  settingAlertDialog(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Row(
        children: [
          const Spacer(),
          Text(
            "Paramètres",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.red,
            ),
          ),
        ],
      ),
      content: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Temps de prise",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  MyDropButton(),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Divider(),
              ),
              InkWell(
                child: Row(
                  children: [
                    Text(
                      'Thème',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Spacer(flex: 3),
                    Text('Clair'),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
              ),
              Divider(
                height: 30,
              ),
              InkWell(
                child: Row(
                  children: [
                    Text(
                      'Language',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Spacer(flex: 3),
                    Text('fr'),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurvedBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color(0xFF1D2952) // Navy Blue color
      ..style = PaintingStyle.fill;

    final Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.5);
    path.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.45,
      size.width * 0.6,
      size.height * 0.5,
    );
    path.quadraticBezierTo(
      size.width * 0.1,
      size.height * 0.55,
      0,
      0,
    );
    // path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}


// 
//
//import 'package:espoir_model_application/presentation/detector/start_page.dart';
// import 'package:espoir_model_application/presentation/inventory/inventory_page.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';

// class MyAppPage extends StatelessWidget {
//   const MyAppPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("Détection ACPTLM"),
//           centerTitle: true,
//         ),
//         body: const Column(
//           children: [
//             Expanded(
//               child: TabBar(
//                 tabs: [
//                   Tab(
//                     text: 'Model',
//                     icon: Icon(Icons.account_tree_rounded),
//                   ),
//                   Tab(
//                     text: 'Inventaires',
//                     icon: Icon(Icons.inventory),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               flex: 11,
//               child: TabBarView(
//                 dragStartBehavior: DragStartBehavior.down,
//                 children: [
//                   StartPage(),
//                   InventoryPage(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
