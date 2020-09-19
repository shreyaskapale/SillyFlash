import 'dart:io';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flashlight/flashlight.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:animated_text_kit/animated_text_kit.dart';



class UselessBox extends StatefulWidget {
  final List<String> stateLocation= ["assets/images/offUseless.png","assets/images/onUseless.gif"];

  @override
  _UselessBoxState createState() => _UselessBoxState();
}
void playSound() {
  final player = AudioCache();
  player.play('sounds/switch.wav');
}

class _UselessBoxState extends State<UselessBox> {
  String imageState = "assets/images/offUseless.png";
  bool _swtich;
  bool _visible = false;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Challenge Useless Box"),
      ),
      body: Column(children: [
      GestureDetector(
        onTap: (){
          setState(() {
            if(imageState=="assets/images/offUseless.png") {
              imageState = "assets/images/onUseless.gif";
              Flashlight.lightOn();
              playSound();
            }

          });

          Future.delayed(const Duration(milliseconds: 600), () {


            setState(() {
              playSound();
              imageState = "assets/images/offUseless.png";
              Flashlight.lightOff();



            });

          });
        },
          child: Image(image: AssetImage(imageState))),
        SizedBox(
          height: 100,
        ),
        AnimatedOpacity(
          // If the widget is visible, animate to 0.0 (invisible).
          // If the widget is hidden, animate to 1.0 (fully visible).
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          // The green box must be a child of the AnimatedOpacity widget.

        ),
        Center(
          child: SizedBox(
            width: 250.0,
            child: TypewriterAnimatedTextKit(
              speed: Duration(milliseconds: 100),
    onFinished: (){
    setState(() {
    _visible=true;
    });},
                totalRepeatCount: 1,

                repeatForever: false,
                onTap: () {
                  print("Tap Event");
                },
                text: [
                  "Hey you kid from Sillyhacks",
                  "Try to on your flash light",
                  "Touch the switch",
                  "Lets see what you made of",
                  "Never Give Up Kid :V",
                  "Still Trying ?",
                  "getting over it ? huh ?",
                  "is that all you got ? ",
                  "i am still laughing at you dum",
                  "what are you dum ?",
                  "You are boring me common now",
                  "its so easy just on the light",
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
        )
      ],
      ),
    );
  }
}

