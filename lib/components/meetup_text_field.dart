import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:meetup_site/helpers/meetup_colors.dart';

class MeetupTextField extends StatelessWidget {
  final String name;
  final String label;
  final FormFieldValidator? validator;

  const MeetupTextField({
    required this.name,
    required this.label,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: FormBuilderTextField(
        name: name,
        style: Theme.of(context)
            .textTheme
            .button!
            .merge(TextStyle(color: MeetupColors.gray1)),
        decoration: InputDecoration(
          filled: true,
          fillColor: MeetupColors.white,
          hintText: label,
          hintStyle: Theme.of(context)
              .textTheme
              .button!
              .merge(TextStyle(color: MeetupColors.gray1)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MeetupColors.light),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        ),
        validator: validator,
      ),
    );
  }
}
