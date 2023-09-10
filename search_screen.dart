// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/utils.dart';
import 'package:flutter_test_app/widgets/activity_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final tabs = [
  "All",
  "Replies",
  "Mentions",
  "Validation",
  "Shopping",
];

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Text(
                "Search",
                style: TextStyle(
                  color: isDarkMode(context) ? Colors.white : Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bottom: CupertinoNavigationBar(
                padding: EdgeInsetsDirectional.all(5),
                leading: CupertinoSearchTextField(
                  decoration: BoxDecoration(
                      color: isDarkMode(context)
                          ? Colors.black
                          : Colors.grey.shade300),
                ),
              )),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              ActivityWidget(
                  a_imagepath:
                      "https://cdn.shopify.com/s/files/1/0150/6262/products/the_sill-variant-white_gloss-zz_plant.jpg?v=1680548849",
                  a_mention: "Mentioned you!",
                  a_msg:
                      "Here's a thread you should follow if you love youdddd",
                  a_name: "astronuts"),
              ActivityWidget(
                  a_imagepath:
                      "https://imgv3.fotor.com/images/blog-cover-image/10-profile-picture-ideas-to-make-you-stand-out.jpg",
                  a_mention: "Mentioned you!",
                  a_msg: "alway think blue and positive things",
                  a_name: "happyblue"),
              ActivityWidget(
                  a_imagepath:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkdPUrvq_PqcJ6xThm45NFBRnGYPElU28gAw&usqp=CAU",
                  a_mention: "Mentioned you!",
                  a_msg:
                      "Here's a thread you should follow if you love youdddd",
                  a_name: "the.plantdads"),
              ActivityWidget(
                  a_imagepath:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRFN2Zj_H2NTVXQZp1YN1UrUEBmCv4nlZUSK3W6gIqeCLo5RG2Qfl7_bbwJZ11Z96QqlI&usqp=CAU",
                  a_mention: "Mentioned you!",
                  a_msg: "try anything just do it !!!!",
                  a_name: "theberryjungle"),
            ],
          ),
        ),
      ),
    );
  }
}
