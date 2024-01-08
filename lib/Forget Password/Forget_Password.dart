
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostel_finder/Forget%20Password/Reset_Password.dart';
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
  TextEditingController contry_code = TextEditingController();

  bool _isContactValid = true;
  var mobile_number = "";
  FirebaseAuth _auth = FirebaseAuth.instance;
  Map<String, dynamic>? userMap;
  bool isLoading = false;

  Future<void> sendPasswordRecovery() async  {
     String phoneNumber = number_controller.text.trim();

     FirebaseAuth _auth = FirebaseAuth.instance;
     FirebaseFirestore _firestore = FirebaseFirestore.instance;

     // Check if the provided phone number exists in Firestore
         try{
       QuerySnapshot userSnapshot = await _firestore
           .collection('users')
           .where("phone number", isEqualTo: phoneNumber)
           .get();

       if (userSnapshot.docs.isNotEmpty) {
         // Phone number found in Firestore
         // Navigator.push(
         //   context,
         //   MaterialPageRoute(builder: (context) => Send_SMS()),
         // );
         print('data found');
       } else {
         // Phone number not found in Firestore
         ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
             content: Text('Number is not registered yet!'),
             duration: Duration(seconds: 1),
           ),
         );
       }
     } catch (e) {
    // Handle any errors that occur during Firestore query
    print("Error: $e");
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
    content: Text('Failed to fetch data.'),
    duration: Duration(seconds: 1),
    ),
    );
    }
   }


  @override
  void initState(){
    super.initState();
    contry_code.text = "+977";
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
                keyboardType: TextInputType.phone,
                controller: number_controller,
                style: TextStyle(color: Colors.black),
                onChanged: (value){
                  Forget_Password.reset_number = value;
                  mobile_number = value;
                  setState(() {
                    _isContactValid = _isValidContact(value);
                  });
                },

              ),
              SizedBox(height: 60,),
              TextButton(
                onPressed: () async{

                  await _auth.sendPasswordResetEmail(email: "abcd@gmail.com");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(' OTP sent to your number '),
                      duration: Duration(seconds: 1),
                    ),
                  );
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: contry_code.text + mobile_number,
                    verificationCompleted: (PhoneAuthCredential credential) async{
                      await _auth.signInWithCredential(credential);
                    },
                    verificationFailed: (FirebaseAuthException e) {
                    },
                    codeSent: (String verificationId, int? resendToken) {
                      //Sign_Up.verify = verificationId;
                      Forget_Password.reset_number = verificationId;
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => ResetPassword(getnumber: number_controller.text)),
                            (route) => false,
                      );
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                  sendPasswordRecovery();

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
  bool _isValidContact(String contact) {
    String contactRegex = r'^\d{10}$';
    return RegExp(contactRegex).hasMatch(contact);
  }
}
