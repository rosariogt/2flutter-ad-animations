import 'package:flutter/material.dart';

class ImplicitAnimationsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ImplicitAnimationsPageState();
}

class ImplicitAnimationsPageState extends State<ImplicitAnimationsPage> {
  static const _aligments = [
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.bottomRight,
    Alignment.bottomLeft,
    Alignment.center
  ];
  int _index = 0;

  AlignmentGeometry get _aliment => _aligments[_index % _aligments.length];
  double width = 50;
  bool animated = false;
  double scale = 0.0;
  Offset offset = Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _index++;
          });
        },
        child: Icon(Icons.refresh),
      ),
      body: animatedSlide(),
    );
  }

  animatedTextStyle() {
    return Center(
      child: Column(
        children: [
          AnimatedDefaultTextStyle(
              curve: Curves.bounceInOut,
              child: Text("Codigo Facilito"),
              style: animated
                  ? TextStyle(color: Colors.greenAccent, fontSize: 30)
                  : TextStyle(color: Colors.black, fontSize: 15),
              duration: Duration(milliseconds: 500)),
          onClick(() {
            setState(() {
              animated = !animated;
            });
          })
        ],
      ),
    );
  }

  animatedAlign() {
    return AnimatedAlign(
      alignment: _aliment,
      curve: Curves.elasticInOut,
      duration: const Duration(seconds: 1),
      child: Container(
        width: 100,
        height: 100,
        color: Colors.greenAccent,
      ),
    );
  }

  animatedContainer() {
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          // width: width,
          width: animated ? 500 : 100,
          // height: 100,
          height: animated ? 500 : 100,
          //color:  Colors.red,
          color: animated ? Colors.red : Colors.green,
        ),
        onClick(() {
          setState(() {
            //width = 200;
            animated = !animated;
          });
        })
      ],
    );
  }

  //animacion de escala
  animatedScale() {
    return Center(child:
      Column(children: [
        Expanded(child: AnimatedScale(
          curve: Curves.fastLinearToSlowEaseIn,
          //nos dice cuando finalizo la animacion
          //cuando termine la animacion desaparecera el corazon
          onEnd: (){
            setState(() {
              scale = 0;
            });
          },
          scale: scale,
          duration: Duration(milliseconds: 600),
          child: Icon(
            Icons.favorite,
            color: Colors.pinkAccent,
            size: 300,
          ),
        )),
        onClick((){
          setState(() {
            scale = 1;
          });
        })
      ],),);
  }

  animatedSlide() {
    return Column(
      children: [
        AnimatedSlide(offset: offset, duration: Duration(milliseconds: 500),
        child: const Icon(Icons.moped),),
        onClick((){
          setState(() {
            offset = Offset(0, 1);
          });
        })
      ],
    );
  }

  onClick(action) {
    return TextButton(onPressed: () => action(), child: Text("Animar"));
  }
}
