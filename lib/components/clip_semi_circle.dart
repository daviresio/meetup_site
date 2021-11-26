import 'dart:math' as math;

import 'package:flutter/widgets.dart';

class ClipSemiCircle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.addArc(Rect.fromLTWH(size.width - 30, size.height / 2 - 30, 60, 60), 0,
        math.pi * 2);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
