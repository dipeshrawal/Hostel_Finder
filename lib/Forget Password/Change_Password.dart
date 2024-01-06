
import 'package:flutter/material.dart';
import 'package:hostel_finder/Login_Page.dart';

class Change_Password extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return Change_Password_State();
  }
}

class Change_Password_State extends State<Change_Password>{
  TextEditingController password_controller = TextEditingController();
  TextEditingController confirm_password_controller = TextEditingController();
  bool isHidePassword = true;
  bool isHideConfirmPassword = true;

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
                    'Change Password',
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
                    'Change Your Hostel Finder Pssword',
                    style: TextStyle(
                      color: Color(0xFF14223B),
                      fontSize: 20,
                    ),
                    maxLines: 1,
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
                    obscureText: isHidePassword,
                    decoration: InputDecoration(
                      border: InputBorder.none, // Remove the default border
                      hintText: 'New password', // Adding hint text
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15), // Hint text color
                      suffixIcon: InkWell(
                        onTap: _togglePasswordView,
                        child: Icon(isHidePassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                    controller: password_controller,
                    onChanged: (value) {
                      setState(() {
                        _isPasswordValid = value.length >= 8;
                      });
                    },
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12), // Adding padding inside the container
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), // Rounded corners for the container
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: TextField(
                  obscureText: isHideConfirmPassword,
                  decoration: InputDecoration(
                    border: InputBorder.none, // Remove the default border
                    hintText: 'Confirm password', // Adding hint text
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 15), // Hint text color
                    suffixIcon: InkWell(
                                    onTap: _toggleConfirmPasswordView,
                                    child: Icon(isHideConfirmPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility))
                  ),
                  controller: confirm_password_controller,
                  onChanged: (value) {
                    setState(() {
                      _isPasswordValid = value.length >= 8;
                    });
                  },
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 70,),
              TextButton(
                onPressed: () {
                  //Act when the button is pressed
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Login_Page()),
                  );
                },
                child: Text(
                  ' Change Password                 ',
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

  void _togglePasswordView(){

    setState(() {
      if(isHidePassword == true){
        isHidePassword = false;
      }else{
        isHidePassword = true;
      }

    });
  }

  void _toggleConfirmPasswordView(){
    setState(() {
      if(isHideConfirmPassword== true){
        isHideConfirmPassword = false;
      }else{
        isHideConfirmPassword = true;
      }
    });
  }




}
