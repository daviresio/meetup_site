import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meetup_site/components/meetup_primary_button.dart';
import 'package:meetup_site/components/meetup_text_button.dart';
import 'package:meetup_site/helpers/meetup_colors.dart';
import 'package:meetup_site/helpers/meetup_icons.dart';

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
        child: Container(
          margin: const EdgeInsets.all(28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/flutter_logo.png',
                width: 170,
              ),
              Row(
                children: [
                  MeetupTextButton(label: 'Nossa comunidade', onPressed: () {}),
                  const SizedBox(width: 16),
                  MeetupTextButton(label: 'O Evento', onPressed: () {}),
                  const SizedBox(width: 16),
                  MeetupTextButton(label: 'Palestrantes', onPressed: () {}),
                  const SizedBox(width: 16),
                  MeetupPrimaryButton(
                      label: 'Faça sua inscrição', onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      );

  Widget get _banner => SliverToBoxAdapter(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: -400,
              child: Container(
                width: 600,
                height: 600,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(157, 141, 230, 0.75),
                  borderRadius: BorderRadius.circular(300),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 250, sigmaY: 0, tileMode: TileMode.mirror),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '13/12 ÀS 19H',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'VENHA',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'DECOLAR SEUS',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'CONHECIMENTOS',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Crie network e aprenda em um ambiente colaborativo. Com reuniões mensais nos melhores espaços de inovação em Ribeirão Preto.',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 32),
                        MeetupPrimaryButton(
                            label: 'Inscreva-se', onPressed: () {}),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/images/banner.png',
                    width: 652,
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget get _ourComunity => SliverToBoxAdapter(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: -400,
              child: Container(
                width: 600,
                height: 600,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 199, 250, 0.75),
                  borderRadius: BorderRadius.circular(300),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 250, sigmaY: 0, tileMode: TileMode.mirror),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/our_community.png',
                  width: 576,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nossa comunidade',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.w700,
                          )),
                      Text(
                          'O meetup é formado pela comunidade e para a comunidade. Qualquer um é bem vindo para contribuir, seja você iniciante ou experiente, sempre tem uma forma de contribuir.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          )),
                      const SizedBox(height: 32),
                      Text(
                          'O meetup é formado pela comunidade e para a comunidade. Qualquer um é bem vindo para contribuir, seja você iniciante ou experiente, sempre tem uma forma de contribuir.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget get _eventTopics => SliverToBoxAdapter(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: -400,
              child: Container(
                width: 600,
                height: 600,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 199, 250, 0.75),
                  borderRadius: BorderRadius.circular(300),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 250, sigmaY: 0, tileMode: TileMode.mirror),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Container(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Programação do evento',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.w700,
                      )),
                  const SizedBox(height: 24),
                  Text(
                      'Confira aqui tudo que vai rolar no dia e não perca nada.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      )),
                  const SizedBox(height: 40),
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
            )
          ],
        ),
      );

  Widget _eventDescriptionItem(String description) {
    return Container(
      width: 235,
      margin: const EdgeInsets.only(right: 40),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.5)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/analysis.png', width: 50),
          const SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
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
                Text('Nossos palestrantes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                    )),
                const SizedBox(height: 32),
                Text(
                    'Confira aqui os palestrantes que vão apresentar o que vão rolar no dia.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    )),
                const SizedBox(height: 16),
                Text(
                    'Confira aqui os palestrantes que vão apresentar o que vão rolar no dia.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    )),
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
                        borderRadius: BorderRadius.circular(250),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xff00c7fa),
                              Color(0xff8363f3).withOpacity(0),
                            ])),
                  ),
                ),
                Row(
                  children: [
                    _userCard(
                      imagePath: 'assets/images/sostenes.jpeg',
                      name: 'Sostenes Gomes',
                      description: 'Head Mobile',
                    ),
                    const SizedBox(width: 48),
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
          const SizedBox(height: 32),
          Text(
            name,
            style: TextStyle(
              color: Color(0xff4e4b59),
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              color: Color(0xff7a7786),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
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
                      Color(0xff623cea),
                      Color(0xff00c7fa),
                    ],
                  ),
                ),
              ),
            ),
            Image.asset(
              'assets/images/not_loose_time.png',
              width: 500,
            ),
          ],
        ),
      );

  Widget get _footer => SliverToBoxAdapter(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/flutter_logo.png', width: 170),
              Text('Design by | behance.net/joaotrld',
                  style: TextStyle(
                    color: Color(0xffa3a3a3),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  )),
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
