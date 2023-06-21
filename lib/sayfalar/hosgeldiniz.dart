import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:edirne_rehberim/menuler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Hosgeldiniz extends StatefulWidget {
  Hosgeldiniz({super.key});

  @override
  State<Hosgeldiniz> createState() => _HosgeldinizState();
}

class _HosgeldinizState extends State<Hosgeldiniz> {

  final googleSignIn = GoogleSignIn();

  late GoogleSignInAccount guser;
  final _auth = FirebaseAuth.instance;

  void getCurrentUser() async {
    try {
      final user =  _auth.currentUser;
      if (user != null) {
        Route route = MaterialPageRoute(builder: (context) => Menuler());
        Navigator.push(context, route);
      }
    } catch (e) {
      print(e);
    }
  }
  String email = '';
  String email2 = '';

  TextEditingController myController = TextEditingController();

  String password = '';


  Future googleLogin() async {

    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;

    final googleAuth = await googleUser.authentication;
    guser = googleUser;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential).then((value)  {
      getCurrentUser();
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 40,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 40.0,
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        RotateAnimatedText('TARIHIYLE'),
                        RotateAnimatedText('DOGASIYLA'),
                        RotateAnimatedText('KULTURUYLE'),
                        RotateAnimatedText('MUTFAGIYLA'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Text(
              "Güzel Edirne'ye hoş geldiniz",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Uygulamamız ilimiz hakkında cebinizde bir yardımcı olması amacıyla tasarlandı.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),

            Text(
              'E-mail',
            ),
            SizedBox(
              height: 50.0,
              child: TextField(
                  onChanged: (value) {
                    email = value;
                  },

                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(

                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(

                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  )),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Password',

            ),
            SizedBox(
              height: 50.0,
              child: TextField(
                  onChanged: (value) {
                    password = value;
                  },

                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  )),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                TextButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(1.0),
                      foregroundColor:
                      MaterialStateProperty.all<Color>(
                          Colors.white),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(
                          Color(0xFF68cbf8)),
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(10.0),
                            side: BorderSide(
                                color: Color(0xFF68cbf8))),
                      ),
                    ),
                    child: Text("Sign in"),
                    onPressed: () async {

                      try {
                        final user =
                        await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          Route route = MaterialPageRoute(
                              builder: (context) => Menuler());
                          Navigator.push(context, route);
                        }
                      } catch (e) {
                        print(e);
                      }
                    }),
                SizedBox(
                  width: 15.0,
                ),
                MaterialButton(
                  child: Text('giris'),
                  onPressed: () {
                    googleLogin();
                  },
                  elevation: 1.3,

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}