// import 'package:espoir_model_application/infrastructure/inventory/inventory_remote_datasource.dart';
// import 'package:espoir_model_application/main.dart';
// import 'package:espoir_model_application/presentation/inventory/widget/degradation_widget.dart';
// import 'package:flutter/material.dart';

// class ReportPage extends StatefulWidget {
//   const ReportPage({super.key});

//   @override
//   State<ReportPage> createState() => _ReportPageState();
// }

// class _ReportPageState extends State<ReportPage> {
//   bool isLoading = false;
//   bool isPublic = false;
//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (context) => const AlertDialog(
//           content: CircularProgressIndicator(),
//         ),
//       );
//     }
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Rapport du Trajet"),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             onPressed: (myDegradations.isNotEmpty && !isPublic)
//                 ? () {
//                     showDialog(
//                       context: context,
//                       builder: (context) => AlertDialog(
//                         title: const Text("Publier"),
//                         content: const Text(
//                             'Aimeriez-vous que ces informations soient accessible à tout le monde ?'),
//                         actions: [
//                           TextButton(
//                             onPressed: () async {
//                               Navigator.pop(context);
//                               setState(() {
//                                 isLoading = true;
//                               });

//                               await InventoryRemoteDatasource()
//                                   .postMyDegradations(myDegradations);

//                               setState(() {
//                                 isLoading = false;
//                               });
//                             },
//                             child: const Text("Oui"),
//                           )
//                         ],
//                       ),
//                     );
//                   }
//                 : null,
//             icon: Icon(
//               Icons.public,
//               color: (myDegradations.isNotEmpty && !isPublic)? Colors.red : Colors.grey,
//             ),
//           )
//         ],
//       ),
//       body: myDegradations.isEmpty
//           ? const Center(
//               child: Text("Aucune dégradation détecter !!!"),
//             )
//           : ListView.builder(
//               itemBuilder: (context, index) =>
//                   DegradationWidget(degradation: myDegradations[index]),
//               itemCount: 10,
//             ),
//     );
//   }
// }
