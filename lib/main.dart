import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sample_fire/sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAP_23jOvRGxIzrTyfqA_iQfHP9-PqxI4Q",
          authDomain: "fir-86b8b.firebaseapp.com",
          projectId: "fir-86b8b",
          storageBucket: "fir-86b8b.appspot.com",
          messagingSenderId: "249871576567",
          appId: "1:249871576567:web:29fd741a1b579a2610d2f2",
          measurementId: "G-97P882RD7J",
      )
  );

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:SignInDemo(),
    );
  }
}

