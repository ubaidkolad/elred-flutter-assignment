import 'package:elred_flutter_assignment/config/constants.dart';
import 'package:elred_flutter_assignment/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  Future<bool> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount;

      googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        await auth.signInWithCredential(authCredential);
        registerUserInDB(googleSignInAccount);
        return true;
      }

      return false;
    } on FirebaseAuthException catch (e) {
      return false;
    } on PlatformException catch (e) {
      return false;
    } catch (e) {
      return false;
    }
  }

  void registerUserInDB(GoogleSignInAccount user) {
    usersCollection
        .doc(auth.currentUser!.uid)
        .set(UserDetails(user.displayName!, auth.currentUser!.uid).toJson());
  }

  Future<String> signOut() async {
    try {
      await GoogleSignIn().signOut();
      await auth.signOut();
      return "success";
    } catch (e) {
      return "error";
    }
  }
}
