// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/video/video_recording_screen.dart';
import 'package:flutter_test_app/widgets/activity_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final tabs = [
  "All",
  "Replies",
  "Videos",
  "Validation",
  "Shopping",
];

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<ActivityScreen> {
  final TextEditingController _textEditingController =
      TextEditingController(text: "Initial Text");

  void _onSearchChanged(String value) {
    print(value);
  }

  void _onSearchSubmitted(String value) {
    print(value);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            "Activity",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
            splashFactory: NoSplash.splashFactory,
            padding: EdgeInsets.symmetric(horizontal: 16),
            isScrollable: true,
            labelColor: Colors.black,
            indicatorColor: Colors.transparent,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            indicatorPadding: EdgeInsets.zero,
            labelPadding: EdgeInsets.symmetric(horizontal: 5),
            tabs: [
              for (var tab in tabs)
                Tab(
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        tab,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              scrollDirection: Axis.vertical,
              children: [
                ActivityWidget(
                    a_imagepath:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRFN2Zj_H2NTVXQZp1YN1UrUEBmCv4nlZUSK3W6gIqeCLo5RG2Qfl7_bbwJZ11Z96QqlI&usqp=CAU",
                    a_mention: "Mentioned you!",
                    a_msg: "try anything just do it !!!!",
                    a_name: "theberryjungle"),
                ActivityWidget(
                    a_imagepath:
                        "https://cdn.shopify.com/s/files/1/0150/6262/products/the_sill-variant-white_gloss-zz_plant.jpg?v=1680548849",
                    a_mention: "Mentioned you!",
                    a_msg:
                        "Here's a thread you should follow if you love youdddd",
                    a_name: "astronuts"),
                ActivityWidget(
                    a_imagepath:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkdPUrvq_PqcJ6xThm45NFBRnGYPElU28gAw&usqp=CAU",
                    a_mention: "Mentioned you!",
                    a_msg:
                        "Here's a thread you should follow if you love youdddd",
                    a_name: "the.plantdads"),
                ActivityWidget(
                    a_imagepath:
                        "https://imgv3.fotor.com/images/blog-cover-image/10-profile-picture-ideas-to-make-you-stand-out.jpg",
                    a_mention: "Mentioned you!",
                    a_msg: "alway think blue and positive things",
                    a_name: "happyblue"),
              ],
            ),
            Container(
              child: Center(child: Text('Replies')),
            ),
            VideoRecordingScreen(),
            Container(
              child: Center(
                child: Text('Validation'),
              ),
            ),
            Container(
              child: Center(
                child: Text('Shopping'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
