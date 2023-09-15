import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_app/settings/view_models/darkmode_config_vm.dart';
import 'package:flutter_test_app/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:riverpod/riverpod.dart';

class SettingScreen extends ConsumerWidget {
  static String routeName = '/settings';
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        shape: Border(
          bottom: BorderSide(
            color: Colors.grey,
          ),
        ),
        backgroundColor: isDarkMode(context) ? Colors.black : Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(
              color: isDarkMode(context) ? Colors.grey.shade300 : Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: isDarkMode(context) ? Colors.grey.shade300 : Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.userPlus,
                color:
                    isDarkMode(context) ? Colors.grey.shade300 : Colors.black,
              ),
              title: Text(
                'Follow and invite friends',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.bell,
                color:
                    isDarkMode(context) ? Colors.grey.shade300 : Colors.black,
              ),
              title: Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.computer,
                color:
                    isDarkMode(context) ? Colors.grey.shade300 : Colors.black,
              ),
              title: Text(
                'Dark mode',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Switch.adaptive(
                  value: ref.watch(darkModeConfigProvider).darkmode,
                  onChanged: (value) => {
                        ref
                            .read(darkModeConfigProvider.notifier)
                            .setDarkmode(value)
                      }),
            ),
            GestureDetector(
              onTap: () {
                context.push('/settings/privacy');
              },
              child: ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.lock,
                  color:
                      isDarkMode(context) ? Colors.grey.shade300 : Colors.black,
                ),
                title: Text(
                  'Privacy',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.circleUser,
                color:
                    isDarkMode(context) ? Colors.grey.shade300 : Colors.black,
              ),
              title: Text(
                'Account',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.heart,
                color:
                    isDarkMode(context) ? Colors.grey.shade300 : Colors.black,
              ),
              title: Text(
                'Help',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.circleInfo,
                color:
                    isDarkMode(context) ? Colors.grey.shade300 : Colors.black,
              ),
              title: Text(
                'About',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              width: double.maxFinite,
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: Text('***** Log out *****'),
                    content: Text('정상적으로 로그아웃 되셨습니다~!'),
                    actions: [
                      CupertinoDialogAction(
                        child: Text('확인'),
                        isDefaultAction: true,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                );
              },
              child: Text(
                'Log out',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
