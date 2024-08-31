import 'package:espoir_model_application/domain/prediction.dart';
import 'package:geolocator/geolocator.dart';

class Degradation {
  Position? position;
  final List<Prediction> predictions;
  final String inferenceId;
  final double time;
  String? imageUrl;
  DateTime? createdAt;

  Degradation({
    required this.predictions,
    required this.inferenceId,
    required this.time,
    this.imageUrl,
    this.position,
    this.createdAt,
  });

  factory Degradation.fromJson(Map<String, dynamic> json) => Degradation(
        predictions:
            List.from(json['predictions'].map((e) => Prediction.fromJson(e))),
        inferenceId: json['inference_id'],
        time: json['time'],
        position: json['position'] != null
            ? Position.fromMap(json['position'])
            : null,
        imageUrl: json['imageUrl'],
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'inference_id': inferenceId,
        'time': time,
        'imageUrl': imageUrl,
        'position': position!.toJson(),
        'predictions': List.from(predictions.map((e) => e.toJson())),
        'createdAt': createdAt ?? DateTime.now().toIso8601String()
      };
}
