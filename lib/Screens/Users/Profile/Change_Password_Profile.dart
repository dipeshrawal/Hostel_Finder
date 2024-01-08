import 'package:flutter/material.dart';
import 'package:hostel_finder/Login_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Change_Password_Profile extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return Change_Password_Profile_State();
  }
}

class Change_Password_Profile_State extends State<Change_Password_Profile>{
  TextEditingController password_controller = TextEditingController();
  TextEditingController confirm_password_controller = TextEditingController();
  TextEditingController old_password_controller = TextEditingController();
  bool isHidePassword = true;
  bool isHideConfirmPassword = true;
  bool isHideOldPassword = true;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isPasswordValid = true;

  @override
  void initState(){
    super.initState();
  }

  Future<void> changePassword() async {
    if (old_password_controller.text.isEmpty ||
        password_controller.text.isEmpty ||
        confirm_password_controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all the fields.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    try {
      User? user = _auth.currentUser;
      if (user != null) {
        AuthCredential credential = EmailAuthProvider.credential(
          email: user.email!,
          password: old_password_controller.text,
        );

        await user.reauthenticateWithCredential(credential);

        if (password_controller.text != confirm_password_controller.text) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('New password and confirm password do not match.'),
              duration: Duration(seconds: 2),
            ),
          );
          return;
        }

        await user.updatePassword(password_controller.text);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Password changed successfully.'),
            duration: Duration(seconds: 2),
          ),
        );

        old_password_controller.clear();
        password_controller.clear();
        confirm_password_controller.clear();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login_Page()),
        );
      }
    } catch (e) {
      if (e is FirebaseAuthException && e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid old password.'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to change password. Please try again.'),
            duration: Duration(seconds: 2),
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
                    'Change Your Hostel Finder Password',
                    style: TextStyle(
                      color: Color(0xFF14223B),
                      fontSize: 15,
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
                  obscureText: isHideOldPassword,
                  decoration: InputDecoration(
                    border: InputBorder.none, // Remove the default border
                    hintText: 'Old password', // Adding hint text
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 15), // Hint text color
                    suffixIcon: InkWell(
                      onTap: _toggleOldPasswordView,
                      child: Icon(isHideOldPassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                  controller: old_password_controller,
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
                  changePassword();//then((_) {
                  //Navigator.pushReplacement(
                  //context,
                  //MaterialPageRoute(builder: (context) => Login_Page()),
                  //);
                  //});
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

  }void _toggleOldPasswordView(){
    setState(() {
      if(isHideOldPassword== true){
        isHideOldPassword = false;
      }else{
        isHideOldPassword = true;
      }
    });
  }
}