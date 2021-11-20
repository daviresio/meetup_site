import 'package:flutter/material.dart';
import 'package:meetup_site/helpers/meetup_colors.dart';
import 'package:meetup_site/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: 'Nominee',
            fontSize: 48.0,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
            height: 1.02,
            color: MeetupColors.white,
          ),
          headline2: TextStyle(
            fontFamily: 'Nominee',
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
            height: 1.02,
            color: MeetupColors.gray2,
          ),
          bodyText1: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.25,
            height: 1.4,
            color: MeetupColors.gray1,
          ),
          bodyText2: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.25,
            height: 1.02,
            color: MeetupColors.white,
          ),
          subtitle1: TextStyle(
            fontFamily: 'Nominee',
            fontSize: 18.0,
            fontWeight: FontWeight.w300,
            letterSpacing: -0.2,
            height: 1.2,
            color: MeetupColors.white,
          ),
          subtitle2: TextStyle(
            fontFamily: 'Nominee',
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            letterSpacing: -1,
            height: 1.2,
            color: MeetupColors.gray3,
          ),
          button: TextStyle(
            fontFamily: 'Nominee',
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.2,
            height: 1.1,
            color: MeetupColors.white,
          ),
          overline: TextStyle(
            fontFamily: 'Nominee',
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.25,
            height: 1,
            color: MeetupColors.gray1,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
