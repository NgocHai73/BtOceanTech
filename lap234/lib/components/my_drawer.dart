import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.favorite,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  leading: const Icon(Icons.home),
                  title: const Text('H O M E'),
                ),
              ),
              // const SizedBox(
              //   height: 15,
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.pushNamed(context, '/profile');
                  },
                  leading: const Icon(Icons.person),
                  title: const Text('P R O F I L E'),
                ),
              ),
              // const SizedBox(
              //   height: 30,
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.pushNamed(context, '/users');
                  },
                  leading: const Icon(Icons.group),
                  title: const Text('U S E R S'),
                ),
              ),
            ],
          ),
          // const SizedBox(
          //   height: 30,
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
            child: ListTile(
              onTap: () {
                Navigator.pop(context);

                logout();
              },
              leading: const Icon(Icons.logout),
              title: const Text('L O G O U T'),
            ),
          ),
        ],
      ),
    );
  }
}
