
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hostel_finder/Login_Page.dart';
import 'package:hostel_finder/SignUp_OTP.dart';
import 'package:hostel_finder/Welcome_Page.dart';


class Sign_Up extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return Sign_Up_state();
  }
}

class Sign_Up_state extends State<Sign_Up>{
  TextEditingController fullname_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController phonenumber_controller = TextEditingController();
  TextEditingController address_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController confirm_password_controller = TextEditingController();
  bool isHidePassword = true;
  bool isHideConfirmPassword = true;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login_Page()));
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

              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 15),
                child: Container(
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.3),
                          hintText: 'Fullname',
                        ),
                        controller: fullname_controller,
                        style: TextStyle(color: Colors.black),

                      ),

                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 15),
                child: Container(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      hintText: 'Email',
                    ),
                    controller: email_controller,
                    style: TextStyle(color: Colors.black),

                  ),

                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 15),
                child: Container(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      hintText: 'Phone Number',
                    ),
                    controller: phonenumber_controller,
                    style: TextStyle(color: Colors.black),

                  ),

                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 15),
                child: Container(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_city),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      hintText: 'Address',
                    ),
                    controller: address_controller,
                    style: TextStyle(color: Colors.black),

                  ),

                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 15),
                child: Container(
                  child: TextField(
                    obscureText: isHidePassword,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.3),
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(isHidePassword
                                ? Icons.visibility_off
                                : Icons.visibility))
                    ),
                    controller: password_controller,
                    style: TextStyle(color: Colors.black),),

                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 15),
                child: Container(
                  child: TextField(
                    obscureText: isHideConfirmPassword,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.3),
                        hintText: 'Confirm Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                            onTap: _toggleConfirmPasswordView,
                            child: Icon(isHideConfirmPassword
                                ? Icons.visibility_off
                                : Icons.visibility))
                    ),
                    controller: confirm_password_controller,
                    style: TextStyle(color: Colors.black),),

                ),
              ),
              SizedBox(
                height: 70,
              ),
              Center(
                child:GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp_OTP()));
                    // Add your login logic here
                  },
                  child: Container(
                    width: 298,
                    height: 38,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Color(0xFF14223B),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Submit',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Hind',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),



      ),
    );

  }

  void _togglePasswordView(){

    setState(() {
      if(isHidePassword == true){
        isHidePassword = false;
      }else{
        isHidePassword = true;
      }

    });
  }

  void _toggleConfirmPasswordView(){

    setState(() {
      if(isHideConfirmPassword== true){
        isHideConfirmPassword = false;
      }else{
        isHideConfirmPassword = true;
      }
    });
  }


}
