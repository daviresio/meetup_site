import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meetup_site/components/blur_circle.dart';
import 'package:meetup_site/helpers/meetup_colors.dart';
import 'package:meetup_site/helpers/meetup_spacing.dart';
import 'package:meetup_site/pages/home_page/components/banner_widget.dart';
import 'package:meetup_site/pages/home_page/components/event_topics_widget.dart';
import 'package:meetup_site/pages/home_page/components/footer_widget.dart';
import 'package:meetup_site/pages/home_page/components/header_widget.dart';
import 'package:meetup_site/pages/home_page/components/our_community_widget.dart';
import 'package:meetup_site/pages/home_page/components/register_widget.dart';
import 'package:meetup_site/pages/home_page/components/speakers_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bannerKey = GlobalKey();
  final _ourComunityKey = GlobalKey();
  final _speakersKey = GlobalKey();

  var blurCircles = <Widget>[];

  double yWidgetPosition(GlobalKey key) {
    if (key.currentContext == null) {
      return 0;
    }

    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    return position.dy;
  }

  @override
  Widget build(BuildContext context) {
    print('BUILDADO!');
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if (blurCircles.isNotEmpty) {
        return;
      }

      final bannerY = yWidgetPosition(_bannerKey);
      final ourComunityY = yWidgetPosition(_ourComunityKey);
      final speakersY = yWidgetPosition(_speakersKey);

      setState(() {
        blurCircles = [
          BlurCircle(
            positionY: bannerY,
            side: BlurCircleSide.right,
            color: BlurCircleColor.purple,
          ),
          BlurCircle(
            positionY: ourComunityY + 100,
            side: BlurCircleSide.left,
            color: BlurCircleColor.blue,
          ),
          BlurCircle(
            positionY: speakersY + 200,
            side: BlurCircleSide.right,
            color: BlurCircleColor.blue,
          ),
          BlurCircle(
            positionY: speakersY + 500,
            side: BlurCircleSide.left,
            color: BlurCircleColor.purple,
          ),
        ];
      });
    });

    return Container(
      color: MeetupColors.black,
      child: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
              child: Stack(
            children: [
              ...blurCircles,
              Center(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 1280),
                      child: ListView(
                        shrinkWrap: true,
                        children: _content,
                      ))),
            ],
          )),
        ],
      ),
    );
  }

  List<Widget> get _content => [
        const SizedBox(height: MeetupSpacing.large),
        HeaderWidget(),
        const SizedBox(height: MeetupSpacing.huge2),
        BannerWidget(key: _bannerKey),
        OurCommunityWidget(key: _ourComunityKey),
        SizedBox(
          height: ResponsiveValue(
            context,
            defaultValue: MeetupSpacing.huge1,
            valueWhen: const [
              Condition.smallerThan(name: DESKTOP, value: MeetupSpacing.large),
            ],
          ).value,
        ),
        const SizedBox(height: MeetupSpacing.huge3),
        EventTopicsWidget(),
        SpeakersWidget(key: _speakersKey),
        RegisterWidget(),
        const SizedBox(height: MeetupSpacing.huge2),
        FooterWidget(),
        const SizedBox(height: MeetupSpacing.big3),
      ];
}
