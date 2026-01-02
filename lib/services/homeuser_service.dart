import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeuserService {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  Future<User> getCurrentUser() async {
    return auth.currentUser!;
  }

  Future<int> getGamesPlayed() async {
    final uid = auth.currentUser!.uid;
    final doc = await firestore.collection('users').doc(uid).get();
    return doc.data()?['gamesPlayed'] ?? 0;
  }
}
