import 'package:flutter/material.dart';
import 'JerryFlash.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class WelcomeJerry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Message from Jerry"),
      ),
      body: Center(

          child: SizedBox(
            width: 250.0,
            child: TypewriterAnimatedTextKit(
                speed: Duration(milliseconds: 80),
                onFinished: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JerryFlash()),
                  );

                  //_visible=true;
                },
                totalRepeatCount: 1,

                repeatForever: false,
                onTap: () {
                  print("Tap Event");
                },
                text: [
                  "You want to on your FlashLight? ",
                  "Your job is to hit tom and prevent him from calling FBI",
                  "and also don't you dare hit my nephew ",

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
        ),

    );
  }
}