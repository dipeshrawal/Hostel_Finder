import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostel_finder/Login_Page.dart';
import 'package:hostel_finder/Signup Auth/Sign_Up.dart';

class Navigation_Slider extends StatelessWidget {
  const Navigation_Slider({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          SizedBox(height: 30,),
          // ListTile(
          //   leading: Container(
          //       height:40,
          //       width:40,
          //     decoration: ShapeDecoration(
          //       color: Color(0xFFFDFDFD),
          //       shape: RoundedRectangleBorder(
          //         side: BorderSide(width: 0.50, color: Color(0xFFE3E3E7)),
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //       shadows: [
          //         BoxShadow(
          //           color: Color(0x26454545),
          //           blurRadius: 16,
          //           offset: Offset(0, 4),
          //           spreadRadius: 0,
          //         )
          //       ],
          //     ),
          //       child: Icon(Icons.person,size: 30),),
          //   title: Text(
          //     'Student Login',
          //     style: TextStyle(
          //       color: Color(0xFF1A1E25),
          //       fontSize: 16,
          //       fontFamily: 'Hind',
          //       fontWeight: FontWeight.w500,
          //       height: 0.06,
          //       letterSpacing: 0.32,
          //     ),
          //   ),
          //   onTap: () => Sign_Up(),
          // ),
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
              'Hostel Warden Login ',
              style: TextStyle(
                color: Color(0xFF1A1E25),
                fontSize: 16,
                fontFamily: 'Hind',
                fontWeight: FontWeight.w500,
                height: 0.06,
                letterSpacing: 0.32,
              ),
            ),
            onTap: () => Sign_Up(),
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
              child: Icon(Icons.location_city_outlined,size: 30),),
            title: Text(
              'Register Your Hostel',
              style: TextStyle(
                color: Color(0xFF1A1E25),
                fontSize: 16,
                fontFamily: 'Hind',
                fontWeight: FontWeight.w500,
                height: 0.06,
                letterSpacing: 0.32,
              ),
            ),
            onTap: () => Sign_Up(),
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
              child: Icon(Icons.support_agent,size: 30),),
            title: Text(
              'Help & Support',
              style: TextStyle(
                color: Color(0xFF1A1E25),
                fontSize: 16,
                fontFamily: 'Hind',
                fontWeight: FontWeight.w500,
                height: 0.06,
                letterSpacing: 0.32,
              ),
            ),
            onTap: () => Sign_Up(),
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
              child: Icon(Icons.feedback,size: 30),),
            title: Text(
              'Feedback',
              style: TextStyle(
                color: Color(0xFF1A1E25),
                fontSize: 16,
                fontFamily: 'Hind',
                fontWeight: FontWeight.w500,
                height: 0.06,
                letterSpacing: 0.32,
              ),
            ),
            onTap: () => Sign_Up(),
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
              child: Icon(Icons.question_mark_outlined,size: 30),),
            title: Text(
              'About Us',
              style: TextStyle(
                color: Color(0xFF1A1E25),
                fontSize: 16,
                fontFamily: 'Hind',
                fontWeight: FontWeight.w500,
                height: 0.06,
                letterSpacing: 0.32,
              ),
            ),
            onTap: () => Sign_Up(),
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
              child: Icon(Icons.logout_outlined,size: 30),),
            title: Text(
              'Sign Out',
              style: TextStyle(
                color: Color(0xFF1A1E25),
                fontSize: 16,
                fontFamily: 'Hind',
                fontWeight: FontWeight.w500,
                height: 0.06,
                letterSpacing: 0.32,
              ),
            ),
            onTap: () {
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
          ),

        ],
      ),
    );
  }
}
