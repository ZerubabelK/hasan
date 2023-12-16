import 'dart:developer';
import 'dart:io';
import 'package:driver_app/screen/login_register_page.dart';
import 'package:driver_app/utils/colors.dart';
import 'package:flutter/material.dart';

class Drawers extends StatefulWidget {
  // const EndDrawers({super.key});

  @override
  State<Drawers> createState() => _EndDrawersState();
}

class _EndDrawersState extends State<Drawers> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            padding: EdgeInsets.only(top: 60, left: 10),
            decoration: BoxDecoration(
              color: black,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/image/splash.png'),
                  backgroundColor: yellow, // Set the background color to yellow
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: yellow,
                      child: CircleAvatar(
                        radius: 26,
                        backgroundImage: AssetImage('assets/image/splash.png'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Zerubabel',
                  style: TextStyle(
                    color: yellow,
                    fontSize: 18,
                    fontFamily: 'Poppins-Regular',
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.info_outline,
              color: yellow,
            ),
            title: const Text(
              'About Us',
              style: TextStyle(
                fontFamily: 'Urbanist-Bold',
                fontSize: 16,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.share,
              color: yellow,
            ),
            title: const Text(
              'Share App',
              style: TextStyle(
                fontFamily: 'Poppins-Regular',
                fontSize: 16,
              ),
            ),
            onTap: () async {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.dark_mode,
              color: yellow,
            ),
            title: const Text(
              'Light Mode',
              style: TextStyle(
                fontFamily: 'Poppins-Regular',
                fontSize: 16,
              ),
            ),
            trailing: const Icon(
              Icons.toggle_off,
              size: 40,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: yellow,
            ),
            title: const Text(
              'logout',
              style: TextStyle(
                fontFamily: 'Poppins-Regular',
                fontSize: 16,
              ),
            ),
            onTap: () async {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
