import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserData({
    required String userId,
    required String userName,
    required String email,
  }) async {
    try {
      await _firestore.collection('users').doc(userId).set({
        'userName': userName,
        'email': email,
        'createdAt': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      // You can handle Firestore-specific errors here
      throw Exception('Failed to save user data: ${e.toString()}');
    }
  }
}
