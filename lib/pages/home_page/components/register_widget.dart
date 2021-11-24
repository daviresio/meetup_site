import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:meetup_site/components/meetup_secundary_button.dart';
import 'package:meetup_site/components/meetup_text_field.dart';
import 'package:meetup_site/helpers/meetup_colors.dart';
import 'package:meetup_site/helpers/meetup_spacing.dart';
import 'package:responsive_framework/responsive_framework.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final _formKey = GlobalKey<FormBuilderState>();

  final phoneInputFormatter = MaskTextInputFormatter(
      mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: MeetupSpacing.big1,
          right: MeetupSpacing.big1,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 440,
                width: double.maxFinite,
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(top: MeetupSpacing.big3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      MeetupColors.purple2,
                      MeetupColors.blue,
                    ],
                  ),
                ),
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    margin: EdgeInsets.only(
                      top: MeetupSpacing.big3 + MeetupSpacing.medium,
                      left: MeetupSpacing.medium,
                    ),
                    child:
                        Image.asset('assets/images/squares_and_circles.png'))),
            Positioned(
              right: 0,
              top: 50,
              child: SizedBox(
                width: 550,
                height: 450,
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(MeetupSpacing.big3),
                    child: FormBuilder(
                      key: _formKey,
                      child: Material(
                        color: Colors.transparent,
                        child: SizedBox(
                          width: 480,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Não perca tempo,',
                                  style: Theme.of(context).textTheme.headline2),
                              Text('inscreva-se',
                                  style: Theme.of(context).textTheme.headline2),
                              const SizedBox(height: MeetupSpacing.large),
                              Row(
                                children: [
                                  Flexible(
                                    child: MeetupTextField(
                                      name: 'name',
                                      label: 'Nome*',
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(
                                          context,
                                          errorText: 'Campo obrigatório',
                                        ),
                                      ]),
                                    ),
                                  ),
                                  const SizedBox(width: MeetupSpacing.small),
                                  Flexible(
                                    child: MeetupTextField(
                                      name: 'phone',
                                      label: 'Telefone*',
                                      inputFormatters: [phoneInputFormatter],
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(
                                          context,
                                          errorText: 'Campo obrigatório',
                                        ),
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: MeetupSpacing.small),
                              MeetupTextField(
                                name: 'email',
                                label: 'E-mail*',
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    context,
                                    errorText: 'Campo obrigatório',
                                  ),
                                ]),
                              ),
                              const SizedBox(height: MeetupSpacing.small),
                              Row(
                                children: [
                                  Flexible(
                                    child: MeetupTextField(
                                        name: 'company', label: 'Empresa'),
                                  ),
                                  const SizedBox(width: MeetupSpacing.small),
                                  Flexible(
                                    child: MeetupTextField(
                                        name: 'job', label: 'Área de atuação'),
                                  ),
                                ],
                              ),
                              const SizedBox(height: MeetupSpacing.small),
                              SizedBox(
                                width: double.maxFinite,
                                child: MeetupSecundaryButton(
                                  label: 'Inscreva-se',
                                  onPressed: () {
                                    _formKey.currentState?.save();
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      print(_formKey.currentState?.value);
                                    } else {
                                      print("validation failed");
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ResponsiveVisibility(
              visible: true,
              hiddenWhen: [Condition.smallerThan(name: DESKTOP)],
              child: Image.asset('assets/images/not_loose_time.png'),
            ),
            ResponsiveVisibility(
              visible: false,
              visibleWhen: [Condition.smallerThan(name: DESKTOP)],
              child: Positioned(
                top: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/not_loose_time.png',
                  width: 200,
                ),
              ),
            ),
            const SizedBox(height: 600),
          ],
        ),
      ),
    );
  }
}
