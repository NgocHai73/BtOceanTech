import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lap234/components/my_button.dart';
import 'package:lap234/components/my_textfield.dart';
import 'package:lap234/helper/helper_functions.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  void login() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text, password: passwordcontroller.text);

      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      // ignore: use_build_context_synchronously
      displayMessageToUser(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///logo
              Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(
                height: 30,
              ),

              ///app name
              const Text(
                'L U K E ',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              ///email
              MyTextField(
                hinText: 'Email',
                obscureText: false,
                controller: emailcontroller,
              ),

              const SizedBox(
                height: 20,
              ),

              ///password
              MyTextField(
                hinText: 'Password',
                obscureText: true,
                controller: passwordcontroller,
              ),

              const SizedBox(
                height: 10,
              ),

              ///forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forgot Password?',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              ///login button
              MyButton(
                text: 'Login',
                onTap: login,
              ),
              const SizedBox(
                height: 10,
              ),

              ///register button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      )),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      ' Register Here',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        )));
  }
}
