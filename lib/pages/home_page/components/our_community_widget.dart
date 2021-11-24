import 'package:flutter/material.dart';
import 'package:meetup_site/helpers/meetup_spacing.dart';
import 'package:responsive_framework/responsive_framework.dart';

class OurCommunityWidget extends StatefulWidget {
  const OurCommunityWidget({Key? key}) : super(key: key);

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
                      'Nossa comunidade',
                      textAlign: TextAlign.left,
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
            ),
          ],
        ),
      ),
    );
  }
}
