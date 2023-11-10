import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lap234/components/my_button.dart';
import 'package:lap234/components/my_textfield.dart';
import 'package:lap234/helper/helper_functions.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernamecontroller = TextEditingController();

  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  TextEditingController confirmPasswordcontroller = TextEditingController();

  void registerUser() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    if (passwordcontroller.text != confirmPasswordcontroller.text) {
      Navigator.pop(context);

      displayMessageToUser('Password does not match', context);
    } else {
      try {
        UserCredential? userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailcontroller.text, password: passwordcontroller.text);
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        displayMessageToUser(e.code, context);
      }
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
              MyTextField(
                hinText: 'Username',
                obscureText: false,
                controller: usernamecontroller,
              ),

              const SizedBox(
                height: 20,
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
              MyTextField(
                hinText: 'Comfirm Password',
                obscureText: true,
                controller: confirmPasswordcontroller,
              ),

              const SizedBox(
                height: 20,
              ),

              ///register button
              MyButton(
                text: 'Register',
                onTap: registerUser,
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
                    child: Text(
                      ' Login Here',
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
