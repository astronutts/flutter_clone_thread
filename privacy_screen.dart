import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrivacyScreen extends StatefulWidget {
  PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
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
          'Privacy',
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
                FontAwesomeIcons.lock,
                color:
                    isDarkMode(context) ? Colors.grey.shade300 : Colors.black,
              ),
              title: Text(
                'Private profile',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: CupertinoSwitch(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    _isChecked = !_isChecked;
                    setState(() {});
                  }),
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.at,
                color:
                    isDarkMode(context) ? Colors.grey.shade300 : Colors.black,
              ),
              title: Text(
                'Mentions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: FaIcon(
                FontAwesomeIcons.angleRight,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.bellSlash,
                color:
                    isDarkMode(context) ? Colors.grey.shade300 : Colors.black,
              ),
              title: Text(
                'Muted',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: FaIcon(
                FontAwesomeIcons.angleRight,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.eyeSlash,
                color:
                    isDarkMode(context) ? Colors.grey.shade300 : Colors.black,
              ),
              title: Text(
                'Hidden Words',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: FaIcon(
                FontAwesomeIcons.angleRight,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.users,
                color:
                    isDarkMode(context) ? Colors.grey.shade300 : Colors.black,
              ),
              title: Text(
                'Profiles you follow',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: FaIcon(
                FontAwesomeIcons.angleRight,
                color: Colors.grey,
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
            Text(
              'Other Privacy settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.circleXmark,
                color:
                    isDarkMode(context) ? Colors.grey.shade300 : Colors.black,
              ),
              title: Text(
                'Blocked profiles',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: FaIcon(
                FontAwesomeIcons.outdent,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.heartPulse,
                color:
                    isDarkMode(context) ? Colors.grey.shade300 : Colors.black,
              ),
              title: Text(
                'Hide likes',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: FaIcon(
                FontAwesomeIcons.outdent,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
