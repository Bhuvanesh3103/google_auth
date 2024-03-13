import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInDemo extends StatefulWidget {
  @override
  _SignInDemoState createState() => _SignInDemoState();
}
class _SignInDemoState extends State<SignInDemo> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: "249871576567-9t4ib8ideoakonlh8plmmtm2f851gpe0.apps.googleusercontent.com",
  );

  Future<UserCredential?> signInWithGoogle() async {
    await _googleSignIn.signOut();
    final GoogleSignInAccount? googleSignInAccount =
    await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount!.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);
    final UserCredential userCredential =
    await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user!.displayName);
    print(userCredential.user!.email);
    print(userCredential.user!.metadata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Sign In'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: signInWithGoogle,
          child: Text('Sign in with Google'),
        ),
      ),
    );
  }
}
