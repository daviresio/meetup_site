import 'package:flutter/material.dart';
import 'package:meetup_site/components/meetup_primary_button.dart';
import 'package:meetup_site/components/meetup_radius.dart';
import 'package:meetup_site/helpers/meetup_colors.dart';
import 'package:meetup_site/helpers/meetup_spacing.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PartnersWidget extends StatelessWidget {
  const PartnersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: MeetupSpacing.big1,
        right: MeetupSpacing.big1,
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 100,
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
                            child: Center(
                              child: Text(
                                'Nossos patrocinadores',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            )),
                        const SizedBox(height: MeetupSpacing.large),
                        Text(
                          'Escerver sobre a Bild aqui.',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(height: MeetupSpacing.medium),
                        Text(
                          'Escrever sobre a Dryve aqui.',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(height: MeetupSpacing.medium),
                        Text(
                          'As empresas patrocinadoras estão contratando em varias areas! envie agora mesmo seu curriculo e venha trabalhar nas empresas mais inovadoras da região!',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(height: MeetupSpacing.small),
                        MeetupPrimaryButton(
                          label: 'Cadastre-se no banco de talentos',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: FittedBox(
                    child: Row(
                      children: [
                        _card('assets/images/partner_1.png'),
                        const SizedBox(width: MeetupSpacing.big1),
                        _card('assets/images/partner_2.png'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _card(String imagePath) {
    return Container(
      width: 280,
      height: 264,
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
      child: Center(
        child: Image.asset(
          imagePath,
          width: 165,
          height: 165,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}