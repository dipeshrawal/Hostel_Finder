
import 'package:flutter/material.dart';
import 'package:hostel_finder/Forget%20Password/Forget_Password.dart';
import 'package:hostel_finder/Navigation Bar/Navigation_Menu.dart';
import 'package:hostel_finder/Navigation%20Bar/Warden_Navigation_Menu.dart';
import 'package:hostel_finder/Screens/Warden/Register_Hostel.dart';
import 'package:hostel_finder/Signup Auth/Sign_Up.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Warden_Login extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return Warden_Login_state();
  }
}

class Warden_Login_state extends State<Warden_Login>{
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  bool isHidePassword = true;
  FirebaseAuth _auth = FirebaseAuth.instance;

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
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top:10),
                width: 220,
                height: 200,
                child: Stack(
                  children:[Container(
                    width: 220,
                    height: 270,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/warden_login.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  ],

                ),
              ),
              SizedBox(height: 10,),
              Text(
                'Hostel Warden Login',
                style: TextStyle(
                  color: Color(0xFF14223B),
                  fontSize: 30,
                  fontFamily: 'Hind Jalandhar',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                    children:[
                      Text(
                        'YOUR EMAIL',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Karla',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 1.40,
                        ),
                      ),
                    ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12), // Adding padding inside the container
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), // Rounded corners for the container
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      border: InputBorder.none, // Remove the default border
                      hintText: 'Enter your email here', // Adding hint text
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15), // Hint text color
                    ),
                    controller: email_controller,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                    children:[
                      Text(
                        'YOUR PASSWORD',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Karla',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 1.40,
                        ),
                      ),
                    ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12), // Adding padding inside the container
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), // Rounded corners for the container
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: TextField(
                    obscureText: isHidePassword,
                    decoration: InputDecoration(
                      border: InputBorder.none, // Remove the default border
                      hintText: 'Enter your password', // Adding hint text
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15), // Hint text color
                      suffixIcon: InkWell(
                        onTap: _togglePasswordView,
                        child: Icon(isHidePassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                    controller: password_controller,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Forget_Password()));
                        //Act when the button is pressed
                      },
                      child: Text(
                        'Forget Password ?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xD314223B),
                          fontSize: 16,
                          fontFamily: 'Hind',
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.underline,

                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () async{
                  try {
                    //UserCredential userCredential =
                    await _auth.signInWithEmailAndPassword(
                      email: email_controller.text, // Assuming email is used as the username
                      password: password_controller.text,
                    );
                    // If login is successful, navigate to the home page
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Warden_NavigationMenu()),
                    );
                  } catch (e) {
                    // Show an error message
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Login Failed'),
                          content: Text('Invalid email or password'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog box
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  };
                },
                child: Text(
                  'Sign In                                     ',
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
              SizedBox(height: 30,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Text(
                      'Don’t you have register your hostel?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF121515),
                        fontSize: 16,
                        fontFamily: 'Hind',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Register_Hostel()));

                    },
                    child: Text(
                      'Click Here To Register!',
                      style: TextStyle(
                        color: Color(0xFF121515),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
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

}

