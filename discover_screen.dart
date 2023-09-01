import 'package:flutter/material.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "Shopping",
];

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            'Discover',
            style: TextStyle(color: Colors.black),
          ),
          bottom: TabBar(
            splashFactory: NoSplash.splashFactory,
            padding: EdgeInsets.symmetric(horizontal: 16),
            isScrollable: true,
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.grey.shade500,
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                  itemCount: 20,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 9 / 16,
                  ),
                  itemBuilder: (context, index) => FadeInImage.assetNetwork(
                      placeholder: "asset/astronaut.avif",
                      image:
                          "https://images.unsplash.com/photo-1581008695823-bd71b9b3d2e6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDJ8fGFzdHJvbmF1dHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60")),
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(
                  tab,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
