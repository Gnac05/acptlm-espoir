import 'package:animated_introduction/animated_introduction.dart';
import 'package:espoir_model_application/domain/_common/app_colors.dart';
import 'package:espoir_model_application/domain/_common/app_image.dart';
import 'package:espoir_model_application/presentation/app.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedIntroduction(
        slides: [
          SingleIntroScreen(
            imageAsset: AppImage.screen1,
            title: 'Bienvenue sur road monitor !',
            description:
                'Avec Road Monitor, détectez automatiquement les dégradations routières tout en conduisant. Contribuez à améliorer les routes et à sécuriser vos trajets.',
          ),
          SingleIntroScreen(
            imageAsset: AppImage.screen2,
            title: 'Utilisation de la Caméra et GPS',
            description:
                "Autorisez l'accès à la caméra et à la localisation pour détecter les problèmes routiers. Chaque dégradation est automatiquement enregistrée et localisée.",
          ),
          SingleIntroScreen(
            imageAsset: AppImage.screen3,
            title: 'Exportation et Partage des Rapports',
            description:
                "Générez un rapport à la fin de chaque trajet. Partagez-le avec la communauté et les autorités pour aider à améliorer l'état des routes.",
          ),
        ],
        onDone: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyAppPage(),
              ));
        },
        doneText: 'Démarrer',
        skipText: 'Sauter',
        nextWidget: Row(
          children: [
            Text(
              'Suivant',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.arrow_right_alt_rounded,
              color: AppColors.primary,
            ),
          ],
        ),
        containerBg: AppColors.primary,
        topHeightForFooter: MediaQuery.of(context).size.height - 270,
        textColor: AppColors.primary,
        footerBgColor: Colors.white,
        activeDotColor: AppColors.primary,
        indicatorType: IndicatorType.line,
      ),
    );
  }
}
