import 'package:flutter/material.dart';
import 'package:meetup_site/components/meetup_radius.dart';
import 'package:meetup_site/helpers/meetup_colors.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
    final amount =
        ResponsiveWrapper.of(context).isSmallerThan(TABLET) ? -600.0 : -450.0;
    return Positioned(
      left: side == BlurCircleSide.left ? amount : null,
      top: positionY,
      right: side == BlurCircleSide.right ? amount : null,
      child: IgnorePointer(
        ignoring: true,
        child: Container(
          width: 660,
          height: 660,
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
      ),
    );
  }
}
