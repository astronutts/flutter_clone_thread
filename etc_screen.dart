import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EtcScreen extends StatelessWidget {
  const EtcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("jane_mobbin"),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 20,
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Start a thread...",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 1,
                    height: 100,
                    color: Colors.grey[500],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Icon(FontAwesomeIcons.file)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.topRight,
                child: TextButton(onPressed: () {}, child: Text("post")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
