import 'dart:ui';

import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MeetupColors.black,
      // backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          _header,
          const SliverToBoxAdapter(child: SizedBox(height: 50)),
          _banner,
          const SliverToBoxAdapter(child: SizedBox(height: 174)),
          _ourComunity,
          const SliverToBoxAdapter(child: SizedBox(height: 174)),
          _eventTopics,
          const SliverToBoxAdapter(child: SizedBox(height: 174)),
          _speakers,
          const SliverToBoxAdapter(child: SizedBox(height: 174)),
          _register,
          const SliverToBoxAdapter(child: SizedBox(height: 174)),
          _footer,
        ],
      ),
    );
  }

  Widget get _header => SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/logo.png', width: 170),
            Row(
              children: [
                MeetupTextButton(label: 'Nossa comunidade', onPressed: () {}),
                MeetupTextButton(label: 'O Evento', onPressed: () {}),
                MeetupTextButton(label: 'Palestrantes', onPressed: () {}),
                const SizedBox(width: MeetupSpacing.medium),
                MeetupPrimaryButton(
                    label: 'Faça sua inscrição', onPressed: () {}),
              ],
            ),
          ],
        ),
      );

  Widget get _banner => SliverToBoxAdapter(
        child: Row(
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
                  const SizedBox(height: MeetupSpacing.small),
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
                  const SizedBox(height: MeetupSpacing.small),
                  Text(
                    'Crie network e aprenda em um ambiente colaborativo. Com reuniões mensais nos melhores espaços de inovação em Ribeirão Preto.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(height: MeetupSpacing.large),
                  MeetupPrimaryButton(
                    label: 'Inscreva-se',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/images/banner.png',
              width: 652,
            ),
          ],
        ),
      );

  Widget get _ourComunity => SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/our_community.png', width: 576),
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
                  const SizedBox(height: MeetupSpacing.mediumLarge),
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

  Widget get _eventTopics => SliverToBoxAdapter(
        child: Container(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Programação do evento',
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(height: MeetupSpacing.mediumLarge),
              Text(
                'Confira aqui tudo que vai rolar no dia e não perca nada.',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(height: MeetupSpacing.big),
              SizedBox(
                height: 190,
                child: CustomScrollView(
                  scrollDirection: Axis.horizontal,
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate([
                        _eventDescriptionItem(
                            'Vai rolar isso, isso isso mais isso e isso também'),
                        _eventDescriptionItem(
                            'Vai rolar isso, isso isso mais isso e isso também'),
                        _eventDescriptionItem(
                            'Vai rolar isso, isso isso mais isso e isso também'),
                        _eventDescriptionItem(
                            'Vai rolar isso, isso isso mais isso e isso também'),
                      ]),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );

  Widget _eventDescriptionItem(String description) {
    return Container(
      width: 235,
      margin: const EdgeInsets.only(right: MeetupSpacing.big),
      padding: const EdgeInsets.all(MeetupSpacing.large),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.5)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/analysis.png', width: 50),
          const SizedBox(height: MeetupSpacing.medium),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }

  Widget get _speakers => SliverToBoxAdapter(
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
                const SizedBox(height: MeetupSpacing.mediumLarge),
                Text(
                  'Confira aqui os palestrantes que vão apresentar o que vão rolar no dia.',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            Stack(
              children: [
                Positioned(
                  top: -100,
                  left: -100,
                  child: Container(
                    width: 425,
                    height: 425,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(MeetupRadius.circular),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          MeetupColors.blue,
                          MeetupColors.purple1.withOpacity(0),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    _userCard(
                      imagePath: 'assets/images/sostenes.jpeg',
                      name: 'Sostenes Gomes',
                      description: 'Head Mobile',
                    ),
                    const SizedBox(width: MeetupSpacing.big),
                    _userCard(
                      imagePath: 'assets/images/davi.png',
                      name: 'Davi Resio',
                      description: 'Flutter developer',
                    ),
                  ],
                )
              ],
            )
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
          const SizedBox(height: MeetupSpacing.small),
          Text(
            description,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }

  Widget get _register => SliverToBoxAdapter(
        child: Stack(
          children: [
            Positioned(
              bottom: 70,
              child: Container(
                width: 1000,
                height: 440,
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
            Image.asset('assets/images/not_loose_time.png', width: 500),
          ],
        ),
      );

  Widget get _footer => SliverToBoxAdapter(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/logo.png', width: 170),
              Text('Design by | behance.net/joaotrld',
                  style: Theme.of(context).textTheme.overline),
              Row(
                children: [
                  Icon(
                    MeetupIcons.linkedin,
                    color: Colors.white,
                  ),
                  Icon(
                    MeetupIcons.instagram,
                    color: Colors.white,
                  ),
                  Icon(
                    MeetupIcons.youtube,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
