import 'package:flutter/material.dart';

class DetailsTile extends StatelessWidget {
  const DetailsTile({super.key, required this.label, required this.icon});

  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.indigo,
          child: Icon(icon, size: 18, color: Colors.white),
        ),
        SizedBox(width: 10),
        Text(label, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
