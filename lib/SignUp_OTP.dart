
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hostel_finder/Login_Page.dart';
import 'package:hostel_finder/Sign_Up.dart';
import 'package:hostel_finder/Welcome_Page.dart';


class SignUp_OTP extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return SignUp_OTP_state();
  }
}

class SignUp_OTP_state extends State<SignUp_OTP>{
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
          padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Sign_Up()));
                        // Add your login logic here
                      },
                      child: Icon(Icons.arrow_back)),
                  SizedBox(width: 60,),
                  Positioned(
                    left: 200,
                    child: Container(
                      child: Image.asset('assets/images/header.png', height: 25, width: 200,),
                    ),
                  ),

                ],
              ),
              Container(
                child: Image.asset('assets/images/OTP.png', height: 250, width: 300,),
              ),
              SizedBox(height: 20,),
              Container(
                child: Row(
                  children: [
                    Text('Verify Mobile Number', style: TextStyle(fontSize: 24, color: Colors.purple),),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:5),
                child: Row(
                  children: [
                    Text('OTP sent to ',
                      textAlign:TextAlign.start,
                      style: TextStyle(
                        color: Color(0xFF1B1D28),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 1.40,
                      ),
                    ),
                    Text('9868512330',style: TextStyle(color: Color(0xFF1B1D28),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: 1.40,),)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        'Enter OTP Sent via SMS', style: TextStyle(color: Colors.black.withOpacity(0.5)),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2)
                  ),
                  controller: OTP_controller,
                  style: TextStyle(color: Colors.black),),
              ),
              SizedBox(height: 40,),
              TextButton(
                onPressed: () {
                  //Act when the button is pressed
                },
                child: Text(
                  ' Verify                                     ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontFamily: 'Hind',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),

                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF14223B),
                ),
              ),

              Center(
                child: TextButton(
                  onPressed: () {
                    //Act when the button is pressed
                  },
                  child: Text('Resend Code'),),
              ),
            ],


          ),



        ),
      ),
    );

  }
}
