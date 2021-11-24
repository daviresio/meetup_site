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
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            )),
                        const SizedBox(height: MeetupSpacing.large),
                        Text(
                          'Sóstenes Gomes é um engenheiro de software com mais de 10 anos de experiência profissional. Já trabalhou em grandes projetos de software, envolvendo milhões de usuários. Nestes projetos eu atuei em várias partes, como levantamento de requisitos, prototipação, validação, arquitetura, desenvolvimento, testes, análise de dados.',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(height: MeetupSpacing.medium),
                        Text(
                          'Davi Resio é um engenheiro de software que já trabalhou em diversos projetos com diferentes stacks ao longo da carreira. Sempre procura entregar o melhor em tudo que faz, e por isso gosta de estar sempre se atualizando para estar um passo a frente.',
                          style: Theme.of(context).textTheme.bodyText1,
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
                        AnimatedCard(
                          imagePath: 'assets/images/sostenes.jpeg',
                          name: 'Sostenes Gomes',
                          jobPosition: 'Head Mobile',
                          title: 'Arquitetando apps flutter',
                          description:
                              'Nessa palestra vou falar sobre os principais fatores que devemos levar em consideração para a arquitetura de um app flutter, e apresentar opções de arquitetura para o seu app.',
                        ),
                        const SizedBox(width: MeetupSpacing.big1),
                        AnimatedCard(
                          imagePath: 'assets/images/davi.png',
                          name: 'Davi Resio',
                          jobPosition: 'Flutter developer',
                          title: 'Interfaces fora da curva com CustomPainter',
                          description:
                              'Nessa palestra vou mostrar cenários em que na Dryve fizemos o uso de CustomPaint (canvas) para criar interfaces únicas, em cenários que não seria possível, ou seria muito difícil alcançar estilizando com widgets tradicionais.',
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
