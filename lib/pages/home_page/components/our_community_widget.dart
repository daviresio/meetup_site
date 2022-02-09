import 'package:flutter/material.dart';
import 'package:meetup_site/components/click_widget.dart';
import 'package:meetup_site/components/meetup_primary_button.dart';
import 'package:meetup_site/helpers/meetup_spacing.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

class OurCommunityWidget extends StatefulWidget {
  final void Function(int index) scrollToElement;

  const OurCommunityWidget({Key? key, required this.scrollToElement})
      : super(key: key);

  @override
  _OurCommunityWidgetState createState() => _OurCommunityWidgetState();
}

class _OurCommunityWidgetState extends State<OurCommunityWidget>
    with SingleTickerProviderStateMixin {
  late final _animationController;
  late final Animation<double> _animationValue;

  initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animationValue = Tween<double>(
      begin: 0.0,
      end: 0.3,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        _animationController.forward();
      },
      onExit: (event) {
        _animationController.reverse();
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: MeetupSpacing.big1,
          right: MeetupSpacing.big1,
        ),
        child: ResponsiveRowColumn(
          rowSpacing: MeetupSpacing.big3,
          columnSpacing: MeetupSpacing.huge1,
          rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
          layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) => Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(-_animationValue.value)
                    ..scale(1 + _animationValue.value)
                    ..translate(-_animationValue.value * 100, 0),
                  alignment: Alignment.centerLeft,
                  child: Image.asset('assets/images/our_community.png'),
                ),
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 800),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'O Evento',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const SizedBox(height: MeetupSpacing.large),
                    Text(
                      'Nosso meetup vai ser no dia 08/03 as 19:00 e para os que forem vir presencialmente vai ser no Instituto SEB - A Fábrica, que fica na Rua Mariana Junqueira, 33 - Centro, Ribeirão Preto/SP,',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: MeetupSpacing.medium),
                    ClickWidget(
                      onTap: () {
                        launch(
                            'https://chat.whatsapp.com/H2HeqqCs1XwFtcFrehgL9m');
                      },
                      child: Text(
                        'Aproveite para interagir com a comunidade e clique aqui para entrar no nosso grupo do whatsapp.',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    const SizedBox(height: MeetupSpacing.medium),
                    MeetupPrimaryButton(
                        label: 'Faça sua inscrição',
                        onPressed: () {
                          widget.scrollToElement(9);
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
