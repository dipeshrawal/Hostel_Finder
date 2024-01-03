
import 'package:flutter/material.dart';
import 'package:hostel_finder/Login_Page.dart';

class Edit_Profile extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return Edit_Profile_State();
  }
}

class Edit_Profile_State extends State<Edit_Profile>{
  TextEditingController username_controller = TextEditingController();


  bool _isPasswordValid = true;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/header.png', height: 25, width: 270,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Edit Username',
                    style: TextStyle(
                      color: Color(0xFF14223B),
                      fontSize: 28,
                      fontFamily: 'Hind Jalandhar',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40,),
              Row(
                children: [
                  Text(
                    'Change Your Hostel Finder Username',
                    style: TextStyle(
                      color: Color(0xFF14223B),
                      fontSize: 19,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12), // Adding padding inside the container
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), // Rounded corners for the container
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none, // Remove the default border
                    hintText: 'Enter your new username', // Adding hint text
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 15), // Hint text color
                  ),
                  controller: username_controller,
                  onChanged: (value) {
                    setState(() {
                    });
                  },
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 70,),
              TextButton(
                onPressed: () {
                  //Act when the button is pressed
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Login_Page()),
                  // );
                },
                child: Text(
                  ' Update                                        ',
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
