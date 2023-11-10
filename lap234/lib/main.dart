import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lap234/auth/auth.dart';
import 'package:lap234/auth/login_or_register.dart';
import 'package:lap234/firebase_options.dart';
import 'package:lap234/pages/home_page.dart';
import 'package:lap234/pages/login_page.dart';
import 'package:lap234/pages/profile_page.dart';
import 'package:lap234/pages/register_page.dart';
import 'package:lap234/pages/users_page.dart';
import 'package:lap234/theme/dark_mode.dart';
import 'package:lap234/theme/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      // theme: lightMode,
      // darkTheme: darkMode,
    routes: {
      '/login_register': (context) => const LoginOrRegister(),
      '/home':(context) => const HomePage(),
      '/profile':(context) => const ProfilePage(),
      '/users':(context) => const UsersPage(),
    },
    );
  }
}
