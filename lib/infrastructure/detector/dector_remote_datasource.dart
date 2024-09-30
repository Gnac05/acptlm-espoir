// import 'package:camera/camera.dart';
// import 'package:dio/dio.dart';
// import 'package:espoir_model_application/domain/degradation.dart';
// import 'package:espoir_model_application/infrastructure/_common/current_position.dart';
// import 'package:espoir_model_application/main.dart';
// import 'package:flutter/foundation.dart';
// import 'package:geolocator/geolocator.dart';

// class DectorRemoteDatasource {
//   final String baseUrl = "https://detect.roboflow.com/acptlm-espoir-346zp/1";
//   Future dection(XFile image) async {
//     final instance = Dio();
//     Map<String, dynamic> query = {};
//     query['api_key'] = "ZonlkEZTCYqyXExweGEC";
//     final header = {"Content-Type": "application/x-www-form-urlencoded"};

//     FormData formData = FormData.fromMap({
//       "file": await MultipartFile.fromFile(image.path),
//     });

//     final response = await instance.post(
//       baseUrl,
//       data: formData,
//       queryParameters: query,
//       options: Options(
//         headers: header,
//       ),
//     );

//     if (response.statusCode! == 200) {
//       debugPrint('Response : ${response.data.toString()}');
//       Degradation degradation = Degradation.fromJson(response.data);

//       if (degradation.predictions.isNotEmpty) {
//         Position curentPosition = await determinePosition();
//         debugPrint(
//             'Current Position : (${curentPosition.latitude}, ${curentPosition.longitude})');
//         degradation.imageUrl = image.path;
//         degradation.position = curentPosition;
//         myDegradations.add(degradation);
//       }
//     }
//   }
// }
