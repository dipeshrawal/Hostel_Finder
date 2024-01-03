
import 'package:flutter/material.dart';
import 'package:hostel_finder/Navigation Bar/Navigation_Slider.dart';
import 'package:hostel_finder/Navigation%20Bar/Warden_Navigation_Slider.dart';



class Warden_Dashboard extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return Warden_Dashboard_state();
  }
}

class Warden_Dashboard_state extends State<Warden_Dashboard>{
  TextEditingController search_controller = TextEditingController();

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Warden_Navigation_Slider(),
      appBar: AppBar(
        title: Image.asset('assets/images/header.png', height: 25, width: 270,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 15),
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
