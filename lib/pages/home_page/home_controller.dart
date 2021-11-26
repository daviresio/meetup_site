import 'dart:convert';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meetup_site/helpers/meetup_colors.dart';
import 'package:meetup_site/helpers/meetup_icons.dart';
import 'package:meetup_site/helpers/meetup_spacing.dart';
import 'package:screenshot/screenshot.dart';

class HomeController {
  ScreenshotController screenshotController = ScreenshotController();

  // final _baseUrl = 'https://daviresio-meetup-api-2-qdeql.ondigitalocean.app';
  final _baseUrl = 'http://localhost:8080';

  Future<bool> register(
      Map<String, dynamic> payload, BuildContext context) async {
    try {
      final url = '$_baseUrl/api/v1/tickets';
      final response = await Dio().post(url,
          data: json.encode({
            'event_id': 'f0781dbb-4c86-4007-8a26-00a45b5340cb',
            'event_type': payload['event_type'],
            'guest': {
              'name': payload['name'],
              'email': payload['email'],
              'phone': payload['phone'],
              'company': payload['company'],
              'job': payload['job'],
            }
          }));

      await uploadTicket(
        context: context,
        ticketId: response.data['id'],
        name: payload['name'],
      );

      return response.statusCode! < 300;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> uploadCv(Uint8List fileBytes, String fileName) async {
    try {
      final response = await Dio().post(
        '$_baseUrl/api/v1/files',
        options: Options(headers: {"Content-Type": "multipart/form-data"}),
        data: FormData.fromMap({
          'file_name': fileName,
          'file': MultipartFile.fromBytes(fileBytes, filename: fileName)
        }),
      );

      return response.statusCode! < 300;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> uploadTicket({
    required BuildContext context,
    required String ticketId,
    required String name,
  }) async {
    try {
      final ticketImage = await screenshotController
          .captureFromWidget(widgetToFile(context, name));

      final response = await Dio().post(
        '$_baseUrl/api/v1/images',
        options: Options(headers: {"Content-Type": "multipart/form-data"}),
        data: FormData.fromMap({
          'ticket_id': ticketId,
          'file':
              MultipartFile.fromBytes(ticketImage, filename: '$ticketId.png')
        }),
      );

      return response.statusCode! < 300;
    } catch (e) {
      print(e);

      return false;
    }
  }
}

Widget widgetToFile(BuildContext context, String name) => Center(
      child: Container(
        width: 800,
        height: 430,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              MeetupColors.purple2.withOpacity(0.6),
              MeetupColors.purple1.withOpacity(0.6),
              Color(0xFF785353).withOpacity(0.6),
              MeetupColors.blue.withOpacity(0.6),
            ],
          ),
        ),
        child: Container(
          width: 788,
          height: 418,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: MeetupColors.black,
          ),
          child: Stack(
            children: [
              Positioned(
                top: 70,
                right: -180,
                child: Transform(
                  transform: Matrix4.rotationZ(math.pi / 2),
                  child: Text(
                    'N° 014747',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: MeetupSpacing.big3,
                      vertical: MeetupSpacing.big3,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                bottom: MeetupSpacing.small,
                              ),
                              child: Text(
                                'Ingresso Meetup Flutter',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .merge(TextStyle(
                                        color: MeetupColors.white,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  MeetupIcons.single_user_1,
                                  color: MeetupColors.white,
                                  size: 30,
                                ),
                                const SizedBox(width: MeetupSpacing.small),
                                Text(
                                  name.toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .merge(
                                          TextStyle(color: MeetupColors.white)),
                                )
                              ],
                            ),
                            const SizedBox(height: MeetupSpacing.big1),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  MeetupIcons.location,
                                  color: MeetupColors.white,
                                  size: 30,
                                ),
                                const SizedBox(width: MeetupSpacing.small),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'IGUATEMI EMPRESARIAL,',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3!
                                          .merge(TextStyle(
                                              color: MeetupColors.white)),
                                    ),
                                    Text(
                                      'SALA 301 | BILD',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3!
                                          .merge(TextStyle(
                                              color: MeetupColors.white)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/images/partner_3.png',
                                    height: 40),
                                const SizedBox(
                                  width: MeetupSpacing.small,
                                ),
                                Image.asset('assets/images/partner_2.png',
                                    height: 40),
                              ],
                            ),
                            const SizedBox(height: MeetupSpacing.medium),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'www.fluttermeetup.com.br',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .merge(TextStyle(
                                          color: MeetupColors.white,
                                          fontWeight: FontWeight.w700)),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                        color: MeetupColors.gray3.withOpacity(0.5),
                        width: 4,
                      )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
