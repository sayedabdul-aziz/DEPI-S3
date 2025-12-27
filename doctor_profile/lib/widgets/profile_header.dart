import 'package:doctor_profile/widgets/call_button.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Image.network(
            'https://static.vecteezy.com/system/resources/thumbnails/046/380/882/small/3d-cute-cartoon-male-doctor-png.png',
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dr. Ahmed Ali',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.indigoAccent,
              ),
            ),
            SizedBox(height: 5),
            Text('Dentist', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange),
                SizedBox(width: 5),
                Text(
                  '3.5',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                CallButton(
                  number: '1',
                  onTap: () {
                    // call n1
                  },
                ),
                SizedBox(width: 10),
                CallButton(
                  number: '2',
                  onTap: () {
                    // call n2
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
