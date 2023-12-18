
import 'package:flutter/material.dart';
import 'package:hostel_finder/Navigation_Slider.dart';



class Visitor_Dashboard extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return Visitor_Dashboard_state();
  }
}

class Visitor_Dashboard_state extends State<Visitor_Dashboard>{
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
      drawer: Navigation_Slider(),
      appBar: AppBar(
        title: Image.asset('assets/images/header.png', height: 25, width: 270,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,),
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      hintText: 'Search via hostel name, location' ,
                    ),
                    controller: search_controller,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child: Text('Hostel in Nepal',
                  style: TextStyle(
                    color: Color(0xFF373C3D),
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0.11,
                    letterSpacing: 0.20,)),
              ),

              SizedBox(height: 20,),


            ],
          ),
        ),
      ),
    );
  }
}
