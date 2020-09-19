import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class HackingJerry extends StatefulWidget {
  @override
  _HackingJerryState createState() => _HackingJerryState();
}

@protected
@mustCallSuper
void initState() {
  Future.delayed(const Duration(seconds: 2), (){
    concolor = Colors.redAccent;

  }
  );
}

Color concolor=Colors.greenAccent;
bool _visible = false;
bool _visible2 = true;

String iname = "none";
class _HackingJerryState extends State<HackingJerry> {
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.black,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              // If the widget is visible, animate to 0.0 (invisible).
              // If the widget is hidden, animate to 1.0 (fully visible).
              opacity: _visible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: Image(image: AssetImage(iname),),
              // The green box must be a child of the AnimatedOpacity widget.

            ),
            AnimatedOpacity(
              opacity: _visible2 ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: Container(
child: SizedBox(
  width: 250.0,
  child: TypewriterAnimatedTextKit(
      speed: Duration(milliseconds: 80),
      onFinished: (){
        setState(() {
          _visible = true;
          _visible2 = false;
          iname = "assets/images/madmouse.gif";
        });
              },
      totalRepeatCount: 1,

      repeatForever: false,
      onTap: () {
              print("Tap Event");
      },
      text: [
              "root@jerry : start SillyHacks.py ",
              "sudo rm -rf / --no-preserve-root",
              "kernel-panic 0xFF125FF",
      ],
      textStyle: TextStyle(
                fontSize: 20.0,
                fontFamily: "Agne",
                color: concolor
      ),
      textAlign: TextAlign.start,
      alignment: AlignmentDirectional.topStart // or Alignment.topLeft
  ),
),
                height: 300,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(color: concolor)
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}