
import 'package:firebase_art/reusable_widget/reusable_widget.dart';
import 'package:firebase_art/screens/home_screen.dart';
import 'package:firebase_art/screens/signin_screen.dart';
import 'package:firebase_art/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _NameTextController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 255, 166, 1),
        elevation: 0,
        title: const Text(
          "Create An Account",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold ),
          textAlign: TextAlign.center
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
              hexStringToColor("6845400"),
              hexStringToColor("684540"),

          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 80, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 0),
                // name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Name',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ),
                      ),
                    ],
                  ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Name", Icons.person_outline, false,
                    _NameTextController),

                 const SizedBox(height: 10),
                // name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Username',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ),
                      ),
                    ],
                  ),
                  ),

                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Username", Icons.person_outline, false,
                    _userNameTextController),

                 const SizedBox(height: 10),
                // name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Email',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ),
                      ),
                    ],
                  ),
                  ),

                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Email", Icons.lock_outlined, true,
                    _emailTextController),
                
                 const SizedBox(height: 10),
                // name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Password',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ),
                      ),
                    ],
                  ),
                  ),

                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Password", Icons.lock_outlined, false,
                    _passwordTextController),

                 const SizedBox(height: 10),
                // name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Confirm Password',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ),
                      ),
                    ],
                  ),
                  ),

                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Confirm Password", Icons.lock_outlined, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Sign Up", () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    print("Created New Account");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                }),
                
                signInOption(), 
                const SizedBox(height: 10)
              ],
            ),
          ))),
    );
  }
   Row signInOption() {
    return Row( 
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account?",
            style: TextStyle(color: Color.fromARGB(179, 0, 0, 0))),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignInScreen()));
          },
          child: const Text(
            " Sign In",
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
  
}