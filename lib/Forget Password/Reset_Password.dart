import 'package:flutter/material.dart';
import 'package:hostel_finder/Forget%20Password/Change_Password.dart';
import 'package:hostel_finder/Forget%20Password/Forget_Password.dart';
import 'package:pinput/pinput.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPassword extends StatefulWidget {
  String getnumber;

  ResetPassword({required this.getnumber});

  @override
  State<StatefulWidget> createState() {
    return ResetPasswordState();
  }
}

class ResetPasswordState extends State<ResetPassword> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController resetOTPController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var code = "";

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Image.asset('assets/images/header.png', height: 25, width: 270)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
          child: Column(
            children: [
              Container(
                child: Image.asset('assets/images/OTP.png', height: 250, width: 300),
              ),
              SizedBox(height: 20),
              Container(
                child: Row(
                  children: [
                    Text(
                      'Reset Password OTP',
                      style: TextStyle(fontSize: 24, color: Colors.purple),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    Text(
                      'Reset OTP for: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color(0xFF1B1D28),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 1.40,
                      ),
                    ),
                    Text(
                      '+977 ${widget.getnumber}',
                      style: TextStyle(
                        color: Color(0xFF1B1D28),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 1.40,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        'Enter OTP Sent via SMS',
                        style: TextStyle(color: Colors.black.withOpacity(0.5)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Pinput(
                  length: 6,
                  showCursor: true,
                  onChanged: (value) {
                    code = value;
                  },
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () async {
                  try {
                    // Create a PhoneAuthCredential with the code
                    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: Forget_Password.reset_number, smsCode: code);
                    // Sign the user in (or link) with the credential
                    FirebaseAuth.instance.signInWithCredential(credential).then((value){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Change_Password()));
                    });
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Change_Password()),
                    );
                  } catch (e) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('SMS OTP'),
                          content: Text('Invalid OTP'),
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
                    print("wrong otp");
                  }
                },
                child: Text(
                  ' Recover ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontFamily: 'Hind',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF14223B),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    // Action when the button is pressed
                  },
                  child: Text('Resend Code'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
