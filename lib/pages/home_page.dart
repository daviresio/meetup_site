import 'package:flutter/material.dart';
import 'package:meetup_site/helpers/meetup_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MeetupColors.black,
      body: CustomScrollView(
        slivers: [
          _header,
        ],
      ),
    );
  }

  Widget get _header => SliverToBoxAdapter(
        child: Container(
          margin: const EdgeInsets.all(28),
          child: Row(
            children: [
              Image.asset(
                'assets/images/flutter_logo.png',
                width: 170,
              )
            ],
          ),
        ),
      );
}
