import 'package:flutter/material.dart';

class MeetupTextButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;

  const MeetupTextButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
        ),
        child: Text(
          label,
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        ));
  }
}
