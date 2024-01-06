


import 'package:flutter/material.dart';
import 'package:hostel_finder/Forget%20Password/Send_SMS.dart';



class Forget_Password extends StatefulWidget {
  static var reset_number="" ;

  @override
  State<StatefulWidget> createState() {
    return Forget_Password_state();
  }
}

class Forget_Password_state extends State<Forget_Password>{
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
      appBar: AppBar(
        title: Image.asset('assets/images/header.png', height: 25, width: 270,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
          child: Column(
            children: [
              SizedBox(height: 40,),
              Row(
                children: [
                  Text(
                    'Forget Password',
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
              Row(
                children: [
                  Text(
                    'Recover Your Hostel Finder Password',
                    style: TextStyle(
                      color: Color(0xFF14223B),
                      fontSize: 18,
                      fontFamily: 'Hind Jalandhar',
                      fontWeight: FontWeight.w300,
                      height: 0,
                    ),maxLines: 1,
                  ),
                ],
              ),
              SizedBox(height: 30,),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.3),
                  hintText: 'Enter your Phone Number',
                ),
                controller: number_controller,
                style: TextStyle(color: Colors.black),
                onChanged: (value){
                  Forget_Password.reset_number=value;
                },

              ),
              SizedBox(height: 60,),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Send_SMS()));
                  //Act when the button is pressed
                },
                child: Text(
                  ' Recover                                     ',
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
            ],
          ),



        ),
      ),
    );

  }
}
