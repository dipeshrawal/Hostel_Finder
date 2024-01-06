import 'package:flutter/material.dart';

class HelpAndSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HelpAndSupportBody(),
    );
  }
}

class HelpAndSupportBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/second_background.png'),
            fit: BoxFit.fill,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 210.59,
              height: 32,
              child: Text(
                'Help and Support',
                style: TextStyle(
                  color: Color(0xFF21205B),
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'ABeeZee',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            SizedBox(
              width: 245.88,
              height: 60,
              child: Row(
                children: [
                  Text(
                    'Hostel Finder\n',
                    style: TextStyle(
                      color: Color(0xFF14223B),
                      fontSize: 30,
                      fontFamily: 'Hind Jalandhar',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  Container(
                    width: 58,
                    height: 45,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 360,
              height: 500,
              child: Text(
                'Welcome to Hostel Finder Help and Support! If you have any questions or issues related to the app, feel free to contact our support team. We are here to assist you!\n\nContact Information:\nEmail: support@hostelfinder.com\nPhone: +977 9868728192\n\nFor technical issues, a robust troubleshooting segment is included, offering users guidance on resolving common problems. The "User Feedback" section encourages users to share their thoughts, report issues, or submit general feedback directly through the app, fostering a collaborative user-community relationship. The page also outlines the expected response time through a clear Service Level Agreement (SLA), managing user expectations regarding query resolutions.\n\nTo enhance accessibility, a prominently placed "Contact Support" button allows users swift access to the support channels.  ',
                style: TextStyle(
                  color: Color(0xFF7A7F9E),
                  fontSize: 14,
                  fontFamily: 'Hind',
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
            ),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HelpAndSupportPage(),
  ));
}
