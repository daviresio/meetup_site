import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:meetup_site/helpers/meetup_colors.dart';
import 'package:meetup_site/helpers/meetup_spacing.dart';

class AnimatedCard extends StatefulWidget {
  final String imagePath;
  final String name;
  final String jobPosition;
  final String title;
  final String description;

  const AnimatedCard({
    required this.imagePath,
    required this.name,
    required this.jobPosition,
    required this.title,
    required this.description,
  });

  @override
  _FlipCardState createState() => _FlipCardState();
}

class _FlipCardState extends State<AnimatedCard> {
  final flipCardController = FlipCardController();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        if (flipCardController.state!.isFront) {
          flipCardController.toggleCard();
        }
      },
      onExit: (event) async {
        if (flipCardController.controller!.isAnimating) {
          await Future.delayed(const Duration(seconds: 1));
        }
        if (!flipCardController.state!.isFront) {
          flipCardController.toggleCard();
        }
      },
      child: FlipCard(
        controller: flipCardController,
        front: Container(
          width: 280,
          height: 370,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  widget.imagePath,
                  width: 165,
                  height: 165,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: MeetupSpacing.large),
              Text(widget.name, style: Theme.of(context).textTheme.headline3),
              const SizedBox(height: MeetupSpacing.tiny),
              Text(
                widget.jobPosition,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
        ),
        back: Container(
          width: 280,
          height: 370,
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
          child: Padding(
            padding: const EdgeInsets.all(MeetupSpacing.medium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: MeetupSpacing.large),
                Text(widget.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .merge(TextStyle(color: MeetupColors.gray3))),
                const SizedBox(height: MeetupSpacing.small),
                Text(widget.description,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .merge(TextStyle(color: MeetupColors.gray3))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
