
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hostel_finder/Welcome_Page.dart';


class Opening_Page extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return openingpage_state();
  }
}

class openingpage_state extends State<Opening_Page>{

  @override
  void initState(){
    super.initState();
    Timer(
      Duration(seconds: 3),
        ()=> Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> Welcome_Page())),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
              height: size.height,
              width: size.width,
              child: Stack(
                children:[
                  Container(
                    //AssetImage("assets/images/background.png", fit: BoxFit.fill,),

                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.fill,

                      ),
                    ),
                  ),
                ]
              ),

            ),
    );

  }

}
