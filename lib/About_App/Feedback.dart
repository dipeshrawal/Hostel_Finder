import 'package:flutter/material.dart';
import 'package:hostel_finder/Signup Auth/SignUp_OTP.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FeedbackForm extends StatefulWidget {
  static String verify = "";

  @override
  State<StatefulWidget> createState() {
    return FeedbackFormState();
  }
}

class FeedbackFormState extends State<FeedbackForm> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();
  bool isHidePassword = true;
  bool isHideConfirmPassword = true;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Validation flag for each field
  bool _isEmailValid = true;
  bool _isPhoneNumberValid = true;
  var mobileNumber = "";
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/header.png', height: 25, width: 270,),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 210.59,
                height: 32,
                child: Text(
                  'Feedback Form',
                  style: TextStyle(
                    color: Color(0xFF21205B),
                    fontSize: 25,

                    fontFamily: 'ABeeZee',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
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
                      hintText: 'Full Name',
                    ),
                    controller: fullNameController,
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
                    controller: emailController,
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
                      errorText: _isPhoneNumberValid ? null : 'Enter a valid contact number',
                    ),
                    controller: phoneNumberController,
                    onChanged: (value) {
                      mobileNumber = value;
                      setState(() {
                        _isPhoneNumberValid = _isValidContact(value);
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
                    controller: addressController,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.only(left: 5, right: 15),
                child: Container(
                  child: TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: "Feedback",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),

                    ),
                    controller: feedbackController,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    // Check if all fields are valid before submitting feedback
                    if (_isEmailValid && _isPhoneNumberValid) {
                      try {
                        User? user = (await _auth.createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: 'dummyPassword', // Assign a dummy password for feedback users
                        )).user;

                        await _firestore.collection('feedback').doc(_auth.currentUser!.uid).set({
                          'full_name': fullNameController.text,
                          'email': emailController.text,
                          'phone_number': phoneNumberController.text,
                          'address': addressController.text,
                          'feedback': feedbackController.text,
                          'user_id': user?.uid,
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Feedback Submitted!'),
                            duration: Duration(seconds: 1),
                          ),
                        );

                        // ... Remaining logic remains unchanged
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
                      // Handle feedback submission errors
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Feedback submission failed. Please try again.'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF14223B),
                  ),
                  child: Text(
                    'Submit Feedback                          ',
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
              ),
            ],
          ),
        ),
      ),
    );
  }

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


// ... Remaining methods remain unchanged
}
