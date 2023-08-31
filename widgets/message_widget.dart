// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class messageWidget extends StatelessWidget {
  String networkImageURL;
  String nicName;
  String upLoadTimeAgo;
  String message;
  String imageMessage;

  messageWidget({
    super.key,
    required this.networkImageURL,
    required this.nicName,
    required this.upLoadTimeAgo,
    required this.message,
    required this.imageMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            CircleAvatar(
              foregroundImage: NetworkImage(networkImageURL),
            ), // $ Profile image
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          nicName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ), // $ Nicname
                        const SizedBox(
                          width: 6,
                        ),
                        const Icon(
                          FontAwesomeIcons.circleCheck,
                          color: Colors.green,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 160,
                        ),
                        Text(upLoadTimeAgo), // $ upload_time ago
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 500,
                                  child: ListView(
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Container(
                                        width: 200,
                                        height: 200,
                                        child: Text("hello"),
                                      ),
                                      Container(
                                        child: Text("world"),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: const Icon(
                            FontAwesomeIcons.ellipsis,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  message,
                ), // $ message
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            const SizedBox(
              width: 60,
            ),
            Container(
              // $ image message
              width: 280,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageMessage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Row(
          children: [
            SizedBox(
              width: 60,
            ),
            Icon(FontAwesomeIcons.heart),
            SizedBox(width: 20),
            Icon(FontAwesomeIcons.message),
            SizedBox(width: 20),
            Icon(FontAwesomeIcons.retweet),
            SizedBox(width: 20),
            Icon(FontAwesomeIcons.paperPlane),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Row(
          children: [
            SizedBox(
              width: 60,
            ),
            Text("36 replies . 391 likes"),
          ],
        ),
      ],
    );
  }
}
