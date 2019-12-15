import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  UserRepository({FirebaseAuth firebaseAuth, GoogleSignIn googleSignIn})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  // signInWithGoogle()
  Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    await _firebaseAuth.signInWithCredential(credential).catchError((e) {
      print("error in google signin : " + e.toString());
    });

    return _firebaseAuth.currentUser();
  }

  // signInWithCredentials()
  Future<void> signInWithCredentials({String email, String password}) {
    return _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  // signUp
  Future<void> signUp({String email, String password}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  // resetPassword
  Future<void> resetPassword({String email}) async {
    return await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  // signOut
  Future<void> signOut() async {
    return Future.wait([_firebaseAuth.signOut(), _googleSignIn.signOut()]);
  }

  // isSignedIn
  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  // getUser
  Future<Map<String, dynamic>> getUser() async {
    final currentUser = await _firebaseAuth.currentUser();

    return {
      "uid": currentUser.uid,
      "displayName":
          currentUser.displayName != null ? currentUser.displayName : "",
      "email": currentUser.email != null ? currentUser.email : "",
      "phoneNumber":
          currentUser.phoneNumber != null ? currentUser.phoneNumber : "",
      "photoUrl": currentUser.photoUrl != null ? currentUser.photoUrl : "",
      "isAnonymous": currentUser.isAnonymous,
      "isEmailVerified": currentUser.isEmailVerified,
      "providerId": currentUser.providerId,
    };
  }
}
