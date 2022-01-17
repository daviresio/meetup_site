import 'package:flutter/material.dart';
import 'package:meetup_site/components/meetup_radius.dart';
import 'package:meetup_site/core/model/helper/meetup_scroll_behavior.dart';
import 'package:meetup_site/helpers/meetup_colors.dart';
import 'package:meetup_site/helpers/meetup_spacing.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PartnersWidget extends StatefulWidget {
  const PartnersWidget({Key? key}) : super(key: key);

  @override
  _PartnersWidgetState createState() => _PartnersWidgetState();
}

class _PartnersWidgetState extends State<PartnersWidget> {
  var loading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 50,
          left: MediaQuery.of(context).size.width / 2 - 150,
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
        Padding(
          padding: const EdgeInsets.only(
            top: MeetupSpacing.huge3,
            bottom: MeetupSpacing.big2,
          ),
          child: ResponsiveRowColumn(
            rowSpacing: MeetupSpacing.large,
            columnSpacing: MeetupSpacing.big1,
            rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
            layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 800),
                  child: Padding(
                    padding: const EdgeInsets.only(left: MeetupSpacing.big1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ResponsiveVisibility(
                          visible: true,
                          hiddenWhen: [Condition.smallerThan(name: DESKTOP)],
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nossos',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              Text(
                                'patrocinadores',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            ],
                          ),
                        ),
                        ResponsiveVisibility(
                            visible: false,
                            visibleWhen: [Condition.smallerThan(name: DESKTOP)],
                            child: Text(
                              'Nossos patrocinadores',
                              style: Theme.of(context).textTheme.headline1,
                            )),
                        const SizedBox(height: MeetupSpacing.large),
                        Text(
                          'Estas são as empresas que nos ajudaram a criar o Meetup e investem em educação, tecnologia e inovação.',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: SizedBox(
                  height: 280,
                  child: ScrollConfiguration(
                    behavior:
                        MeetupScrollBehavior().copyWith(scrollbars: false),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          const SizedBox(width: MeetupSpacing.big1),
                          _card('partners_1.png', width: 200),
                          const SizedBox(width: MeetupSpacing.big1),
                          _card('partners_2.png'),
                          const SizedBox(width: MeetupSpacing.big1),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _card(String imageName, {double width = 165}) {
    return Container(
      width: 280,
      height: 264,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          'assets/images/$imageName',
          width: width,
          height: 165,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
