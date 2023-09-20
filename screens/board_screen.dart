import 'package:flutter/material.dart';
import 'package:flutter_test_app/screens/write_screen.dart';
import 'package:go_router/go_router.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({super.key});

  @override
  State<BoardScreen> createState() => _BoardState();
}

class _BoardState extends State<BoardScreen> {
  void PressedAddBtn() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((context) => WriteScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Home Screen',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          PressedAddBtn();
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
