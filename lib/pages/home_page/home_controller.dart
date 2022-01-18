import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meetup_site/helpers/meetup_colors.dart';
import 'package:meetup_site/helpers/meetup_icons.dart';
import 'package:meetup_site/helpers/meetup_spacing.dart';
import 'package:screenshot/screenshot.dart';

const eventId = 'c4e2205d-14df-4361-b6bc-4c54f6236714';

class HomeController {
  ScreenshotController screenshotController = ScreenshotController();

  // final _baseUrl = 'https://daviresio-meetup-api-2-qdeql.ondigitalocean.app';
  final _baseUrl = 'http://localhost:8080';

  Future<bool> register(
    Map<String, dynamic> payload,
    BuildContext context,
    Widget precachedQrCode,
    Widget precachedQrCodeWhatsapp,
  ) async {
    try {
      final url = '$_baseUrl/api/v1/tickets';
      final response = await Dio().post(url,
          data: json.encode({
            'event_id': eventId,
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
        ticketNumber: response.data['ticket_number'],
        isPresential: payload['event_type'] == 'PRESENTIAL',
        precachedQrCode: precachedQrCode,
        precachedQrCodeWhatsapp: precachedQrCodeWhatsapp,
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
    required int ticketNumber,
    required bool isPresential,
    required Widget precachedQrCode,
    required Widget precachedQrCodeWhatsapp,
  }) async {
    try {
      final ticketImage = await screenshotController.captureFromWidget(
        widgetToFile(
          context: context,
          name: name,
          ticketNumber: ticketNumber.toString(),
          isPresential: isPresential,
          precachedQrCode: precachedQrCode,
          precachedQrCodeWhatsapp: precachedQrCodeWhatsapp,
        ),
      );

      final response = await Dio().post(
        '$_baseUrl/api/v1/tickets/images',
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

Widget widgetToFile({
  required BuildContext context,
  required String name,
  required String ticketNumber,
  required bool isPresential,
  required Widget precachedQrCode,
  required Widget precachedQrCodeWhatsapp,
}) {
  return Center(
    child: FittedBox(
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
          child: Row(
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ingresso Meetup Flutter',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .merge(TextStyle(
                                      color: MeetupColors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    )),
                              ),
                              const SizedBox(width: MeetupSpacing.huge1),
                              Text(
                                '10/02 - 19:00',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .merge(TextStyle(
                                      color: MeetupColors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        LimitedBox(
                          maxWidth: 450,
                          child: FittedBox(
                            child: Row(
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
                                  maxLines: 2,
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .merge(
                                          TextStyle(color: MeetupColors.white)),
                                )
                              ],
                            ),
                          ),
                        ),
                        if (isPresential)
                          Padding(
                            padding:
                                const EdgeInsets.only(top: MeetupSpacing.big1),
                            child: Row(
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
                                      'Instituto SEB - A Fábrica,',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3!
                                          .merge(TextStyle(
                                              color: MeetupColors.white)),
                                    ),
                                    Text(
                                      'R. Mariana Junqueira, 33 - Centro,',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .merge(TextStyle(
                                              color: MeetupColors.white)),
                                    ),
                                    Text(
                                      'Ribeirão Preto - SP',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .merge(TextStyle(
                                              color: MeetupColors.white)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        else
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    MeetupIcons.youtube,
                                    color: MeetupColors.white,
                                    size: 22,
                                  ),
                                  const SizedBox(width: MeetupSpacing.medium),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'YOUTUBE DA TECHRP',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3!
                                            .merge(TextStyle(
                                                color: MeetupColors.white)),
                                      ),
                                      Text(
                                        'LINK NO QRCODE',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3!
                                            .merge(TextStyle(
                                                color: MeetupColors.white,
                                                fontSize: 14)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: MeetupSpacing.medium),
                                  precachedQrCode,
                                ],
                              ),
                            ],
                          ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/partners_1.png',
                                  height: 40,
                                ),
                                const SizedBox(
                                  width: MeetupSpacing.small,
                                ),
                                Image.asset(
                                  'assets/images/partners_2.png',
                                  height: 40,
                                ),
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: isPresential ? 200 : 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(
                    color: MeetupColors.gray3.withOpacity(0.5),
                    width: 4,
                  )),
                ),
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    'N° 0$ticketNumber',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
