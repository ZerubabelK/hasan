import 'package:driver_app/screen/home.dart';
import 'package:driver_app/screen/login_register_page.dart';
import 'package:driver_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    checkFirstVisit();
  }

  Future<void> checkFirstVisit() async {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(158, 54, 53, 53),
      body: Column(
        children: [
          const Spacer(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            margin: const EdgeInsets.only(bottom: 50),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/splash.png'),
              ),
            ),
            child: const Center(
              child: Text(
                'Driver App',
                style: TextStyle(
                  color: yellow,
                  fontSize: 28,
                  fontFamily: 'Poppins-Bold',
                ),
              ),
            ),
          ),
          const Spacer(),
          const Text(
            'Safely drive to your destination',
            style: TextStyle(
                color: white, fontSize: 16, fontFamily: 'Poppins-Light'),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
