import 'package:firebase_auth/firebase_auth.dart';
import 'package:frontend/services/authentication.dart';

class UserConverter {
  const UserConverter();

  static User fromJson(String uid) {
    return Authentication().currentUser;
  }

  static String toJson(User user) => user.uid;
}