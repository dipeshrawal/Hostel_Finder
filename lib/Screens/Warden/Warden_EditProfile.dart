import 'package:flutter/material.dart';
import 'package:hostel_finder/Login_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Warden_EditProfile extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return Warden_EditProfile_State();
  }
}

class Warden_EditProfile_State extends State<Warden_EditProfile>{
  TextEditingController fullname_controller = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  bool _isPasswordValid = true;

  @override
  void initState(){
    super.initState();
  }

  Future<void> updateFullName() async {
    User? user = _auth.currentUser;
    if(user != null){
      try {
        await _firestore.collection('warden').doc(user.uid).update({
          'full_name': fullname_controller.text,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Full Name Updated !'),
            duration: Duration(seconds: 1),
          ),
        );
        fullname_controller.clear();

      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update full name.'),
          ),
        );
      }
    }
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
                    'Edit FullName',
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
                    'Change Your Hostel Finder Fullname',
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
                    hintText: 'Enter your new fullname', // Adding hint text
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 15), // Hint text color
                  ),
                  controller: fullname_controller,
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

                  updateFullName(); // Call the method to update the username
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