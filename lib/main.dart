import 'package:chat_app/pages/authenticate_page.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    // 'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Firebase',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SigninWithGoogle());
  }
}

class SigninWithGoogle extends StatefulWidget {
  const SigninWithGoogle({Key? key}) : super(key: key);

  @override
  State<SigninWithGoogle> createState() => _SigninWithGoogleState();
}

class _SigninWithGoogleState extends State<SigninWithGoogle> {
  GoogleSignInAccount? _currentUser;
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print("error: $error");
    }
  }

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((event) {
      setState(() {
        _currentUser = event;
        print("user: $_currentUser");
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _currentUser == null ? Text("Login") : Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              if (_currentUser == null)
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    onPressed: () => _handleSignIn(),
                    child: const Text("Login with Google"),
                  ),
                ),
              if (_currentUser != null)
                ListTile(
                  leading: GoogleUserCircleAvatar(identity: _currentUser!),
                  title: Text(_currentUser!.displayName ?? 'kosong'),
                  subtitle: Text(_currentUser!.email ?? "Email Kosong"),
                )
            ],
          ),
        ),
      ),
    );
  }
}
