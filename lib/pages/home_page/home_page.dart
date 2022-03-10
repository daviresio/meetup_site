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
import 'package:meetup_site/pages/home_page/components/partners_widget.dart';
import 'package:meetup_site/pages/home_page/components/register_widget.dart';
import 'package:meetup_site/pages/home_page/components/speakers_widget.dart';
import 'package:meetup_site/pages/home_page/home_controller.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ItemScrollController itemScrollController = ItemScrollController();

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

  // final precachedQrCode = Image.asset('assets/images/qr_code.png', width: 130);
  // final precachedQrCodeWhatsapp =
  //     Image.asset('assets/images/qr_code_whatsapp.png', width: 130);

  // @override
  // void didChangeDependencies() {
  //   precacheImage(precachedQrCode.image, context);
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    // return widgetToFile(
    //   context: context,
    //   name: 'Davi Resio',
    //   ticketNumber: '123456',
    //   isPresential: true,
    //   precachedQrCode: precachedQrCode,
    //   precachedQrCodeWhatsapp: precachedQrCodeWhatsapp,
    // );

    return Container(
      color: MeetupColors.black,
      child: Stack(
        children: [
          BlurCircle(
            positionY: 50,
            side: BlurCircleSide.right,
            color: BlurCircleColor.purple,
          ),
          BlurCircle(
            positionY: 350,
            side: BlurCircleSide.left,
            color: BlurCircleColor.blue,
          ),
          Container(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('EM BREVE', style: Theme.of(context).textTheme.headline1),
                const SizedBox(height: 20),
                Text('NOVA EDIÇÃO',
                    style: Theme.of(context).textTheme.headline1),
                const SizedBox(height: 20),
                SizedBox(
                  width: 400,
                  child: Text(
                    'Entre no nosso grupo do whatsapp e fique por dentro de tudo que rola na comunidade!',
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40),
                Image.asset('assets/images/qr_code_whatsapp.png', width: 400),
              ],
            ),
          )
          // ScrollablePositionedList.builder(
          //   itemCount: _content.length,
          //   itemBuilder: (context, index) => Center(
          //       child: ConstrainedBox(
          //     constraints: BoxConstraints(maxWidth: 1280),
          //     child: _content[index],
          //   )),
          //   itemScrollController: itemScrollController,
          //   // itemPositionsListener: itemPositionsListener,
          //   shrinkWrap: true,
          //   physics: ClampingScrollPhysics(),
          // ),
        ],
      ),
    );
  }

  List<Widget> get _content => [
        const SizedBox(height: MeetupSpacing.large),
        HeaderWidget(
          scrollToElement: (index) async {
            try {
              await itemScrollController.scrollTo(
                  index: index, duration: const Duration(milliseconds: 500));
            } catch (e) {
              print(e);
            }
          },
        ),
        const SizedBox(height: MeetupSpacing.huge2),
        BannerWidget(key: _bannerKey),
        const SizedBox(height: MeetupSpacing.big3),
        OurCommunityWidget(
          key: _ourComunityKey,
          scrollToElement: (index) async {
            try {
              await itemScrollController.scrollTo(
                  index: index, duration: const Duration(milliseconds: 500));
            } catch (e) {
              print(e);
            }
          },
        ),
        SizedBox(height: MeetupSpacing.huge3),
        const EventTopicsWidget(),
        SpeakersWidget(key: _speakersKey),
        const RegisterWidget(),
        const PartnersWidget(),
        const SizedBox(height: MeetupSpacing.huge2),
        const FooterWidget(),
        const SizedBox(height: MeetupSpacing.big3),
      ];
}
