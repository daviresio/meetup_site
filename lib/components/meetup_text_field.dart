import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:meetup_site/helpers/meetup_colors.dart';

class MeetupTextField extends StatelessWidget {
  final String name;
  final String label;
  final FormFieldValidator? validator;
  final List<TextInputFormatter>? inputFormatters;

  const MeetupTextField({
    required this.name,
    required this.label,
    this.validator,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      style: Theme.of(context)
          .textTheme
          .bodyText1!
          .merge(TextStyle(color: Colors.black87)),
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
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MeetupColors.light, width: 2),
        ),
        hoverColor: Colors.transparent,
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
      validator: validator,
      inputFormatters: inputFormatters,
    );
  }
}
