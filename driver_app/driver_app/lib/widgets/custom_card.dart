import 'package:driver_app/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        height: 80.0,
        decoration: BoxDecoration(
          color: Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(16.0),
        child: const Row(
          children: [
            Icon(
              Icons.man_3_sharp,
              color: yellow,
              size: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Abel Abebe',
                  style: TextStyle(
                    color: white,
                    fontSize: 18,
                    fontFamily: 'Poppins-SemiBold',
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: yellow,
                      size: 15,
                    ),
                    Text(
                      'Around Bolo Area',
                      style: TextStyle(
                        color: white,
                        fontSize: 11,
                        fontFamily: 'Poppins-Light',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '14/03/2023 ',
                  style: TextStyle(
                    color: white,
                    fontSize: 14,
                    fontFamily: 'Poppins-Light',
                  ),
                ),
                Text(
                  '08:39 AM',
                  style: TextStyle(
                    color: white,
                    fontSize: 12,
                    fontFamily: 'Poppins-Regular',
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
