// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_app/activity_screen.dart';
import 'package:flutter_test_app/etc_screen.dart';
import 'package:flutter_test_app/home_screen.dart';
import 'package:flutter_test_app/search_screen.dart';
import 'package:flutter_test_app/user_profile_screen.dart';
import 'package:flutter_test_app/widgets/thread_comments.dart';

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
    const SearchScreen(),
    const HomeScreen(),
    const ActivityScreen(),
    const UserProfileScreen(),
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
      clipBehavior: Clip.hardEdge,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const ThreadComments(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        print(orientation);
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
                          FontAwesomeIcons.solidHeart,
                          size: 20,
                        ),
                        label: "",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          FontAwesomeIcons.user,
                          size: 20,
                        ),
                        label: "",
                      )
                    ]),
              ],
            ),
          ),
        );
      },
    );
  }
}
