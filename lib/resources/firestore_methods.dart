import 'dart:typed_data';

import 'package:beautyfinder/models/posts.dart';
import 'package:beautyfinder/resources/storage_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(
    String description,
    Uint8List file,
    String uid,
    String username,
  ) async {
    String result = "some error occured";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('posts', file, true);

      String postId = const Uuid().v1();

      Post post = Post(
        description: description,
        uid: uid,
        username: username,
        postId: postId,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
        addsToCollection: [],
      );

      _firestore.collection('posts').doc(postId).set(
            post.toJson(),
          );

      result = "success";
    } catch (err) {
      result = err.toString();
    }
    return result;
  }
}
