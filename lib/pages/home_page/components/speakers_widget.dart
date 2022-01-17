import 'package:flutter/material.dart';
import 'package:meetup_site/components/meetup_radius.dart';
import 'package:meetup_site/helpers/meetup_colors.dart';
import 'package:meetup_site/helpers/meetup_spacing.dart';
import 'package:meetup_site/pages/home_page/components/animated_card.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SpeakersWidget extends StatelessWidget {
  const SpeakersWidget({Key? key}) : super(key: key);

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
                                'palestrantes',
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
                                'Nossos palestrantes',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            )),
                        const SizedBox(height: MeetupSpacing.large),
                        Text(
                          'Vindos de Manaus, Hortolândia e São Carlos Direto para Ribeirão, trazendo as ultimas novidades do mundo da tecnologia para o maior polo de inovação do país.',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
                ResponsiveRowColumnItem(
                  rowFlex: 2,
                  child: FittedBox(
                    child: Row(
                      children: [
                        AnimatedCard(
                          imagePath: 'assets/images/speaker_1.jpeg',
                          name: 'Rully Alves',
                          jobPosition: 'Software Developer @ BTG',
                          title: 'A nova era do desenvolvimento mobile',
                          description:
                              'Rully Alves vem direto de Hortolândia para Ribeirão Preto pra palestrar sobre a nova era do desenvolviment mobile.',
                        ),
                        const SizedBox(width: MeetupSpacing.big1),
                        AnimatedCard(
                          imagePath: 'assets/images/speaker_2.jpeg',
                          name: 'Gabriela Pereira',
                          jobPosition: 'Software Developer @ BTG',
                          title:
                              'Micro front-ends: a evolução das arquiteturas para aplicações modernas',
                          description:
                              'Gabriela Pereira vem direto de São Carlos para Ribeirão Preto pra palestrar junto com o Paulo Victor sobre esse tópico quentissimo e com um caso de uso em flutter!',
                        ),
                        const SizedBox(width: MeetupSpacing.big1),
                        AnimatedCard(
                          imagePath: 'assets/images/speaker_3.jpeg',
                          name: 'Paulo Victor',
                          jobPosition: 'Developer Instructor @ Rocketseat',
                          title:
                              'Micro front-ends: a evolução das arquiteturas para aplicações modernas',
                          description:
                              'Paulo Victor vem direto de Manaus para Ribeirão Preto pra palestrar junto com o Gabriela Pereira sobre esse tópico quentissimo e com um caso de uso em flutter!',
                        ),
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
}
