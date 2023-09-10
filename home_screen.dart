import 'package:flutter/material.dart';
import 'package:flutter_test_app/utils.dart';
import 'package:flutter_test_app/widgets/message_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          child: Column(
            children: [
              Icon(
                FontAwesomeIcons.instagram,
                color:
                    isDarkMode(context) ? Colors.grey.shade300 : Colors.black,
                size: 60,
              ),
              const SizedBox(
                height: 40,
              ),

              // thread Logo

              messageWidget(
                networkImageURL:
                    "https://avatars.githubusercontent.com/u/97665384?v=4",
                nicName: "astronuts",
                upLoadTimeAgo: "5m",
                message: "I'm king of the flutter world !!!",
                imageMessage:
                    "https://image.dongascience.com/Photo/2023/07/a6e03b09c37312988aad4b5657ecbc75.jpeg",
              ),
              const SizedBox(
                height: 20,
              ),
              messageWidget(
                networkImageURL:
                    "https://yt3.googleusercontent.com/G4B5EMt-GY_sK87DP0rF7ulPBbbA5XLEhcwtFluEoQLh5WxSModTpT9gkCytQndl7iPXP1HdbA=s176-c-k-c0x00ffffff-no-rj",
                nicName: "simpson",
                upLoadTimeAgo: "18m",
                message: "Do you like lisening to music? here you are",
                imageMessage:
                    "https://img.freepik.com/premium-photo/music-mind-music-abstract-art-created-with-generative-ai-technology_545448-15311.jpg",
              ),
              const SizedBox(
                height: 20,
              ),
              messageWidget(
                networkImageURL:
                    "https://yt3.googleusercontent.com/ytc/AOPolaSn88PvVXWN_Wy5vSr-5Eo_NGDdw_apL6bM7QKfCw=s176-c-k-c0x00ffffff-no-rj",
                nicName: "nomad",
                upLoadTimeAgo: "7m",
                message: "supporting coding user and student",
                imageMessage:
                    "https://schoolnotices.co.uk/wp-content/uploads/2022/02/chris-ried-512801-unsplash-1200x700.jpg",
              )
            ],
          ),
        ),
      ),
    );
  }
}
