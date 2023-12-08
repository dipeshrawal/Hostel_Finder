
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hostel_finder/Login_Page.dart';
import 'package:hostel_finder/Sign_Up.dart';
import 'package:hostel_finder/Visitor_Dashboard.dart';
import 'package:hostel_finder/Welcome_Page.dart';


class Menu_Page extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return Menu_Page_state();
  }
}

class Menu_Page_state extends State<Menu_Page>{
  TextEditingController number_controller = TextEditingController();
  TextEditingController OTP_controller = TextEditingController();

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 50, right: 10),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Visitor_Dashboard()));
                      // Add your login logic here
                    },
                    child: Icon(Icons.arrow_back, color: Colors.black,),),
                  SizedBox(width: 60,),
                  Positioned(
                    left: 200,
                    child: Container(
                      child: Image.asset('assets/images/header.png', height: 25, width: 200,),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 50,),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 0.50, color: Color(0xFFE3E3E7)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              shadows: [
                                BoxShadow(
                                  color:Colors.black.withOpacity(0.5),
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                  spreadRadius: 1,
                                )
                              ],
                            ),
                            child: Icon(Icons.person, color: Colors.black,),
                          ),
                          SizedBox(width: 20,),
                          Text(
                            'Student Login',
                            style: TextStyle(
                              color: Color(0xFF1A1E25),
                              fontSize: 16,
                              fontFamily: 'Hind',
                              fontWeight: FontWeight.w500,
                              height: 0.06,
                              letterSpacing: 0.32,
                            ),
                          ),
                        ],
                      ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 0.50, color: Color(0xFFE3E3E7)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadows: [
                            BoxShadow(
                              color:Colors.black.withOpacity(0.5),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                              spreadRadius: 1,
                            )
                          ],
                        ),
                        child: Icon(Icons.person, color: Colors.black,),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        'Hostel Warden Login',
                        style: TextStyle(
                          color: Color(0xFF1A1E25),
                          fontSize: 16,
                          fontFamily: 'Hind',
                          fontWeight: FontWeight.w500,
                          height: 0.06,
                          letterSpacing: 0.32,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 0.50, color: Color(0xFFE3E3E7)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadows: [
                            BoxShadow(
                              color:Colors.black.withOpacity(0.5),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                              spreadRadius: 1,
                            )
                          ],
                        ),
                        child: Icon(Icons.location_city_outlined, color: Colors.black,),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        'Register Your Hostel',
                        style: TextStyle(
                          color: Color(0xFF1A1E25),
                          fontSize: 16,
                          fontFamily: 'Hind',
                          fontWeight: FontWeight.w500,
                          height: 0.06,
                          letterSpacing: 0.32,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 0.50, color: Color(0xFFE3E3E7)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadows: [
                            BoxShadow(
                              color:Colors.black.withOpacity(0.5),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                              spreadRadius: 1,
                            )
                          ],
                        ),
                        child: Icon(Icons.support_agent_outlined, color: Colors.black,),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        ' Help & Support',
                        style: TextStyle(
                          color: Color(0xFF1A1E25),
                          fontSize: 16,
                          fontFamily: 'Hind',
                          fontWeight: FontWeight.w500,
                          height: 0.06,
                          letterSpacing: 0.32,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 0.50, color: Color(0xFFE3E3E7)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadows: [
                            BoxShadow(
                              color:Colors.black.withOpacity(0.5),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                              spreadRadius: 1,
                            )
                          ],
                        ),
                        child: Icon(Icons.feedback, color: Colors.black,),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        'Feedback',
                        style: TextStyle(
                          color: Color(0xFF1A1E25),
                          fontSize: 16,
                          fontFamily: 'Hind',
                          fontWeight: FontWeight.w500,
                          height: 0.06,
                          letterSpacing: 0.32,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 0.50, color: Color(0xFFE3E3E7)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadows: [
                            BoxShadow(
                              color:Colors.black.withOpacity(0.5),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                              spreadRadius: 1,
                            )
                          ],
                        ),
                        child: Icon(Icons.question_mark_outlined,color: Colors.black,),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        'About Us',
                        style: TextStyle(
                          color: Color(0xFF1A1E25),
                          fontSize: 16,
                          fontFamily: 'Hind',
                          fontWeight: FontWeight.w500,
                          height: 0.06,
                          letterSpacing: 0.32,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 0.50, color: Color(0xFFE3E3E7)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadows: [
                            BoxShadow(
                              color:Colors.black.withOpacity(0.5),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                              spreadRadius: 1,
                            )
                          ],
                        ),
                        child: Icon(Icons.logout,color: Colors.black,),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Color(0xFF1A1E25),
                          fontSize: 16,
                          fontFamily: 'Hind',
                          fontWeight: FontWeight.w500,
                          height: 0.06,
                          letterSpacing: 0.32,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );

  }
}

