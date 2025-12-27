import 'package:flutter/material.dart';

class CallButton extends StatelessWidget {
  final String number;
  final void Function() onTap;

  const CallButton({super.key, required this.number, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.indigoAccent.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(children: [Icon(Icons.call), Text(number)]),
      ),
    );
  }
}
