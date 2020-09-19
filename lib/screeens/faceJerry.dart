import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:vibration/vibration.dart';
import 'package:flashlight/flashlight.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'hackingJerry.dart';
import 'welcomeJerry.dart';
class FaceJerry extends StatefulWidget {
  @override
  _FaceJerryState createState() => _FaceJerryState();
}

class _FaceJerryState extends State<FaceJerry> {
  VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    Timer timer;
    Timer timer2;

    timer = Timer.periodic(Duration(milliseconds: 1000), (Timer t) => lightsOn());
    timer2 = Timer.periodic(Duration(milliseconds: 500), (Timer t) => lightOff());
    _controller = VideoPlayerController.asset("assets/videos/jerryangry.mp4")
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });

    Future.delayed(const Duration(seconds: 8), ()
    {
      timer.cancel();
      timer2.cancel();
    });
  }

  void lightsOn(){



      Flashlight.lightOn();



  }
  void lightOff(){
    Flashlight.lightOff();
  }

  @override
  Widget build(BuildContext context) {
    _controller.play();
    Vibration.vibrate(pattern: [500, 1000, 500, 2000,500,3000,500]);


    return Scaffold(
      backgroundColor: Colors.black,

      body: Column(
        children: [

          _controller.value.initialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : Container(),
          SizedBox(
            height: 200,
          ),

          SizedBox(
            width: 250.0,
            child: TypewriterAnimatedTextKit(
                speed: Duration(milliseconds: 80),
                onFinished: (){

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HackingJerry()),
                    );

                    //_visible=true;
                  },
                totalRepeatCount: 1,

                repeatForever: false,
                onTap: () {
                  print("Tap Event");
                },
                text: [
                  "looks like you hit his nephew Taffy",
                  "Jerry will take his revenge :) now",

                ],
                textStyle: TextStyle(
                    fontSize: 30.0,
                    fontFamily: "Agne",
                    color: Colors.white
                ),
                textAlign: TextAlign.start,
                alignment: AlignmentDirectional.topStart // or Alignment.topLeft
            ),
          ),
        ],
      ),
    );
  }
}