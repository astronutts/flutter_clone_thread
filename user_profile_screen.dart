import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          snap: true,
          pinned: true,
          title: Text("Hello"),
          collapsedHeight: 80,
          expandedHeight: 200,
        ),
        SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              childCount: 20,
              (context, index) => Container(
                child: Text(
                  'Item $index',
                ),
              ),
            ),
            itemExtent: 100),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            childCount: 30,
            (context, index) => Container(
              color: Colors.teal,
              child: Align(
                alignment: Alignment.center,
                child: Text('hello'),
              ),
            ),
          ),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
        ),
      ],
    );
  }
}
