import 'package:flutter/material.dart';
import 'package:hostel_finder/Navigation%20Bar/Warden_Navigation_Slider.dart';
class Warden_Dashboard extends StatefulWidget {
  const Warden_Dashboard({super.key});

  @override
  State<Warden_Dashboard> createState() => Warden_DashboardState();
}

class Warden_DashboardState extends State<Warden_Dashboard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const Warden_Navigation_Slider(),
      appBar: AppBar(
        title: Image.asset('assets/images/header.png', height: 25, width: 270,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
          child: Column(
            children: [
              Container(
                width: size.width,
                height: 200,
                color: Colors.red,
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Text(
                    'Adriz Boys Hostel',
                    style: TextStyle(
                      color: Color(0xFF1A1E25),
                      fontSize: 20,
                      fontFamily: 'Hind',
                      fontWeight: FontWeight.w700,
                      height: 0.07,
                    ),
                  ),
                  SizedBox(width: 50,),
                  Icon(Icons.heart_broken)
                ],
              ),
              SizedBox(height: 20,),
              Row(children: [
                Icon(Icons.star, color: Colors.yellow,),
                SizedBox(width: 5,),
                Text("4.1(66 reviews)"),
                SizedBox(width: 80,),
                Icon(Icons.chair_rounded),
                SizedBox(width: 5,),
                Text("1-4 Seater"),
              ],),
              SizedBox(height: 10,),
              Row(children: [
                Icon(Icons.place_rounded, color: Colors.yellow,),
                SizedBox(width: 5,),
                Text("Ratopul, Kathmandu", maxLines: 1,),

                SizedBox(width:50,),
                Icon(Icons.area_chart_sharp),
                SizedBox(width: 5,),
                Text("874 m2"),
              ],),
              SizedBox(height: 20,),
              Container(
                width: 343,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.60,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFD6D6D6),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
