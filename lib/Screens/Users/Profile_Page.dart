
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostel_finder/Login_Page.dart';
import 'package:hostel_finder/Screens/Users/Profile/Change_Password_Profile.dart';
import 'package:hostel_finder/Screens/Users/Profile/Edit_Profile.dart';
import 'package:hostel_finder/utils.dart';
import 'package:image_picker/image_picker.dart';


class Profile_Page extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return Profile_Page_state();
  }
}
class Profile_Page_state extends State<Profile_Page>{
  Uint8List? _image;

  void selectImage() async{
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Image.asset('assets/images/header.png', height: 25, width: 270,)),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15,top: 20, right: 10),
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    _image != null ?
                        Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4,color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: MemoryImage(_image!),

                        ),
                      ),
                    )
                        :
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4,color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/profile_image.png'),

                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          ),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          onPressed: selectImage,
                          icon:Icon(Icons.edit),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Center(
                child: Text(
                  'Bimal Shrestha',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF1A1E25),
                    fontSize: 24,
                    fontFamily: 'Hind',
                    fontWeight: FontWeight.w700,
                    height: 0.04,
                    letterSpacing: 0.31,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Center(
                child: Text(
                  'bimalstha291@gmail.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF7D7F88),
                    fontSize: 16,
                    fontFamily: 'Hind',
                    fontWeight: FontWeight.w400,
                    height: 0.06,
                    letterSpacing: 0.32,
                  ),
                ),
              ),
              SizedBox(height: 60,),
              Container(
                width: 340,
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
              SizedBox(height: 40,),
              ListTile(
                leading: Container(
                  height:40,
                  width:40,
                  decoration: ShapeDecoration(
                    color: Color(0xFFFDFDFD),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.50, color: Color(0xFFE3E3E7)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x26454545),
                        blurRadius: 16,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Icon(Icons.person,size: 30),),
                title: Text(
                  'Edit Username',
                  style: TextStyle(
                    color: Color(0xFF1A1E25),
                    fontSize: 16,
                    fontFamily: 'Hind',
                    fontWeight: FontWeight.w500,
                    height: 0.06,
                    letterSpacing: 0.32,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Edit_Profile()));
                },
              ),
              ListTile(
                leading: Container(
                  height:40,
                  width:40,
                  decoration: ShapeDecoration(
                    color: Color(0xFFFDFDFD),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.50, color: Color(0xFFE3E3E7)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x26454545),
                        blurRadius: 16,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Icon(Icons.key_outlined,size: 30),),
                title: Text(
                  'Change Password',
                  style: TextStyle(
                    color: Color(0xFF1A1E25),
                    fontSize: 16,
                    fontFamily: 'Hind',
                    fontWeight: FontWeight.w500,
                    height: 0.06,
                    letterSpacing: 0.32,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Change_Password_Profile()));
                },
              ),
              SizedBox(height: 40,),
              Container(
                width: 340,
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
              SizedBox(height: 40,),
              TextButton(
                onPressed: (){
                  FirebaseAuth.instance.signOut().then((value){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Sign Out'),
                          content: Text('Do you want to Sign Out ?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog box
                              },
                              child: Text('No'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Login_Page())); // Close the dialog box
                              },
                              child: Text('Yes'),
                            ),

                          ],
                        );
                      },
                    );
                  });
                },
                child: Text(
                  ' Sign Out ',
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
    );

  }

}
