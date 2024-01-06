
import 'package:flutter/material.dart';
import 'package:hostel_finder/Signup Auth/SignUp_OTP.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Sign_Up extends StatefulWidget {

static String verify = "";
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
  TextEditingController contry_code = TextEditingController();
  //TextEditingController confirm_password_controller = TextEditingController();
  bool isHidePassword = true;
  bool isHideConfirmPassword = true;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Validation flag for each field
  bool _isEmailValid = true;
  bool _isPasswordValid = true;
  bool _isContactValid = true;
  var mobile_number = "";
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState(){
    contry_code.text= "+977";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/header.png', height: 25, width: 270,),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                      errorText: _isEmailValid ? null : 'Enter a valid email address',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      hintText: 'Email',
                    ),
                    controller: email_controller,
                    onChanged: (value) {
                      setState(() {
                        _isEmailValid = _isValidEmail(value);
                      });
                    },
                    style: TextStyle(color: Colors.black),

                  ),

                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 15),
                child: Container(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      hintText: 'Phone Number',
                      errorText: _isContactValid ? null : 'Enter a valid contact number',
                    ),
                    controller: phonenumber_controller,
                    onChanged: (value) {
                      mobile_number = value;
                      setState(() {
                        _isContactValid = _isValidContact(value);
                      });
                    },

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
                        errorText: _isPasswordValid ? null : 'Password must be at least 8 characters',
                        suffixIcon: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(isHidePassword
                                ? Icons.visibility_off
                                : Icons.visibility))
                    ),
                    controller: password_controller,
                    onChanged: (value) {
                      setState(() {
                        _isPasswordValid = value.length >= 8;
                      });
                    },
                    style: TextStyle(color: Colors.black),),


                ),
              ),
              // SizedBox(height: 20,),
              // Padding(
              //   padding: const EdgeInsets.only(left: 5, right: 15),
              //   child: Container(
              //     child: TextField(
              //       obscureText: isHideConfirmPassword,
              //       decoration: InputDecoration(
              //           border: OutlineInputBorder(),
              //           filled: true,
              //           fillColor: Colors.grey.withOpacity(0.3),
              //           hintText: 'Confirm Password',
              //           prefixIcon: Icon(Icons.lock),
              //           suffixIcon: InkWell(
              //               onTap: _toggleConfirmPasswordView,
              //               child: Icon(isHideConfirmPassword
              //                   ? Icons.visibility_off
              //                   : Icons.visibility))
              //       ),
              //       controller: confirm_password_controller,
              //       onChanged: (value) {
              //         setState(() {
              //           _isPasswordValid = value.length >= 8;
              //         });
              //       },
              //       style: TextStyle(color: Colors.black),),
              //
              //   ),
              // ),
              SizedBox(
                height: 70,
              ),
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => SignUp_OTP()));
              ElevatedButton(
                onPressed: () async {
                  // Check if all fields are valid before attempting registration
                  if (
                  _isEmailValid &&
                      _isPasswordValid &&
                      _isContactValid ) {
                    try {
                      // Create user with email and password
                      User? user = (await _auth.createUserWithEmailAndPassword(
                        email: email_controller.text,
                        password: password_controller.text,
                      )).user;

                      if(user!= null){
                        // Store additional user data in Firestore
                        await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
                          'full_name': fullname_controller.text,
                          'email': email_controller.text,
                          'phone number': phonenumber_controller.text,
                          'address': address_controller.text,
                          'status':"Offline",
                          'uid' : _auth.currentUser?.uid,
                        });
                      }
                      user?.updateProfile(displayName: fullname_controller.text);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Submitted !'),
                          duration: Duration(seconds: 1),
                        ),
                      );

                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: '${contry_code.text + mobile_number}',
                        verificationCompleted: (credential) async{
                          await auth.signInWithCredential(credential);
                        },
                        verificationFailed: (FirebaseAuthException e) {
                        },
                        codeSent: (verificationId,resendToken) {
                          Sign_Up.verify = verificationId;
                          // Navigate to the login page or any other page after successful registration
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp_OTP(getnumber: phonenumber_controller.text)),
                                (route) => false,
                          );
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                    } catch (e) {
                      // Show error message for incomplete or invalid fields
                      print('Error : $e');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please fill in all fields correctly.'),
                        ),
                      );
                    }
                  } else {
                    // Handle registration errors
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('SignUp failed. Please try again.'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF14223B),
                ),
                child: Text(
                  'Submit                                        ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Hind',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
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

  // void _toggleConfirmPasswordView(){
  //
  //   setState(() {
  //     if(isHideConfirmPassword== true){
  //       isHideConfirmPassword = false;
  //     }else{
  //       isHideConfirmPassword = true;
  //     }
  //   });
  // }

  // Helper method for validating email format
  bool _isValidEmail(String email) {
    String emailRegex = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
    return RegExp(emailRegex).hasMatch(email);
  }

  // Helper method for validating contact number format
  bool _isValidContact(String contact) {
    String contactRegex = r'^\d{10}$';
    return RegExp(contactRegex).hasMatch(contact);
  }


}
