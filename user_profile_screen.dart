import 'package:flutter/material.dart';
import 'package:flutter_test_app/setting_screen.dart';
import 'package:flutter_test_app/widgets/activity_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              pinned: true,
              title: FaIcon(
                FontAwesomeIcons.earthAsia,
                color: Colors.black,
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.camera,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => SettingScreen()),
                      ),
                    );
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.gears,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Astronuts',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Text('goto_space'),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 7,
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey.shade400),
                                  child: Text(
                                    'threads.net',
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: 30,
                          foregroundImage: NetworkImage(
                              'https://avatars.githubusercontent.com/u/97665384?v=4'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Plant enthusiast!',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '2 followers',
                      style: TextStyle(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Edit profile',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Edit profile',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      labelPadding: EdgeInsets.only(
                        bottom: 10,
                      ),
                      indicatorColor: Colors.black,
                      tabs: [
                        Text(
                          'Threads',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Replies',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          children: [
            Center(
              child: ListView(
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
            Center(
              child: ListView(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
