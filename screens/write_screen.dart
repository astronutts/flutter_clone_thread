import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_app/board/view_models/board_view_model.dart';
import 'package:flutter_test_app/screens/test.dart';

import 'pick_image.dart';

class WriteScreen extends ConsumerStatefulWidget {
  const WriteScreen({super.key});

  @override
  ConsumerState<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends ConsumerState<WriteScreen> {
  TextEditingController _textEditingController = new TextEditingController();
  String _comment = "";

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      setState(() {
        _comment = _textEditingController.text;
      });
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _tapIcon() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((context) => PickImage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Writing Screen',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                child: TextField(
                  controller: _textEditingController,
                  cursorColor: Colors.red,
                  cursorWidth: 10,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                    onTap: _tapIcon,
                    child: Icon(
                      Icons.photo,
                      size: 30,
                      color: Colors.red,
                    ),
                  )),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 200,
                height: 200,
                child: Image.file(File(boardtype.path)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
