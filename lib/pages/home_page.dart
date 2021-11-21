import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meetup_site/components/blur_circle.dart';
import 'package:meetup_site/components/meetup_primary_button.dart';
import 'package:meetup_site/components/meetup_radius.dart';
import 'package:meetup_site/components/meetup_text_button.dart';
import 'package:meetup_site/helpers/meetup_colors.dart';
import 'package:meetup_site/helpers/meetup_icons.dart';
import 'package:meetup_site/helpers/meetup_spacing.dart';

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

  @override
  void initState() {
    super.initState();
  }

  double yWidgetPosition(GlobalKey key) {
    if (key.currentContext == null) {
      print('nulo');
      return 0;
    }
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    return position.dy;
  }

  @override
  Widget build(BuildContext context) {
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
            positionY: ourComunityY,
            side: BlurCircleSide.left,
            color: BlurCircleColor.blue,
          ),
          BlurCircle(
            positionY: speakersY,
            side: BlurCircleSide.right,
            color: BlurCircleColor.blue,
          ),
          BlurCircle(
            positionY: speakersY + 300,
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
              child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1280),
              child: Stack(
                children: [
                  ...blurCircles,
                  _content,
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }

  Widget get _content => Column(
        children: [
          const SizedBox(height: MeetupSpacing.large),
          _header,
          const SizedBox(height: MeetupSpacing.huge2),
          _banner,
          const SizedBox(height: MeetupSpacing.huge1),
          _ourComunity,
          const SizedBox(height: MeetupSpacing.huge3),
          _eventTopics,
          _speakers,
          _register,
          const SizedBox(height: MeetupSpacing.huge2),
          _footer,
          const SizedBox(height: MeetupSpacing.big2),
        ],
      );

  Widget get _header => Padding(
        padding: const EdgeInsets.only(
          left: MeetupSpacing.big1,
          right: MeetupSpacing.big1,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/logo.png'),
            Row(
              children: [
                MeetupTextButton(label: 'Nossa comunidade', onPressed: () {}),
                MeetupTextButton(label: 'O Evento', onPressed: () {}),
                MeetupTextButton(label: 'Palestrantes', onPressed: () {}),
                const SizedBox(width: MeetupSpacing.small),
                MeetupPrimaryButton(
                    label: 'Faça sua inscrição', onPressed: () {}),
              ],
            ),
          ],
        ),
      );

  Widget get _banner => Padding(
        padding: const EdgeInsets.only(
          left: MeetupSpacing.big1,
          right: MeetupSpacing.big1,
        ),
        child: Row(
          key: _bannerKey,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '13/12 ÀS 19H',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(height: MeetupSpacing.tiny),
                  Text(
                    'VENHA',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    'DECOLAR SEUS',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    'CONHECIMENTOS',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(height: MeetupSpacing.tiny),
                  Text(
                    'Crie network e aprenda em um ambiente colaborativo. Com reuniões mensais nos melhores espaços de inovação em Ribeirão Preto.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(height: MeetupSpacing.large),
                  MeetupPrimaryButton(
                    label: 'Inscreva-se',
                    onPressed: () {},
                  ),
                  const SizedBox(height: MeetupSpacing.huge2),
                ],
              ),
            ),
            const SizedBox(width: MeetupSpacing.small),
            Image.asset('assets/images/banner.png'),
          ],
        ),
      );

  Widget get _ourComunity => Padding(
        padding: const EdgeInsets.only(
          left: MeetupSpacing.big1,
          right: MeetupSpacing.big1,
        ),
        child: Row(
          key: _ourComunityKey,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/our_community.png'),
            const SizedBox(width: MeetupSpacing.big3),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nossa comunidade',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(height: MeetupSpacing.large),
                  Text(
                    'O meetup é formado pela comunidade e para a comunidade. Qualquer um é bem vindo para contribuir, seja você iniciante ou experiente, sempre tem uma forma de contribuir.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(height: MeetupSpacing.medium),
                  Text(
                    'O meetup é formado pela comunidade e para a comunidade. Qualquer um é bem vindo para contribuir, seja você iniciante ou experiente, sempre tem uma forma de contribuir.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget get _eventTopics => Container(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: MeetupSpacing.big1,
                right: MeetupSpacing.big1,
              ),
              child: Text(
                'Programação do evento',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            const SizedBox(height: MeetupSpacing.medium),
            Padding(
              padding: const EdgeInsets.only(
                left: MeetupSpacing.big1,
                right: MeetupSpacing.big1,
              ),
              child: Text(
                'Confira aqui tudo que vai rolar no dia e não perca nada.',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            const SizedBox(height: MeetupSpacing.big1),
            SizedBox(
              height: 190,
              child: Center(
                child: CustomScrollView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate([
                        SizedBox(width: MeetupSpacing.big1),
                        _eventDescriptionItem(
                            'Vai rolar isso, isso isso mais isso e isso também'),
                        SizedBox(width: MeetupSpacing.big1),
                        _eventDescriptionItem(
                            'Vai rolar isso, isso isso mais isso e isso também'),
                        SizedBox(width: MeetupSpacing.big1),
                        _eventDescriptionItem(
                            'Vai rolar isso, isso isso mais isso e isso também'),
                        SizedBox(width: MeetupSpacing.big1),
                        _eventDescriptionItem(
                            'Vai rolar isso, isso isso mais isso e isso também'),
                        SizedBox(width: MeetupSpacing.big1),
                      ]),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );

  Widget _eventDescriptionItem(String description) {
    return Container(
      width: 235,
      padding: const EdgeInsets.all(MeetupSpacing.large),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.5)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/analysis.png'),
          const SizedBox(height: MeetupSpacing.small),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }

  Widget get _speakers => Padding(
        padding: const EdgeInsets.only(
          left: MeetupSpacing.big1,
          right: MeetupSpacing.big1,
        ),
        child: Stack(
          key: _speakersKey,
          children: [
            Positioned(
              top: 100,
              left: MediaQuery.of(context).size.width / 2 - 200,
              child: Container(
                width: 425,
                height: 425,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(MeetupRadius.circular),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0, 0.4, 0.6],
                    colors: [
                      MeetupColors.blue.withOpacity(0.6),
                      MeetupColors.purple3.withOpacity(0.1),
                      MeetupColors.purple3.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
            FittedBox(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: MeetupSpacing.huge3,
                  bottom: MeetupSpacing.big2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Nossos',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text(
                          'palestrantes',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        const SizedBox(height: MeetupSpacing.large),
                        Text(
                          'Confira aqui os palestrantes que vão apresentar o que vão rolar no dia.',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(height: MeetupSpacing.medium),
                        Text(
                          'Confira aqui os palestrantes que vão apresentar o que vão rolar no dia.',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                    const SizedBox(width: MeetupSpacing.large),
                    Row(
                      children: [
                        _userCard(
                          imagePath: 'assets/images/sostenes.jpeg',
                          name: 'Sostenes Gomes',
                          description: 'Head Mobile',
                        ),
                        const SizedBox(width: MeetupSpacing.big1),
                        _userCard(
                          imagePath: 'assets/images/davi.png',
                          name: 'Davi Resio',
                          description: 'Flutter developer',
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget _userCard({
    required String imagePath,
    required String name,
    required String description,
  }) {
    return Container(
      width: 280,
      height: 370,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              imagePath,
              width: 165,
              height: 165,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: MeetupSpacing.large),
          Text(name, style: Theme.of(context).textTheme.headline2),
          const SizedBox(height: MeetupSpacing.tiny),
          Text(
            description,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }

  Widget get _register => Padding(
        padding: const EdgeInsets.only(
          left: MeetupSpacing.big1,
          right: MeetupSpacing.big1,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 440,
                margin: EdgeInsets.only(top: MeetupSpacing.big3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      MeetupColors.purple2,
                      MeetupColors.blue,
                    ],
                  ),
                ),
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    margin: EdgeInsets.only(
                      top: MeetupSpacing.big3 + MeetupSpacing.medium,
                      left: MeetupSpacing.medium,
                    ),
                    child:
                        Image.asset('assets/images/squares_and_circles.png'))),
            Image.asset('assets/images/not_loose_time.png'),
          ],
        ),
      );

  Widget get _footer => Padding(
        padding: const EdgeInsets.only(
          left: MeetupSpacing.big1,
          right: MeetupSpacing.big1,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/logo.png'),
            Text('Design by | behance.net/joaotrld',
                style: Theme.of(context).textTheme.overline),
            Row(
              children: [
                Icon(MeetupIcons.linkedin, color: Colors.white),
                const SizedBox(width: MeetupSpacing.medium),
                Icon(MeetupIcons.instagram, color: Colors.white),
                const SizedBox(width: MeetupSpacing.medium),
                Icon(MeetupIcons.youtube, color: Colors.white),
              ],
            ),
          ],
        ),
      );
}
