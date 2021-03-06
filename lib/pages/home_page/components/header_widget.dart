import 'package:flutter/material.dart';
import 'package:meetup_site/components/meetup_primary_button.dart';
import 'package:meetup_site/components/meetup_text_button.dart';
import 'package:meetup_site/helpers/meetup_spacing.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HeaderWidget extends StatelessWidget {
  final void Function(int index) scrollToElement;

  const HeaderWidget({required this.scrollToElement, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: MeetupSpacing.big1,
        right: MeetupSpacing.big1,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/logo.png', width: 40),
          // ResponsiveVisibility(
          //   visible: false,
          //   visibleWhen: [Condition.smallerThan(name: TABLET)],
          //   child: ClickWidget(
          //     onTap: () {},
          //     child: Icon(MeetupIcons.bars_light, color: MeetupColors.white),
          //   ),
          // ),
          ResponsiveVisibility(
            visible: true,
            hiddenWhen: [Condition.smallerThan(name: TABLET)],
            child: Row(
              children: [
                MeetupTextButton(
                    label: 'O Evento',
                    onPressed: () {
                      scrollToElement(5);
                    }),
                MeetupTextButton(
                    label: 'Programação',
                    onPressed: () {
                      scrollToElement(7);
                    }),
                MeetupTextButton(
                    label: 'Palestrantes',
                    onPressed: () {
                      scrollToElement(8);
                    }),
                MeetupTextButton(
                    label: 'Patrocinadores',
                    onPressed: () {
                      scrollToElement(10);
                    }),
                const SizedBox(width: MeetupSpacing.small),
                MeetupPrimaryButton(
                    label: 'Faça sua inscrição',
                    onPressed: () {
                      scrollToElement(9);
                    }),
              ],
            ),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: [Condition.smallerThan(name: TABLET)],
            child: Row(
              children: [
                MeetupPrimaryButton(
                    label: 'Faça sua inscrição',
                    onPressed: () {
                      scrollToElement(9);
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
