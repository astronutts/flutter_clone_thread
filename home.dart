import 'package:flutter/material.dart';
import 'package:flutter_test_app/discover_screen.dart';
import 'package:flutter_test_app/etc_screen.dart';
import 'package:flutter_test_app/home_screen.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  final newThreadController = TextEditingController();
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    const HomeScreen(),
    const DiscoverScreen(),
    const HomeScreen(),
    const EtcScreen(),
    const EtcScreen(),
  ];

  void _onItemTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  void _onTapPen() {
    newThread();
  }

  void initState() {
    super.initState();
  }

  void dispose() {
    newThreadController.dispose();
    super.dispose();
  }

  Future<dynamic> newThread() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Cancel"),
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      "New thread",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          foregroundImage: NetworkImage(
                              "https://avatars.githubusercontent.com/u/97665384?v=4"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("astronuts"),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 20,
                              width: 200,
                              child: TextField(
                                controller: newThreadController,
                                keyboardType: TextInputType.text,
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
                          foregroundImage: NetworkImage(
                              "https://avatars.githubusercontent.com/u/97665384?v=4"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Post",
                            style: TextStyle(
                              color: newThreadController.text.isNotEmpty
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 55,
        child: Wrap(
          children: [
            BottomNavigationBar(
                selectedIconTheme: const IconThemeData(color: Colors.black),
                unselectedItemColor: Colors.grey,
                currentIndex: _selectedIndex,
                onTap: _onItemTap,
                backgroundColor: Colors.white,
                selectedItemColor: Colors.red,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      FontAwesomeIcons.house,
                      size: 20,
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      FontAwesomeIcons.compass,
                      size: 20,
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: GestureDetector(
                      onTap: _onTapPen,
                      child: Icon(
                        FontAwesomeIcons.pen,
                        size: 20,
                      ),
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      FontAwesomeIcons.user,
                      size: 20,
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      FontAwesomeIcons.heart,
                      size: 20,
                    ),
                    label: "",
                  )
                ]),
          ],
        ),
      ),
    );
  }
}
