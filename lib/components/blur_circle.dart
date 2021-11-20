import 'package:flutter/material.dart';
import 'package:meetup_site/components/meetup_radius.dart';
import 'package:meetup_site/helpers/meetup_colors.dart';

class BlurCircle extends StatelessWidget {
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final Color color;

  const BlurCircle({
    required this.color,
    this.left,
    this.top,
    this.right,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      child: Container(
        width: 660,
        height: 660,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MeetupRadius.circular),
          boxShadow: [
            BoxShadow(
              color: MeetupColors.purple1.withOpacity(0.75),
              blurRadius: 500,
              spreadRadius: -10,
              offset: Offset(0, 0),
            ),
          ],
        ),
      ),
    );
  }
}
