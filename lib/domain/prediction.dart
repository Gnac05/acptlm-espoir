class Prediction {
  final String x;
  final String y;
  final int width;
  final int height;
  final double confidence;
  final String pClass;
  final int classId;
  final String detectionId;

  Prediction(
      {required this.x,
      required this.y,
      required this.width,
      required this.height,
      required this.confidence,
      required this.pClass,
      required this.classId,
      required this.detectionId});

  factory Prediction.fromJson(Map<String, dynamic> json) => Prediction(
        x: json['x'],
        y: json['y'],
        width: json['width'],
        height: json['height'],
        confidence: json['confidence'],
        pClass: json['class'],
        classId: json['class_id'],
        detectionId: json['detection_id'],
      );

  Map<String, dynamic> toJson() => {
        'x': x,
        'y': y,
        'width': width,
        'height': height,
        'confidence': confidence,
        'class': pClass,
        'class_id': classId,
        'detection_id': detectionId,
      };
}
