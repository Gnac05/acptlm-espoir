import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

/// Send image to Firebase Storage (cloud storage)
/// and get the image url
Future<String> getImageUrl(XFile xfile,
    {required void Function(double uploadProgress) progress,
    required void Function() onComplete}) async {
  // try {
  final path = 'images/${xfile.name}';
  // Upload file
  UploadTask? uploadTask;

  if (kIsWeb) {
    // Pour le web, utiliser un Uint8List
    final bytes = await xfile.readAsBytes();
    final ref = FirebaseStorage.instance.ref().child(path);
    final metadata = SettableMetadata(contentType: 'image/jpeg');
    uploadTask = ref.putData(bytes, metadata);
  } else {
    // Pour les autres plateformes, utiliser un File
    final file = File(xfile.path);
    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);
  }

  // final ref = FirebaseStorage.instance.ref().child(path);
  // uploadTask = ref.putFile(File(xfile.path));

  uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
    progress(snapshot.bytesTransferred / snapshot.totalBytes);
  });

  final snapshot = await uploadTask.whenComplete(() {
    debugPrint("####---->Upload Successfully");
  });

  final urlDownload = await snapshot.ref.getDownloadURL().whenComplete(
    () {
      debugPrint("####---->URL Get Successfully");
      onComplete();
    },
  );

  return urlDownload;
  // } catch (e) {
  //   debugPrint("#### Error : $e");
  //   return "";
  // }
}
