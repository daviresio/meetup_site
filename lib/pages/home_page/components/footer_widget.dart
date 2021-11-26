import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';
import 'package:meetup_site/components/click_widget.dart';
import 'package:meetup_site/helpers/meetup_icons.dart';
import 'package:meetup_site/helpers/meetup_spacing.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: MeetupSpacing.big1,
        right: MeetupSpacing.big1,
      ),
      child: ResponsiveRowColumn(
        columnSpacing: MeetupSpacing.big1,
        rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
        layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowOrder: 1,
            child: ResponsiveVisibility(
                visible: true,
                hiddenWhen: [Condition.smallerThan(name: DESKTOP)],
                child: Image.asset('assets/images/logo.png', width: 64)),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowOrder: 2,
            columnOrder: 2,
            child: Column(
              children: [
                ClickWidget(
                  onTap: () {
                    launch('https://behance.net/joaotrld');
                  },
                  child: Text(
                      'Designed with ${Emojis.redHeart} by | behance.net/joaotrld',
                      style: Theme.of(context).textTheme.overline),
                ),
                const SizedBox(height: MeetupSpacing.tiny),
                Text('Builded using ${Emojis.flexedBiceps} with Flutter Web',
                    style: Theme.of(context).textTheme.overline)
              ],
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowOrder: 3,
            columnOrder: 1,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClickWidget(
                    onTap: () =>
                        launch('https://www.linkedin.com/groups/12586571/'),
                    child: Icon(MeetupIcons.linkedin, color: Colors.white)),
                const SizedBox(width: MeetupSpacing.medium),
                ClickWidget(
                    onTap: () => launch('https://www.instagram.com/flutterrp/'),
                    child: Icon(MeetupIcons.instagram, color: Colors.white)),
                const SizedBox(width: MeetupSpacing.medium),
                ClickWidget(
                    onTap: () => launch(
                        'https://www.youtube.com/channel/UC0X1kB62Khvp2USm4X5zlVw'),
                    child: Icon(MeetupIcons.youtube, color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
