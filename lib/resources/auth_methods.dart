import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign Up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error occurred";

    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        // Register user
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);

        // Add User to database
        print(userCredential.user);
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'uid': userCredential.user!.uid,
          'username': username,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
        });
        res = 'Success';
        // TODO: Store the immage
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
