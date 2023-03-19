import 'package:elred_flutter_assignment/config/constants.dart';
import 'package:elred_flutter_assignment/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  Future<String> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await auth.signInWithCredential(credential);
      registerUserInDB(googleUser!);
      return "success";
    } catch (e) {
      return "error";
    }
  }

  void registerUserInDB(GoogleSignInAccount user) {
    usersCollection
        .doc(auth.currentUser!.uid)
        .set(UserDetails(user.displayName!, auth.currentUser!.uid).toJson());
  }

  Future<String> signOut() async {
    try {
      await auth.signOut();
      await GoogleSignIn().signOut();
      return "success";
    } catch (e) {
      return "error";
    }
  }
}
