import 'package:flutter/material.dart';
import 'package:hostel_finder/Login_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Change_Password extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Change_Password_State();
  }
}

class Change_Password_State extends State<Change_Password> {
  TextEditingController password_controller = TextEditingController();
  TextEditingController confirm_password_controller = TextEditingController();
  bool isHidePassword = true;
  bool isHideConfirmPassword = true;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isPasswordValid = true;

  @override
  void initState() {
    super.initState();
  }

  Future<void> changePassword() async {
    if (password_controller.text.isEmpty ||
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

        await user.updatePassword(password_controller.text);

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

        password_controller.clear();
        confirm_password_controller.clear();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login_Page()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to change password. Please try again.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/header.png',
          height: 25,
          width: 270,
        ),
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
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: TextField(
                  obscureText: isHidePassword,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'New password',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
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
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: TextField(
                  obscureText: isHideConfirmPassword,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Confirm password',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                    suffixIcon: InkWell(
                      onTap: _toggleConfirmPasswordView,
                      child: Icon(isHideConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
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
                onPressed: changePassword,
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

  void _togglePasswordView() {
    setState(() {
      isHidePassword = !isHidePassword;
    });
  }

  void _toggleConfirmPasswordView() {
    setState(() {
      isHideConfirmPassword = !isHideConfirmPassword;
    });
  }
}