import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:espoir_model_application/domain/degradation.dart';
import 'package:espoir_model_application/infrastructure/_common/get_image_url.dart';
import 'package:flutter/foundation.dart';

class InventoryRemoteDatasource {
  static final _collectionInventory =
      FirebaseFirestore.instance.collection('inventory');

  Future postMyDegradations(List<Degradation> degradations) async {
    debugPrint('############_______BEGIN__###############');

    for (var e in degradations) {
      final image = e.imageUrl!;
      final imageUrl = await getImageUrl(
        XFile(image),
        progress: (uploadProgress) {},
        onComplete: () {},
      );
      e.imageUrl = imageUrl;
      await _collectionInventory.doc().set(e.toJson());
    }

    debugPrint('############_______END__###############');
  }

  Stream<List<Degradation>> fetchDegradation() {
    return _collectionInventory.snapshots().map((snap) =>
        snap.docs.map((doc) => Degradation.fromJson(doc.data())).toList());
  }
}
