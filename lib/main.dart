import 'package:flutter/material.dart';
import 'package:sillyflash/screeens/uselessFlash.dart';
import 'package:sillyflash/screeens/JerryFlash.dart';
import 'package:sillyflash/screeens/welcomeJerry.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SillyFlash',
      theme: ThemeData.dark(),
      home: SillyHome(title: 'Welcome to Silly flash'),
    );
  }
}

class SillyHome extends StatefulWidget {
  SillyHome({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _SillyHomeState createState() => _SillyHomeState();
}

class _SillyHomeState extends State<SillyHome> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(


        child: Column(

          children: [
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Text("SillyHacks2020 - SillyFlash",style: TextStyle(color: Colors.black,fontSize: 20),),
),
            Container(

                child: Image(image: AssetImage("assets/images/ameme.jpg"))),
            Text("Choose your Opponent",style: TextStyle(fontSize: 30,color: Colors.black),),


            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WelcomeJerry()),
                      );


                    },
                    child: Container(
                      height: 200,
                      child: Card(
                      child: Stack(
                        children: [

                          Container(
                              width:200,
                              height: 200,
                              child: Image(image: AssetImage("assets/images/jerryChallenge.gif"))),
                          Center(child: Text("Challenge Jerry",style: TextStyle(color: Colors.white,fontSize: 20),)),
                        ],
                      )
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UselessBox()),
                      );
                    },
                    child: Container(
                      height: 200,
                      child: Card(
                        child: Stack(
                          children: [

                            Container(
                                width:200,
                                height: 200,
                                child: Image(image: AssetImage("assets/images/uselessChallenge.gif"))),
                            Center(child: Text("Challenge Box",style: TextStyle(color: Colors.white,fontSize: 20),)),
                          ],
                        )
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),

      ),

    );
  }
}
