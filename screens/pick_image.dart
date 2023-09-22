import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/board/repos/board_repo.dart';
import 'package:flutter_test_app/board/view_models/board_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'test.dart';

class PickImage extends StatefulWidget {
  const PickImage({super.key});

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  String _imagepath = boardtype.path;
  final ImagePicker _picker = ImagePicker();
  final List<XFile?> _pickedImages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    boardtype.addListener(() {
      setState(() {
        _imagepath = boardtype.path;
      });
    });
  }

  void getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    _imagepath = image!.path;

    setState(() {
      _pickedImages.add(image);
      FirebaseStorage.instance.ref("test_image").putFile(File(image.path));
    });
  }

  Widget _showImage() {
    return Expanded(
        child: _pickedImages.isNotEmpty
            ? GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                children: _pickedImages
                    .where((element) => element != null)
                    .map((e) => _gridImageItem(e!))
                    .toList(),
              )
            : SizedBox());
  }

  Widget _gridImageItem(XFile e) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.file(
              File(e.path),
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
          'Pick Image',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => getImage(ImageSource.gallery),
            child: Icon(
              Icons.photo,
              size: 30,
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        children: [_showImage()],
      ),
    );
  }
}
