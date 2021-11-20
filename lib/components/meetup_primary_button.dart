import 'package:flutter/material.dart';

class MeetupPrimaryButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;

  const MeetupPrimaryButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xfFF00C7FA),
          padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .button!
              .merge(TextStyle(fontWeight: FontWeight.w700)),
        ));
  }
}
