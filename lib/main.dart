import 'package:flutter/material.dart';
import 'package:meetup_site/helpers/meetup_colors.dart';
import 'package:meetup_site/pages/home_page/home_page.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Meetup',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: 'Nominee',
            fontSize: 48,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
            height: 1.02,
            color: MeetupColors.white,
          ),
          headline2: TextStyle(
            fontFamily: 'Nominee',
            fontSize: 36.0,
            fontWeight: FontWeight.w700,
            letterSpacing: -2.5,
            height: 1,
            color: MeetupColors.white,
          ),
          headline3: TextStyle(
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
            height: 1,
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
      builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          breakpoints: [
            ResponsiveBreakpoint.resize(100, name: "INITAL", scaleFactor: 0.6),
            ResponsiveBreakpoint.resize(460, name: MOBILE, scaleFactor: 0.8),
            ResponsiveBreakpoint.resize(800, name: TABLET, scaleFactor: 0.8),
            ResponsiveBreakpoint.resize(1100, name: DESKTOP, scaleFactor: 1),
          ]),
    );
  }
}
