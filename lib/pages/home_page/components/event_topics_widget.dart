import 'package:flutter/material.dart';
import 'package:meetup_site/helpers/meetup_spacing.dart';

class EventTopicsWidget extends StatelessWidget {
  const EventTopicsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              textAlign: TextAlign.center,
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
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          const SizedBox(height: MeetupSpacing.big1),
          SizedBox(
            height: 190,
            child: Center(
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: CustomScrollView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate([
                        SizedBox(width: MeetupSpacing.big1),
                        _eventDescriptionItem(
                          'Evento no espaço de inovação Bild Labs',
                          context,
                        ),
                        SizedBox(width: MeetupSpacing.big1),
                        _eventDescriptionItem(
                          'Arquitetando apps flutter',
                          context,
                        ),
                        SizedBox(width: MeetupSpacing.big1),
                        _eventDescriptionItem(
                          'UI\'s fora da curva com CustomPainter',
                          context,
                        ),
                        SizedBox(width: MeetupSpacing.big1),
                        _eventDescriptionItem(
                          'Aproveite para fazer bastante network',
                          context,
                        ),
                        SizedBox(width: MeetupSpacing.big1),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _eventDescriptionItem(String description, BuildContext context) {
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
}
