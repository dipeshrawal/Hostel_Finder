
import 'package:flutter/material.dart';
import 'package:hostel_finder/Forget%20Password/Change_Password.dart';
import 'package:hostel_finder/Forget%20Password/Forget_Password.dart';
import 'package:pinput/pinput.dart';


class Reset_Password extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return reset_password_state();
  }
}

class reset_password_state extends State<Reset_Password>{

  //final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController reset_OTP_controller = TextEditingController();

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.of(context).size;
    var code="";
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Image.asset('assets/images/header.png', height: 25, width: 270,)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
          child: Column(
            children: [
              Container(
                child: Image.asset('assets/images/OTP.png', height: 250, width: 300,),
              ),
              SizedBox(height: 20,),
              Container(
                child: Row(
                  children: [
                    Text('Reset Password OTP', style: TextStyle(fontSize: 24, color: Colors.purple),),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:5),
                child: Row(
                  children: [
                    Text('Reset OTP for: ',
                      textAlign:TextAlign.start,
                      style: TextStyle(
                        color: Color(0xFF1B1D28),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 1.40,
                      ),
                    ),
                    Text('+977 ${Forget_Password.reset_number}',style: TextStyle(color: Color(0xFF1B1D28),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: 1.40,),)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        'Enter OTP Sent via SMS', style: TextStyle(color: Colors.black.withOpacity(0.5)),
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
                  onChanged: (value){
                    code = value;

                  },
                ),
              ),
              SizedBox(height: 40,),
              TextButton(
                onPressed: () async{
                  Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Change_Password()),
                        );
                  // try{
                  //   // Create a PhoneAuthCredential with the code
                  //   PhoneAuthCredential creds = PhoneAuthProvider.credential(verificationId: Sign_Up.verify, smsCode: code);
                  //   // Sign the user in (or link) with the credential
                  //   //User? user = (await auth.signInWithCredential(creds)).user;
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => Visitor_Dashboard()),
                  //   );
                  //
                  // }
                  // catch (e) {
                  //   // Show an error message
                  //   // showDialog(
                  //   //   context: context,
                  //   //   builder: (BuildContext context) {
                  //   //     return AlertDialog(
                  //   //       title: Text('SMS OTP'),
                  //   //       content: Text('Invalid OTP'),
                  //   //       actions: [
                  //   //         TextButton(
                  //   //           onPressed: () {
                  //   //             Navigator.of(context).pop(); // Close the dialog box
                  //   //           },
                  //   //           child: Text('OK'),
                  //   //         ),
                  //   //       ],
                  //   //     );
                  //   //   },
                  //   // );
                  //   print("wrong otp");
                  // };
                },
                child: Text(
                  ' Recover                                     ',
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

              Center(
                child: TextButton(
                  onPressed: () {
                    //Act when the button is pressed
                  },
                  child: Text('Resend Code'),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
