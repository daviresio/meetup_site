import 'package:flutter/material.dart';
import 'package:meetup_site/helpers/meetup_spacing.dart';

class MeetupTextButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;

  const MeetupTextButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: MeetupSpacing.medium),
          ),
          child: Text(label, style: Theme.of(context).textTheme.button)),
    );
  }
}
