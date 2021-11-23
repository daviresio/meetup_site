import 'package:flutter/material.dart';

class ClickWidget extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;

  const ClickWidget({required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
