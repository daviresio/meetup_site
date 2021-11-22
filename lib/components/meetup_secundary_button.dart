import 'package:flutter/material.dart';
import 'package:meetup_site/helpers/meetup_colors.dart';

class MeetupSecundaryButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;

  const MeetupSecundaryButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: MeetupColors.black),
          onPressed: onPressed,
          child: Text(
            label,
            style: Theme.of(context)
                .textTheme
                .button!
                .merge(TextStyle(fontWeight: FontWeight.w700)),
          )),
    );
  }
}
