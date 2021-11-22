import 'dart:ui';

import 'package:emojis/emojis.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:meetup_site/components/blur_circle.dart';
import 'package:meetup_site/components/meetup_primary_button.dart';
import 'package:meetup_site/components/meetup_radius.dart';
import 'package:meetup_site/components/meetup_secundary_button.dart';
import 'package:meetup_site/components/meetup_text_button.dart';
import 'package:meetup_site/components/meetup_text_field.dart';
import 'package:meetup_site/helpers/meetup_colors.dart';
import 'package:meetup_site/helpers/meetup_icons.dart';
import 'package:meetup_site/helpers/meetup_spacing.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormBuilderState>();

  final _bannerKey = GlobalKey();
  final _ourComunityKey = GlobalKey();
  final _speakersKey = GlobalKey();

  var blurCircles = <Widget>[];

  late final _animationBannerController;
  late final _animationOurCommunityController;

  late final Animation<double> _animationBannerValue;
  late final Animation<double> _animationOurCommunityValue;

  late final FlipCardController _flipCardController1;
  late final FlipCardController _flipCardController2;

  @override
  void initState() {
    super.initState();

    _animationBannerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animationOurCommunityController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animationBannerValue = Tween<double>(
      begin: 0.0,
      end: 0.3,
    ).animate(
      CurvedAnimation(
        parent: _animationBannerController,
        curve: Curves.easeInOut,
      ),
    );

    _animationOurCommunityValue = Tween<double>(
      begin: 0.0,
      end: 0.2,
    ).animate(
      CurvedAnimation(
        parent: _animationOurCommunityController,
        curve: Curves.easeInOut,
      ),
    );

    _flipCardController1 = FlipCardController();
    _flipCardController2 = FlipCardController();
  }

  @override
  void dispose() {
    _animationBannerController.dispose();
    _animationOurCommunityController.dispose();
    super.dispose();
  }

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
          const SizedBox(height: MeetupSpacing.big3),
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
            MouseRegion(
              onHover: (event) {
                _animationBannerController.forward();
              },
              onExit: (event) {
                _animationBannerController.reverse();
              },
              child: AnimatedBuilder(
                animation: _animationBannerController,
                builder: (context, child) => Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(_animationBannerValue.value)
                    ..scale(1 + _animationBannerValue.value)
                    ..translate(_animationBannerValue.value * 100, 0),
                  alignment: Alignment.centerRight,
                  child: Image.asset('assets/images/banner.png'),
                ),
              ),
            ),
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
            MouseRegion(
              onHover: (event) {
                _animationOurCommunityController.forward();
              },
              onExit: (event) {
                _animationOurCommunityController.reverse();
              },
              child: AnimatedBuilder(
                animation: _animationOurCommunityController,
                builder: (context, child) => Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(-_animationOurCommunityValue.value)
                    ..scale(1 + _animationOurCommunityValue.value)
                    ..translate(-_animationOurCommunityValue.value * 100, 0),
                  alignment: Alignment.centerLeft,
                  child: Image.asset('assets/images/our_community.png'),
                ),
              ),
            ),
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
                    'Com reuniões mensais, é o lugar ideal para estar por dentro do flutter, além de conhecer o trabalho dos devs flutter da região de Ribeirão Preto.',
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
                            'Evento no espaço de inovação Bild Labs'),
                        SizedBox(width: MeetupSpacing.big1),
                        _eventDescriptionItem(
                            'Palestra sobre arquitetar apps flutter'),
                        SizedBox(width: MeetupSpacing.big1),
                        _eventDescriptionItem(
                            'Palestra sobre UI da vida real com CustomPainter'),
                        SizedBox(width: MeetupSpacing.big1),
                        _eventDescriptionItem(
                            'Aproveite para fazer bastante network'),
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
                          jobPosition: 'Head Mobile',
                          title: 'Arquitetando apps flutter',
                          description:
                              'Nessa palestra vou falar sobre os principais fatores que devemos levar em consideração para a arquitetura de um app flutter, e apresentar opções de arquitetura para o seu app.',
                          flipController: _flipCardController1,
                        ),
                        const SizedBox(width: MeetupSpacing.big1),
                        _userCard(
                          imagePath: 'assets/images/davi.png',
                          name: 'Davi Resio',
                          jobPosition: 'Flutter developer',
                          title: 'Interfaces fora da curva com CustomPainter',
                          description:
                              'Nessa palestra vou mostrar cenários em que na Dryve fizemos o uso de CustomPaint (canvas) para criar interfaces únicas, em cenários que não seria possível, ou seria muito difícil alcançar estilizando com widgets tradicionais.',
                          flipController: _flipCardController2,
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
    required String jobPosition,
    required String title,
    required String description,
    required FlipCardController flipController,
  }) {
    return MouseRegion(
      onHover: (event) {
        if (flipController.state!.isFront) {
          flipController.toggleCard();
        }
      },
      onExit: (event) async {
        if (flipController.controller!.isAnimating) {
          await Future.delayed(const Duration(seconds: 1));
        }
        if (!flipController.state!.isFront) {
          flipController.toggleCard();
        }
      },
      child: FlipCard(
        flipOnTouch: false,
        controller: flipController,
        front: Container(
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
              Text(name, style: Theme.of(context).textTheme.headline3),
              const SizedBox(height: MeetupSpacing.tiny),
              Text(
                jobPosition,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
        ),
        back: Container(
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
          child: Padding(
            padding: const EdgeInsets.all(MeetupSpacing.medium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: MeetupSpacing.large),
                Text(title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .merge(TextStyle(color: MeetupColors.gray3))),
                const SizedBox(height: MeetupSpacing.small),
                Text(description,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .merge(TextStyle(color: MeetupColors.gray3))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _register => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Padding(
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
                  width: double.maxFinite,
                  alignment: Alignment.centerRight,
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
                  child: Padding(
                    padding: const EdgeInsets.only(right: MeetupSpacing.big3),
                    child: FormBuilder(
                      key: _formKey,
                      child: Material(
                        color: Colors.transparent,
                        child: SizedBox(
                          width: 480,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Não perca tempo,',
                                  style: Theme.of(context).textTheme.headline2),
                              Text('inscreva-se',
                                  style: Theme.of(context).textTheme.headline2),
                              const SizedBox(height: MeetupSpacing.large),
                              Row(
                                children: [
                                  Flexible(
                                    child: MeetupTextField(
                                        name: 'name', label: 'Nome*'),
                                  ),
                                  const SizedBox(width: MeetupSpacing.small),
                                  Flexible(
                                    child: MeetupTextField(
                                        name: 'phone', label: 'Telefone*'),
                                  ),
                                ],
                              ),
                              const SizedBox(height: MeetupSpacing.small),
                              MeetupTextField(name: 'email', label: 'E-mail*'),
                              const SizedBox(height: MeetupSpacing.small),
                              Row(
                                children: [
                                  Flexible(
                                    child: MeetupTextField(
                                        name: 'company', label: 'Empresa'),
                                  ),
                                  const SizedBox(width: MeetupSpacing.small),
                                  Flexible(
                                    child: MeetupTextField(
                                        name: 'job', label: 'Área de atuação'),
                                  ),
                                ],
                              ),
                              const SizedBox(height: MeetupSpacing.small),
                              SizedBox(
                                width: double.maxFinite,
                                child: MeetupSecundaryButton(
                                    label: 'Inscreva-se', onPressed: () {}),
                              ),
                            ],
                          ),
                        ),
                      ),
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
                      child: Image.asset(
                          'assets/images/squares_and_circles.png'))),
              Image.asset('assets/images/not_loose_time.png'),
            ],
          ),
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
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  launch('https://behance.net/joaotrld');
                },
                child: Text(
                    'Designed with ${Emojis.redHeart} by | behance.net/joaotrld',
                    style: Theme.of(context).textTheme.overline),
              ),
            ),
            Row(
              children: [
                MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                        onTap: () =>
                            launch('https://www.linkedin.com/groups/12586571/'),
                        child:
                            Icon(MeetupIcons.linkedin, color: Colors.white))),
                const SizedBox(width: MeetupSpacing.medium),
                MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                        onTap: () =>
                            launch('https://www.instagram.com/flutterrp/'),
                        child:
                            Icon(MeetupIcons.instagram, color: Colors.white))),
                const SizedBox(width: MeetupSpacing.medium),
                MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                        onTap: () => launch(
                            'https://www.youtube.com/channel/UC0X1kB62Khvp2USm4X5zlVw'),
                        child: Icon(MeetupIcons.youtube, color: Colors.white))),
              ],
            ),
          ],
        ),
      );
}
