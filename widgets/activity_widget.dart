// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_test_app/utils.dart';

class ActivityWidget extends StatelessWidget {
  String a_imagepath;
  String a_name;
  String a_mention;
  String a_msg;

  ActivityWidget({
    super.key,
    required this.a_imagepath,
    required this.a_mention,
    required this.a_msg,
    required this.a_name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            foregroundImage: NetworkImage("$a_imagepath"),
          ),
          title: Text(a_name),
          subtitle: Text(a_mention),
          trailing: TextButton(
            onPressed: () {},
            child: Container(
              width: 100,
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Folow",
                    style: TextStyle(
                        color: isDarkMode(context)
                            ? Colors.grey.shade300
                            : Colors.black),
                  )),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey),
              ),
            ),
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: 70,
            ),
            Expanded(
              child: Text(
                "$a_msg",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        )
      ],
    );
  }
}
