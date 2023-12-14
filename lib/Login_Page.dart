
import 'package:flutter/material.dart';
import 'package:hostel_finder/Forget%20Password/Forget_Password.dart';
import 'package:hostel_finder/Navigation_Menu.dart';
import 'package:hostel_finder/Sign_Up.dart';
import 'package:hostel_finder/Visitor_Dashboard.dart';
import 'package:get/get.dart';


class Login_Page extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return loginpage_state();
  }
}

class loginpage_state extends State<Login_Page>{
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  bool isHidePassword = true;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
                Container(
                  margin: EdgeInsets.only(top:10),
                  width: 220,
                  height: 290,
                  child: Stack(
                    children:[Container(
                        width: 220,
                        height: 270,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/logos.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        top:210,
                        child: Container(
                          child:Text(
                            'Sign In',
                            style: TextStyle(
                              color: Color(0xFF14223B),
                              fontSize: 70,
                              fontFamily: 'Hind Jalandhar',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ))],

                  ),
                ),
             SizedBox(height: 40,),
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
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(

                    border: OutlineInputBorder(

                    ),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),

                  ),
                  controller: email_controller,
                  style: TextStyle(color: Colors.black),),
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
                child: TextField(
                  obscureText: isHidePassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.2),
                    suffixIcon: InkWell(
                      onTap: _togglePasswordView,
                        child: Icon(isHidePassword
                            ? Icons.visibility_off
                            : Icons.visibility))
                  ),
                  controller: password_controller,
                  style: TextStyle(color: Colors.black),),
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
              SizedBox(height: 50,),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NavigationMenu()));
                  //Act when the button is pressed
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
              SizedBox(height: 50,),
              Container(
                width: 320,
                height: 35,
                child: Stack(
                  children: [
                    Positioned(
                      left: 5,
                      top: 2,
                      child: SizedBox(
                        width: 221,
                        height: 33,
                        child: Text(
                          'Don’t have an account?',
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
                    ),
                    SizedBox(width:5,),
                    Positioned(
                      left: 190,
                      bottom:0,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Sign_Up()));
                              //Act when the button is pressed
                            },
                            child: Text(
                              'Click Here!',
                              style: TextStyle(
                                color: Color(0xFF121515),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                      ),
                  ],
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

}

