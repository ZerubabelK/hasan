import 'package:driver_app/utils/colors.dart';
import 'package:driver_app/widgets/complete.dart';
import 'package:driver_app/widgets/drawer.dart';
import 'package:driver_app/widgets/upcoming.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;
  final List<Widget> EventsWidgets = [
    const UpComing(),
    const Completed(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        foregroundColor: white,
        title: const Padding(
          padding: EdgeInsets.only(left: 80),
          child: Text(
            'Driver App',
            style: TextStyle(
                color: yellow, fontFamily: 'Poppins-Bold', fontSize: 18),
          ),
        ),
      ),
      drawer: Drawers(),
      body: Column(
        children: [
          Center(
            child: Container(
              width: 315,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: grey,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: activeIndex == 0 ? 145 : 132,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: activeIndex == 0 ? yellow : null,
                    ),
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            activeIndex = 0;
                          });
                        },
                        child: Text(
                          'Pickup',
                          style: TextStyle(
                            color: activeIndex == 0 ? Colors.white : white,
                            fontFamily: 'Poppins-Medium',
                            fontSize: 14,
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: activeIndex == 1 ? 145 : 132,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: activeIndex == 1 ? yellow : null,
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          activeIndex = 1;
                        });
                      },
                      child: Text(
                        'Drop Off',
                        style: TextStyle(
                          color: activeIndex == 1 ? Colors.white : white,
                          fontFamily: 'Poppins-Medium',
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: EventsWidgets[activeIndex],
          ),
        ],
      ),
    );
  }
}
