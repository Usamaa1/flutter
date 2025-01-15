import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> registerUser(String email, String password, String city, String country) async {
  try {
    // Register the user with Firebase Authentication
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Get the user ID
    String userId = userCredential.user!.uid;

    // Save additional fields in Firestore
    await FirebaseFirestore.instance.collection('users').doc(userId).set({
      'email': email,
      'city': city,
      'country': country,
      'createdAt': FieldValue.serverTimestamp(),
    });

    print('User registered and data saved successfully.');
  } catch (e) {
    print('Error: $e');
  }
}
