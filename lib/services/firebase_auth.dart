import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:health_aid_app/locator.dart';
import 'package:health_aid_app/services/navigation_service.dart';
import './database.dart';

abstract class BaseAuth {
  Future<FirebaseUser> signIn(String email, String password);

  Future<FirebaseUser> signUp(String email, String password);

  Future<FirebaseUser> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> sendPasswordResetEmail(String email);

  Future<void> signOut();

  Future<bool> isEmailVerified();

  Future<void> reloadUser();

  Future<void> googleSignIn();

  Future<void> updateUserProfile({displayName, photoUrl});
}

class Auth implements BaseAuth {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  NavigationService _nav = locator.get<NavigationService>();

  GoogleSignIn _googleSignIn = GoogleSignIn();
  DatabaseService _dbService = DatabaseService();

  Future<FirebaseUser> signUp(String email, String password) async {
    AuthResult _authResult = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    await _dbService.saveDeviceToken();

    return _authResult.user;
  }

  Future<FirebaseUser> signIn(String email, String password) async {
    AuthResult r = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return r.user;
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await firebaseAuth.currentUser();
    return user;
  }

  Future<void> signOut() async {
    try {
      _nav.moveTo('/');
      await firebaseAuth.signOut();
      _googleSignIn.signOut();
      _googleSignIn.disconnect();
    } catch (e) {
      print(e);
    }
  }

  Future<void> sendEmailVerification() async {
    FirebaseUser user = await firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  Future<void> updateUserProfile({displayName, photoUrl}) async {
    FirebaseUser user = await firebaseAuth.currentUser();

    UserUpdateInfo updateUser = UserUpdateInfo();
    updateUser.displayName = await displayName;

    await user.updateProfile(updateUser);
    await user.reload();
  }

  Future<void> sendPasswordResetEmail(email) async {
    return firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await firebaseAuth.currentUser();

    return user.isEmailVerified;
  }

  Future<void> reloadUser() async {
    FirebaseUser user = await firebaseAuth.currentUser();
    user.reload();
  }

  Future<FirebaseUser> googleSignIn() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential _credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    AuthResult results = await firebaseAuth.signInWithCredential(_credential);

    await _dbService.saveDeviceToken();
    return results.user;
  }
}
