import 'package:dsp_tim412_youth_app/Authentification/Registration.dart';
import 'package:dsp_tim412_youth_app/Pages/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool isLoginTrue = false;

  bool isVisible = false;

  final formKey = GlobalKey<FormState>();

  //...............................................Firebase intergraion
  Future<void> signIn() async {
    if (formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim(),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Homepage()),
        );
      } on FirebaseAuthException catch (e) {
        setState(() {
          isLoginTrue = true;
        });
        print('Error: $e');
      }
    }
  }
  //................................Firebasde intergration

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'St. Dominic Savio Youth App',
            style: TextStyle(
                fontSize: 55, fontWeight: FontWeight.bold, color: Colors.green),
          ),
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image.asset('lib/assets/images/boy.jpg', width: 200),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepPurple.withOpacity(0.2),
                    ),
                    child: TextFormField(
                      controller: email,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your email';
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.mail),
                        hintText: 'email',
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepPurple.withOpacity(0.2),
                    ),
                    child: TextFormField(
                      controller: password,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your paswword';
                        } else {
                          return null;
                        }
                      },
                      obscureText: !isVisible,
                      decoration: InputDecoration(
                          icon: const Icon(Icons.lock),
                          hintText: "Password",
                          suffixIcon: IconButton(
                              onPressed: () {
                                //In here we will create a click to show and hide the password a toggle button
                                setState(() {
                                  //toggle button
                                  isVisible = !isVisible;
                                });
                              },
                              icon: Icon(isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off))),
                    ),
                  ),
                  Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.deepPurple,
                      ),
                      child: TextButton(
                          //.......................................firebase authentification done here
                          onPressed: signIn,
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()));
                          },
                          child: const Text("SIGN UP"))
                    ],
                  ),
                  isLoginTrue
                      ? const Text(
                          'Email or password is incorrect',
                          style: TextStyle(color: Colors.red),
                        )
                      : Container()
                ],
              ),
            )),
      )),
    );
  }
}
