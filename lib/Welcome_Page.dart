
import 'package:flutter/material.dart';
import 'package:hostel_finder/Login_Page.dart';


class Welcome_Page extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return welcomepage_state();
  }
}

class welcomepage_state extends State<Welcome_Page>{

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
        height: size.height,
        width: size.width,
        child: Stack(
            children:[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/second_background.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:20, right: 20),
                child: Center(
                    child: Positioned(
                      bottom: 305,
                      left: 35,
                      child: Container(
                        width: 360,
                        height: 190,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: SizedBox(
                                width: 210.59,
                                height: 32,
                                child: Text(
                                  'Welcome to ',
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
                            ),
                            Positioned(
                              left: 90,
                              top: 26,
                              child: Container(
                                width: 58,
                                height: 45,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/logo.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 138,
                              top: 30,
                              child: SizedBox(
                                width: 245.88,
                                height: 60,
                                child: Text(
                                  'Hostel Finder\n',
                                  style: TextStyle(
                                    color: Color(0xFF14223B),
                                    fontSize: 30,
                                    fontFamily: 'Hind Jalandhar',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 100,
                              child: Container(
                                width: 360,
                                height: 100,
                                child: Text(
                                  'Find the Hostel, list your Hostel in just a simple steps, in your hand. \n \nYou are one step away.',
                                  style: TextStyle(
                                    color: Color(0xFF7A7F9E),
                                    fontSize: 14,
                                    fontFamily: 'Hind',
                                    fontWeight: FontWeight.w400,
                                    height:1.5,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ),
                  ),
              ),
              Positioned(
                  bottom: 150,
                  left: size.width/15,
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login_Page()));
                        //Act when the button is pressed
                      },
                      child: Text(
                        'Get Started                         ',
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

                  ) ),
            ]
        ),

      ),
      
    );

  }

}
//Navigator.push(context, MaterialPageRoute(builder: (context) => detailPage()))