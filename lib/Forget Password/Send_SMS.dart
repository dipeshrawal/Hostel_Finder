
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hostel_finder/Login_Page.dart';
import 'package:hostel_finder/Sign_Up.dart';
import 'package:hostel_finder/Welcome_Page.dart';


class Send_SMS extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return Send_SMS_state();
  }
}

class Send_SMS_state extends State<Send_SMS>{
  TextEditingController number_controller = TextEditingController();

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
              Container(
                child: Image.asset('assets/images/header.png', height: 25, width: 200,),
              ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Send SMS',
                    style: TextStyle(
                      color: Color(0xFF14223B),
                      fontSize: 28,
                      fontFamily: 'Hind Jalandhar',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40,),
              Container(
                width: 200,
                height: 176,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/forget_password.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Text(
                    'Send SMS to verify your Phone Number',
                    style: TextStyle(
                      color: Color(0xFF14223B),
                      fontSize: 18,
                      fontFamily: 'Hind Jalandhar',
                      fontWeight: FontWeight.w300,
                      height: 0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 340,
                    height: 180,
                    child: Text(
                      'Hostel finder requires permission to send sms from your mobile number. By proceeding ahead, you provide the permission to send the SMS. SMS composer screen with a encrypted text message will be opened. Please send that message to receive your OTP. Regular carrier charge may apply.',
                      style: TextStyle(
                        color: Color(0xFF14223B),
                        fontSize: 15,
                        fontFamily: 'Hind Jalandhar',

                        fontWeight: FontWeight.w300,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 304,
                    child: Text(
                      'You must send SMS from your registered mobile number to receive your OTP',
                      style: TextStyle(
                        color: Color(0xFF14223B),
                        fontSize: 15,
                        fontFamily: 'Hind Jalandhar',
                        fontWeight: FontWeight.w300,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40,),
              TextButton(
                onPressed: () {
                  //Act when the button is pressed
                },
                child: Text(
                  ' Preceed to Send SMS                  ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Hind',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),

                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF14223B),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
