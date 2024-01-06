import 'package:flutter/material.dart';
import 'package:hostel_finder/Login_Page.dart';

class AboutUsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AboutUsPageState();
  }
}

class AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
                'About Us',
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
                'The "Hostel Finder" app is designed to revolutionize hostel management, simplifying the experience for both wardens and students. With a focus on ease of use and comprehensive functionality, the app aims to address the challenges faced by traditional hostel management systems. \n\nHostel Finder allows you to discover hostels effortlessly and list your own hostel with just a few simple steps. You are one step away from a seamless hostel experience.\n\nAs users navigate through the welcoming content, they are presented with a concise yet compelling description of the apps purpose. The emphasis is on simplicity and convenience, positioning "Hostel Finder" as a one-stop solution for hostel-related needs. The call-to-action button, labeled "Get Started," serves as a gateway to the apps functionalities, seamlessly transitioning users to the login page. Through this introductory screen, the app sets the tone for a user-centric and efficient hostel management experience, aligning with its overarching goal of making hostel life smoother for both wardens and students.',
                style: TextStyle(
                  color: Color(0xFF7A7F9E),
                  fontSize: 14,
                  fontFamily: 'Hind',
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
