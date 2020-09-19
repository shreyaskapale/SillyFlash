
import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'faceJerry.dart';
import 'win.dart';
import 'package:flutter/material.dart';
List<double> nef = [0,0,0,0,0,0,0,0,0];
List<double> tom = [0,0,0,0,0,0,0,0,0];
class JerryFlash extends StatefulWidget {
  @override
  _JerryFlashState createState() => _JerryFlashState();
}

void initState() {

}
Random random = new Random();


int tomKill=0;
int nefKill=0;
class _JerryFlashState extends State<JerryFlash> {

  startGame(){
    Timer timer;

    timer = Timer.periodic(Duration(milliseconds: 500), (Timer t) => randomize());


    Future.delayed(const Duration(seconds: 10), ()
    {
      timer?.cancel();
      setState(() {


      if(tomKill>nefKill){

        tom = [300,300,300,300,300,300,300,300,300];


      }else{

        nef = [300,300,300,300,300,300,300,300,300];
      }
      _showDialog();
      });

    });





  }
  void playSound(String soundName) {


    final player = AudioCache();
    player.play('sounds/'+ soundName);
  }
  randomize(){
    var i;

    var opt = random.nextInt(2);
    var s = random.nextInt(9);
    if(opt==0){
      setState(() {
        tom = [0,0,0,0,0,0,0,0,0];
        nef = [0,0,0,0,0,0,0,0,0];
        tom[s] = 300;
      });
    }else{
      setState(() {
        nef = [0,0,0,0,0,0,0,0,0];
        tom = [0,0,0,0,0,0,0,0,0];
        nef[s] = 300;
      });
    }
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Challenge :) Stats"),
          content: new Text("You hit the lil one  $nefKill times and tom $tomKill times, now you will be addressed by the great lord jerry"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("okei"),
              onPressed: () {

                if(nefKill > tomKill) {
                  nefKill = 0;
                  tomKill = 0;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FaceJerry()),
                  );
                } else {
                  nefKill = 0;
                  tomKill = 0;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Win()),
                  );

                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(



      backgroundColor: Color(0xFF9C8BBF),
      appBar: AppBar(
        title: Text("you hit Tuffy $nefKill times and Tom $tomKill times",style: TextStyle(fontSize: 16),),
      ),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
                onTap: (){
                  setState(() {

                  });


                },
                child: Image(image: AssetImage("assets/images/jerrycmd.jpg"),)),
            Expanded(child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
              children: [
                GameCardBuild(tom[0],nef[0]),
                GameCardBuild(tom[1],nef[1]),
                GameCardBuild(tom[2],nef[2]),
                GameCardBuild(tom[3],nef[3]),
                GameCardBuild(tom[4],nef[4]),
                GameCardBuild(tom[5],nef[5]),
                GameCardBuild(tom[6],nef[6]),
                GameCardBuild(tom[7],nef[7]),
                GameCardBuild(tom[8],nef[8]),



              ],
            )),
            Container(
              width: double.infinity,
              child: Card(
                child: OutlineButton(
                  onPressed: (){
                    startGame();
                  },
                  child: Text("BEGIN"),
                ),
              ),
            )
          ],

        )
      ),
    );
  }

  Card GameCardBuild(double h1,double h2) {
    return Card(child: Stack(
                children: [
                  Center(
                    child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn,
                      width: h1,
                        height: h1,
                        child: FittedBox(
                          child: OutlineButton(
                            onPressed: (){

                              playSound("tomcry2.wav");
                              tomKill+=1;
                            },
                              child: Image.asset('assets/images/tomcall.jpg')
                          ),
                          fit:BoxFit.fill ,
                        )),
                  ),
                  Center(
                    child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn,
                        width: h2,
                        height: h2,
                        child: FittedBox(
                          child: OutlineButton(
                              onPressed: (){
                                playSound("tomcry.wav");
                                nefKill+=1;
                              },

                              child: Image.asset('assets/images/nef.jpg')),
                          fit:BoxFit.none ,
                        )),
                  ),

                ],
              ),);
  }
}
