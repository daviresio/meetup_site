import 'package:flutter/material.dart';
import 'package:meetup_site/helpers/meetup_colors.dart';
import 'package:meetup_site/helpers/meetup_icons.dart';
import 'package:meetup_site/helpers/meetup_spacing.dart';
import 'package:responsive_framework/responsive_framework.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget>
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
          rowSpacing: MeetupSpacing.small,
          columnSpacing: MeetupSpacing.large,
          rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
          layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 1,
              rowOrder: 1,
              columnOrder: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('13/12 ÁS 19H',
                      style: Theme.of(context).textTheme.subtitle1),
                  const SizedBox(height: MeetupSpacing.tiny),
                  Text('VENHA', style: Theme.of(context).textTheme.headline1),
                  Text('DECOLAR SEUS',
                      style: Theme.of(context).textTheme.headline1),
                  Text('CONHECIMENTOS',
                      style: Theme.of(context).textTheme.headline1),
                  const SizedBox(height: MeetupSpacing.tiny),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 800),
                    child: Text(
                        'Crie network e aprenda em um ambiente colaborativo. Com reuniões mensais nos melhores espaços de inovação em Ribeirão Preto.',
                        style: Theme.of(context).textTheme.subtitle2),
                  ),
                  const SizedBox(height: MeetupSpacing.small),
                  FittedBox(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          MeetupIcons.building,
                          size: 42,
                          color: MeetupColors.white,
                        ),
                        const SizedBox(width: MeetupSpacing.tiny),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 40),
                            Text(
                              'Labs de Inovação | Bild & Vitta',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .merge(TextStyle(color: MeetupColors.blue)),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Remoto, através do Youtube',
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                const SizedBox(width: MeetupSpacing.tiny),
                                Icon(
                                  MeetupIcons.youtube,
                                  size: 12,
                                  color: MeetupColors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: MeetupSpacing.huge2),
                ],
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              rowOrder: 2,
              columnOrder: 1,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) => Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(_animationValue.value)
                    ..scale(1 + _animationValue.value)
                    ..translate(_animationValue.value * 100, 0),
                  alignment: Alignment.centerRight,
                  child: Image.asset('assets/images/banner.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
