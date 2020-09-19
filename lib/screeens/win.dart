import 'package:flutter/material.dart';
import 'package:flashlight/flashlight.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class Win extends StatefulWidget {
  @override
  _WinState createState() => _WinState();
}

class _WinState extends State<Win> {

  bool _visible = false;
  bool _visible2 = true;


  @override
  Widget build(BuildContext context) {
    Flashlight.lightOn();
    return Scaffold(
     backgroundColor: Color(0xFF66A2BE),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: Image(image: AssetImage("assets/images/sad.jpg")),

          ),
             AnimatedOpacity(
               opacity: _visible2 ? 1.0 : 0.0,
               duration: Duration(milliseconds: 500),
               child: SizedBox(
                width: 250.0,
                child: TypewriterAnimatedTextKit(
                    speed: Duration(milliseconds: 80),
                    onFinished: (){
                      setState(() {
                        _visible = true;
                        _visible2 = false;

                      });
                    },
                    totalRepeatCount: 1,

                    repeatForever: false,

                    text: [
                      "Jerry : i have started your flash light",
                      "Jerry : thanks alot for you help Muhahahah sillyhacker",
                    ],
                    textStyle: TextStyle(
                        fontSize: 25.0,
                        fontFamily: "Agne",
                        color: Colors.white
                    ),
                    textAlign: TextAlign.start,
                    alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                ),
            ),
             ),

          ],
        ),
      )
    );
  }
}