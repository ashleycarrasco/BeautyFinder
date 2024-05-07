import 'package:beautyfinder/resources/storage_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:beautyfinder/models/user.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

  // sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String firstName,
    required String lastName,
  }) async {
    String result = "Some error occured. Try again.";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          firstName.isNotEmpty ||
          lastName.isNotEmpty) {
        // register user
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        model.User user = model.User(
          username: username,
          uid: credential.user!.uid,
          email: email,
          firstName: firstName,
          lastName: lastName,
          password: password,
        );

        // add user to database
        await _firestore.collection('users').doc(credential.user!.uid).set(
              user.toJson(),
              /*
        'username': username,
        'uid': credential.user!.uid,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'password': password
      }*/
            );

        result = "success";
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }

  Future<String> logInUser(
      {required String email, required String password}) async {
    String result = "Some error occured.";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        result = "success";
      } else {
        result = "Please enter all fields";
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }
}
