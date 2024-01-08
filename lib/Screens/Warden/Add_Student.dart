
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hostel_finder/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Add_Student extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return Add_Student_state();
  }
}
class Add_Student_state extends State<Add_Student>{
  Uint8List? _citizenship_image;

  void selectImageofCitizenship() async{
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _citizenship_image = img;
    });
  }

  TextEditingController fullname_controller = TextEditingController();
  TextEditingController phonenumber_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController address_controller = TextEditingController();
  TextEditingController guardianname_controller = TextEditingController();
  TextEditingController quardiannumber_controller = TextEditingController();
  TextEditingController checkindate_controller = TextEditingController();
  TextEditingController roomtype_controller = TextEditingController();
  TextEditingController institutename_controller = TextEditingController();
  TextEditingController level_controller = TextEditingController();
  TextEditingController occupation_controller = TextEditingController();

  String selectedroomTypeText= "";
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseAuth auth = FirebaseAuth.instance;

  // Validation flag for each field
  bool _isEmailValid = true;
  bool _isPasswordValid = true;
  bool _isContactValid = true;
  var mobile_number = "";

  var chooseValue;
  Map roomTypes = {
    "1": "Single Sitter",
    "2": "Double Sitter",
    "3": "Three Sitter",
    "4": "Four Sitter",
  };


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
          padding: const EdgeInsets.only(top: 25,left: 15, right: 15),
          child: Column(
            children: [
              Text(
                'Add New Student',
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
                '(For Student Only)',
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
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Guardian Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.3),
                ),
                controller: guardianname_controller,
                style: TextStyle(color: Colors.black),

              ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Guardian Number',
                  prefixIcon: Icon(Icons.phone),
                  errorText: _isContactValid ? null : 'Enter a valid contact number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.3),
                ),
                controller: quardiannumber_controller,
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
                  labelText: 'Checkin Date',
                  prefixIcon: Icon(Icons.date_range_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.3),
                  hintText: 'Full Name',
                ),
                controller: checkindate_controller,
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
                      checkindate_controller.text = DateFormat('yyyy-MM-dd').format(pickeddate);
                    });
                  }
                },

              ),
              SizedBox(height: 20,),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: 'Room Type',
                  prefixIcon: Icon(Icons.location_city_sharp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.3),
                ),
                items: [
                  DropdownMenuItem(child: Text("Single Sitter"), value: "1",),
                  DropdownMenuItem(child: Text("Double Sitter"), value: "2",),
                  DropdownMenuItem(child: Text("Three Sitter"), value: "3",),
                  DropdownMenuItem(child: Text("four Sitter"), value: "4",),
                ],
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  setState(() {
                    chooseValue = value!;
                    selectedroomTypeText = roomTypes[value];
                  });
                },
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
                              'Upload Citizenship ',
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
                    'Others Details',
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
                  labelText: 'Institute Name',
                  prefixIcon: Icon(Icons.location_city_sharp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.3),
                ),
                controller: institutename_controller,
                style: TextStyle(color: Colors.black),

              ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Level',
                  prefixIcon: Icon(Icons.location_city_sharp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.3),
                ),
                controller: level_controller,
                style: TextStyle(color: Colors.black),

              ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Occupation',
                  prefixIcon: Icon(Icons.location_city_sharp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.3),
                ),
                controller: occupation_controller,
                style: TextStyle(color: Colors.black),

              ),
              SizedBox(height: 50,),
              ElevatedButton(
                onPressed: () async {
                  // Check if all fields are valid before attempting registration
                  if (
                  _isEmailValid &&
                      _isContactValid ) {
                    try {
                      // Create user with email and password
                      // UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
                      //   email: email_controller.text,
                      //   password: email_controller.text,
                      // );
                      // Store additional user data in Firestore
                      await _firestore.collection('student').add({
                        'full_name': fullname_controller.text,
                        'phone number': phonenumber_controller.text,
                        'email': email_controller.text,
                        'address': address_controller.text,
                        'Guardain_name': guardianname_controller.text,
                        'Guardian_Contactnumber': quardiannumber_controller.text,
                        'Checkin_Date': checkindate_controller.text,
                        'Room_Type': selectedroomTypeText,
                        'Institute_name': institutename_controller.text,
                        'Level': level_controller.text,
                        'Occupation': occupation_controller.text,
                        'hostelwarden_id': _auth.currentUser?.uid,
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Submitted !'),
                          duration: Duration(seconds: 1),
                        ),
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
