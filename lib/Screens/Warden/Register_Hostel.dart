
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hostel_finder/Signup%20Auth/SignUp_OTP.dart';
import 'package:hostel_finder/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Register_Hostel extends StatefulWidget {

  static String verify = "";
  @override
  State<StatefulWidget> createState() {
    return Register_Hostel_state();
  }
}
class Register_Hostel_state extends State<Register_Hostel>{
  Uint8List? _citizenship_image;
  Uint8List? _panvat_image;

  void selectImageofCitizenship() async{
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _citizenship_image = img;
    });
  }
  void selectImageofPANVAT() async{
    Uint8List img2 = await pickImage(ImageSource.gallery);
    setState(() {
      _panvat_image = img2;
    });
  }

  TextEditingController fullname_controller = TextEditingController();
  TextEditingController phonenumber_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController address_controller = TextEditingController();
  TextEditingController hostelname_controller = TextEditingController();
  TextEditingController hosteladdress_controller = TextEditingController();
  TextEditingController registrationnumber_controller = TextEditingController();
  TextEditingController registerdate_controller = TextEditingController();
  TextEditingController hosteltype_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController contry_code = TextEditingController();
  bool isHidePassword = true;
  String selectedHostelTypeText= "";
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseAuth auth = FirebaseAuth.instance;

  // Validation flag for each field
  bool _isEmailValid = true;
  bool _isPasswordValid = true;
  bool _isContactValid = true;
  var mobile_number = "";

  Uint8List? _image;
  var chooseValue;
  Map hostelTypes = {
    "1": "Boys Hostel",
    "2": "Girls Hostel",
  };

  void selectImage() async{
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  void initState(){
    contry_code.text= "+977";
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
          padding: const EdgeInsets.only(top: 25,left: 15, right: 15),
          child: Column(
            children: [
              Text(
                'Register Your Hostel',
                style: TextStyle(
                  color: Color(0xFF373C3D),
                  fontSize: 25,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0.06,
                  letterSpacing: 0.20,
                ),
              ),
              SizedBox(height: 30, width: 50,),
              Text(
                'Give your details and your hostel details too..',
                style: TextStyle(
                  color: Color(0xFF737B7D),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0.11,
                  letterSpacing: 0.30,
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: 343,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.60,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFD6D6D6),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Text(
                    '1. Warden Details',
                    style: TextStyle(
                      color: Color(0xFF1A1E25),
                      fontSize: 16,
                      fontFamily: 'Hind',
                      fontWeight: FontWeight.w700,
                      height: 0.06,
                      letterSpacing: 0.21,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.3),
                  hintText: 'Full Name',
                ),
                controller: fullname_controller,
                style: TextStyle(color: Colors.black),

              ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone),
                  errorText: _isContactValid ? null : 'Enter a valid contact number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.3),
                  hintText: 'Phone Number',
                ),
                controller: phonenumber_controller,
                onChanged: (value) {
                  setState(() {
                    _isContactValid = _isValidContact(value);
                  });
                },
                style: TextStyle(color: Colors.black),

              ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  errorText: _isEmailValid ? null : 'Enter a valid email address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
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
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Address',
                  prefixIcon: Icon(Icons.location_city_sharp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.3),
                  hintText: 'Address',
                ),
                controller: address_controller,
                style: TextStyle(color: Colors.black),

              ),
              SizedBox(height: 25,),
              Row(
                children: [
                  Text(
                    'Citizenship Photo',
                    style: TextStyle(
                      color: Color(0xFF191D1E),
                      fontSize: 16,
                      fontFamily: 'Karla',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Center(
                child: Stack(
                  children: [
                    _citizenship_image != null ?
                    DottedBorder(
                      color: Colors.grey.withOpacity(0.2),
                      radius: Radius.circular(10),
                      strokeWidth: 3,
                      dashPattern: [25,5],
                      child: Container(
                        height: 110,
                        width: size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: MemoryImage(_citizenship_image!),
                          ),
                        ),
                      ),
                    )
                        :
                    DottedBorder(
                      color: Colors.grey.withOpacity(0.2),
                      radius: Radius.circular(10),
                      strokeWidth: 3,
                      dashPattern: [25,5],
                      child: Container(
                        height: 110,
                        width: size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                        child: ListTile(
                            leading: Container(child:Icon(Icons.file_upload_outlined)),
                            title: Text(
                              'Upload Citizenship Photo',
                              style: TextStyle(
                                color: Color(0xFF1A1E25),
                                fontSize: 16,
                                fontFamily: 'Hind',
                                fontWeight: FontWeight.w500,
                                height: 0.06,
                                letterSpacing: 0.32,
                              ),
                            ),
                            onTap: selectImageofCitizenship
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: 343,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.60,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFD6D6D6),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Text(
                    '2. Hostel Details',
                    style: TextStyle(
                      color: Color(0xFF1A1E25),
                      fontSize: 16,
                      fontFamily: 'Hind',
                      fontWeight: FontWeight.w700,
                      height: 0.06,
                      letterSpacing: 0.21,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Hostel Name',
                  prefixIcon: Icon(Icons.location_city_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.3),
                ),
                controller: hostelname_controller,
                style: TextStyle(color: Colors.black),

              ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Hostel Address',
                  prefixIcon: Icon(Icons.location_city_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.3),

                ),
                controller: hosteladdress_controller,
                style: TextStyle(color: Colors.black),

              ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Hostel Registration Number',
                  prefixIcon: Icon(Icons.confirmation_number_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.3),
                ),
                controller: registrationnumber_controller,
                style: TextStyle(color: Colors.black),

              ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Registration Date',
                  prefixIcon: Icon(Icons.date_range_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.3),
                  hintText: 'Full Name',
                ),
                controller: registerdate_controller,
                style: TextStyle(color: Colors.black),
                readOnly: true,
                onTap: () async{
                  DateTime? pickeddate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101)
                  );
                  if(pickeddate != null){
                    setState(() {
                      registerdate_controller.text = DateFormat('yyyy-MM-dd').format(pickeddate);
                    });
                  }
                },

              ),
              SizedBox(height: 20,),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: 'Hostel Type',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.3),
                ),
                items: [
                  DropdownMenuItem(child: Text("Boys Hostel"), value: "1",),
                  DropdownMenuItem(child: Text("Girls Hostel"), value: "2",),
                ],
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  setState(() {
                    chooseValue = value!;
                    selectedHostelTypeText = hostelTypes[value];
                  });
                },
              ),
              SizedBox(height: 20,),
              TextField(
                obscureText: isHidePassword,
                decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.3),
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
              SizedBox(height: 25,),
              Row(
                children: [
                  Text(
                    'PAN/VAT Photo',
                    style: TextStyle(
                      color: Color(0xFF191D1E),
                      fontSize: 16,
                      fontFamily: 'Karla',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Center(
                child: Stack(
                  children: [
                    _panvat_image != null ?
                    DottedBorder(
                      color: Colors.grey.withOpacity(0.2),
                      radius: Radius.circular(10),
                      strokeWidth: 3,
                      dashPattern: [25,5],
                      child: Container(
                        height: 110,
                        width: size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: MemoryImage(_panvat_image!),
                          ),
                        ),
                      ),
                    )
                    :
                    DottedBorder(
                      color: Colors.grey.withOpacity(0.2),
                      radius: Radius.circular(10),
                      strokeWidth: 3,
                      dashPattern: [25,5],
                      child: Container(
                        height: 110,
                        width: size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                        child: ListTile(
                            leading: Container(child:Icon(Icons.file_upload_outlined)),
                            title: Text(
                              'Upload PAN/VAT Photo',
                              style: TextStyle(
                                color: Color(0xFF1A1E25),
                                fontSize: 16,
                                fontFamily: 'Hind',
                                fontWeight: FontWeight.w500,
                                height: 0.06,
                                letterSpacing: 0.32,
                              ),
                            ),
                            onTap: selectImageofPANVAT
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 50,),
              ElevatedButton(
                onPressed: () async {
                  // Check if all fields are valid before attempting registration
                  if (
                  _isEmailValid &&
                      _isPasswordValid &&
                      _isContactValid ) {
                    try {
                      // Create user with email and password
                      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
                        email: email_controller.text,
                        password: password_controller.text,
                      );
                      // Store additional user data in Firestore
                      await _firestore.collection('warden').doc(userCredential.user?.uid).set({
                        'full_name': fullname_controller.text,
                        'phone number': phonenumber_controller.text,
                        'email': email_controller.text,
                        'address': address_controller.text,
                        'hostelname': hostelname_controller.text,
                        'Hostel_Address': hosteladdress_controller.text,
                        'Hostel_registration_Number': registrationnumber_controller.text,
                        'Hostel_Register_Date': registerdate_controller.text,
                        'Hostel_Type': selectedHostelTypeText,
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Submitted !'),
                          duration: Duration(seconds: 1),
                        ),
                      );

                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: '${contry_code.text + mobile_number}',
                        verificationCompleted: (PhoneAuthCredential credential) async{
                          await auth.signInWithCredential(credential);
                        },
                        verificationFailed: (FirebaseAuthException e) {

                        },
                        codeSent: (String verificationId, int? resendToken) {
                          Register_Hostel.verify = verificationId;
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
              SizedBox(height: 30,)

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
