import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String email;
  final String password;
  final String username;
  final String firstName;
  final String lastName;

  const User({
    required this.uid,
    required this.email,
    required this.password,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot['username'],
      uid: snapshot['uid'],
      email: snapshot['email'],
      password: snapshot['password'],
      firstName: snapshot['firstName'],
      lastName: snapshot['lastName'],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "password": password,
        "firstName": firstName,
        "lastName": lastName
      };
}
