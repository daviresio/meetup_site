import 'package:flutter/material.dart';
import 'package:meetup_site/components/meetup_radius.dart';
import 'package:meetup_site/helpers/meetup_colors.dart';

enum BlurCircleColor {
  purple,
  blue,
}

enum BlurCircleSide {
  left,
  right,
}

final colors = {
  BlurCircleColor.purple: MeetupColors.purple1.withOpacity(0.75),
  BlurCircleColor.blue: MeetupColors.blue.withOpacity(0.75),
};

class BlurCircle extends StatelessWidget {
  final double? positionY;
  final BlurCircleColor color;
  final BlurCircleSide side;

  const BlurCircle({
    required this.color,
    required this.side,
    this.positionY,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 660,
        height: 660,
        margin: EdgeInsets.only(
          left: side == BlurCircleSide.left ? 1200 : 0,
          top: positionY ?? 0,
          right: side == BlurCircleSide.right ? 1200 : 0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MeetupRadius.circular),
          boxShadow: [
            BoxShadow(
              color: colors[color]!,
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
