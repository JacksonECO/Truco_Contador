import 'package:flutter/material.dart';
import 'package:flutter/services.Dart';

void main() {
  runApp(MaterialApp(
      title: "Truco Contador",
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _timeA=0;
  int _timeB=0;
  int _pontoRod=2;
  int _rodA=0;
  int _rodB=0;
  String _truA="Truco";
  String _truB="Truco";

  //Manter a tela sempre em modo paisagem,
    //é necessário fazer um import de um arquivo a mais
  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
    ]);
  }
  Image _imageA(double width,double height){
      if (_timeA == 0) {
        return Image.asset(
          "images/BatA0.jpg",
          fit: BoxFit.fitHeight,
          width: width/2,
          height: height,
        );
      } else if(_timeA == 2) {
        return Image.asset(
          "images/BatA2.jpg",
          fit: BoxFit.fitHeight,
          width: width/2,
          height: height,
        );
      } else if(_timeA == 4) {
        return Image.asset(
          "images/BatA4.jpg",
          fit: BoxFit.fitHeight,
          width: width/2,
          height: height,
        );
      } else if(_timeA == 6) {
        return Image.asset(
          "images/BatA6.jpg",
          fit: BoxFit.fitHeight,
          width: width/2,
          height: height,
        );
      } else if(_timeA == 8) {
        return Image.asset(
          "images/BatA8.jpg",
          fit: BoxFit.fitHeight,
          width: width/2,
          height: height,
        );
      }else{
          return Image.asset(
            "images/BatA10.jpg",
            fit: BoxFit.fitHeight,
            width: width/2,
            height: height,
          );

      }
    
  }

  Image _imageB(double width,double height){
    if (_timeB == 0) {
      return Image.asset(
        "images/BatB0.jpg",
        fit: BoxFit.fitHeight,
        width: width/2,
        height: height,

      );
    } else if(_timeB == 2) {
      return Image.asset(
        "images/BatB2.jpg",
        fit: BoxFit.fitHeight,
        width: width/2,
        height: height,
      );
    } else if(_timeB == 4) {
      return Image.asset(
        "images/BatB4.jpg",
        fit: BoxFit.fitHeight,
        width: width/2,
        height: height,
      );
    } else if(_timeB == 6) {
      return Image.asset(
        "images/BatB6.jpg",
        fit: BoxFit.fitHeight,
        width: width/2,
        height: height,
      );
    } else if(_timeB == 8) {
      return Image.asset(
        "images/BatB8.jpg",
        fit: BoxFit.fitHeight,
        width: width/2,
        height: height,
      );
    }else{
      return Image.asset(
        "images/BatB10.jpg",
        fit: BoxFit.fitHeight,
        width: width/2,
        height: height,
      );

    }
  }

   void atualizaA(int q){
      setState(() {
        _timeA+=(q);
        _pontoRod=2;
        _truA="Truco";
        _truB="Truco";

        if(_timeA >=12){
          _timeA=0;
          _timeB=0;
          _rodA+=1;
        }else if(_timeA<0){
          _timeA=0;
        }
      });
   }

   void atualizaB(int q){
      setState(() {
        _timeB+=(q);
        _pontoRod=2;
        _truA="Truco";
        _truB="Truco";

        if(_timeB >=12){
          _timeA=0;
          _timeB=0;
          _rodB+=1;
        }else if(_timeB<0){
          _timeB=0;
        }
      });
    }

    void truco(int j){
      setState(() {

        if(_pontoRod==2){
          _pontoRod=4;
          if(j==1){
            _truA="";
            _truB="Seis";
            return;
          }else{
            _truB="";
            _truA="Seis";
            return;
          }
        }

        if(_pontoRod==4){
          _pontoRod=6;
          if(j==1){
            _truA="";
            _truB="Oito";
            return;
          }else{
            _truB="";
            _truA="Oito";
            return;
          }
        }

        if(_pontoRod==6){
          _pontoRod=8;
          if(j==1){
            _truA="";
            _truB="Queda";
            return;
          }else{
            _truB="";
            _truA="Queda";
            return;
          }
        }

        if(_pontoRod==8){
          _pontoRod=12;
          _truB="";
          _truA="";
          return;
        }

      });
    }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Stack(
      children: <Widget>[

        Row(
          children: <Widget>[
            _imageA(width,height),
            _imageB(width,height),
          ],),

        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //rodadas
            SizedBox(
              height: 30,
            ),

            Text(
              "Rodadas",
              style: TextStyle(fontSize: 30, color: Colors.red),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[

                  Text(
                        "Time 1:",
                        style: TextStyle(fontSize: 25, color: Colors.red),
                      ),


                 Text(
                    "Time 2:",
                    style: TextStyle(fontSize: 25, color: Colors.red),

                ),
              ],),

            SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[

                Text(
                  "$_rodA",
                  style: TextStyle(fontSize: 25, color: Colors.red),
                ),


                Text(
                  "$_rodB",
                  style: TextStyle(fontSize: 25, color: Colors.red),

                ),
              ],),



            SizedBox(
              height: 100,//100
            ),


            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                          Padding(
                          padding: EdgeInsets.all(10.0),
                          child:  FloatingActionButton(
                          child: const Icon(Icons.add),
                          onPressed: (){
                          atualizaA(_pontoRod);
                          },
                          ),),

                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child:  FloatingActionButton(
                              child: const Icon(Icons.remove),
                              onPressed: (){
                              atualizaA(-2);
                              },
                            ),),




                    ],


                  ),



                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child:  FloatingActionButton(
                                  child: const Icon(Icons.add),
                                  onPressed: (){
                                      atualizaB(_pontoRod);
                                  },
                                  ),

                        /*FlatButton(
                          child: Text(
                            "+$_pontoRod",
                            style: TextStyle(fontSize: 40.0, color: Colors.red, backgroundColor: Color.fromARGB(76, 46, 140, 100)),
                          ),
                          onPressed: () {
                            atualizaB(_pontoRod);
                          },
                        ),*/




                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child:  FloatingActionButton(
                            child: const Icon(Icons.remove),
                            onPressed: (){
                              atualizaB(-2);
                            },
                            ),

                        /*FlatButton(
                          child: Text(
                            "-2",
                            style: TextStyle(fontSize: 40.0, color: Colors.red, backgroundColor: Color.fromARGB(76, 46, 140, 100)),
                          ),
                          onPressed: () {
                            atualizaB(-2);
                          },
                        ),

                         */
                      ),

                    ],
                  ),

               ],),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                        FlatButton(
                          child: Text(
                            "$_truA",
                            style: TextStyle(fontSize: 40.0, color: Colors.orange, backgroundColor: Color.fromARGB(133, 77, 39, 100)),
                          ),
                          onPressed: () {
                            if(_truA!="")
                            truco(1);
                          },
                        ),

                        FlatButton(
                          child: Text(
                            "$_truB",
                            style: TextStyle(fontSize: 40.0, color: Colors.orange, backgroundColor: Color.fromARGB(133, 77, 39,100)),
                          ),
                            onPressed: () {
                              if(_truB!="")
                              truco(2);
                          },
                        ),


                    ],),






          ],
        ),
      ],
    );
  }
}