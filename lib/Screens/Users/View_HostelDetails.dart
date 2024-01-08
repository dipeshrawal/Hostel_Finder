import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_finder/modules/HostelWarden.dart';
class View_HostelDetails extends StatefulWidget {
  final HostelWarden hostelWarden;

  const View_HostelDetails({super.key, required this.hostelWarden});


  @override
  State<StatefulWidget> createState() {
    return _View_HostelDetailsState();
  }
}

class _View_HostelDetailsState extends State<View_HostelDetails> {
  @override
  void initState() {
    super.initState();
    hostelData();
  }
  Map<String, dynamic>? hostelMap;
  bool isLoading = false;
  void hostelData() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    setState(() {
      isLoading = true;
    });

    await _firestore
        .collection('hostels')
        .where("hostelwarden_id", isEqualTo: widget.hostelWarden.warden_id)
        .get()
        .then((value) {
      setState(() {
        hostelMap = value.docs[0].data();
        isLoading = false;
      });
      print(hostelMap);
    });
  }




  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/header.png', height: 25, width: 270,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
          child: Column(
            children: [
              Container(
                width: size.width,
                height: 200,
                color: Colors.white,
                child: Image.asset("assets/images/logos.png", height: 90, width: 60,),
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Text(
                    widget.hostelWarden.hostelname,
                    style: TextStyle(
                      color: Color(0xFF1A1E25),
                      fontSize: 20,
                      fontFamily: 'Hind',
                      fontWeight: FontWeight.w700,
                      height: 0.07,
                    ),
                  ),
                  SizedBox(width: 100,),
                  Icon(CupertinoIcons.heart),
                ],
              ),
              SizedBox(height: 20,),
              Row(children: [
                Icon(Icons.star, color: Colors.yellow,),
                SizedBox(width: 5,),
                Text("4.1(66 reviews)"),
                SizedBox(width: 80,),
                Icon(Icons.chair_rounded),
                SizedBox(width: 5,),
                Text("1-4 Seater"),
              ],),
              SizedBox(height: 10,),
              Row(children: [
                Icon(Icons.place_rounded,),
                SizedBox(width: 5,),
                Text(widget.hostelWarden.HostelAddress, maxLines: 1,),

                SizedBox(width:50,),
                Icon(Icons.area_chart_sharp),
                SizedBox(width: 5,),
                Text("874 m2"),
              ],),
              SizedBox(height: 20,),
              Container(
                width: 343,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.60,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFD6D6D6),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: size.width,
                height: 70,
                child: Row(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        child: Icon(Icons.person, size:40,)),
                    SizedBox(width: 30,),

                    Text(widget.hostelWarden.fullName, style: TextStyle(color: Colors.pink),),
                    SizedBox(width: 10,),
                    Text("( Hostel Owner )"),


                    SizedBox(width: 5,),

                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: 343,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.60,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFD6D6D6),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Text(
                    'Home facilities',
                    style: TextStyle(
                      color: Color(0xFF1A1E25),
                      fontSize: 18,
                      fontFamily: 'Hind',
                      fontWeight: FontWeight.w700,
                      height: 0.06,
                      letterSpacing: 0.36,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    height: 150,
                    width: 200,
                    child: Text(hostelMap?['hostel_facilities'], maxLines: 5,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                width: 343,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.60,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFD6D6D6),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(children: [
                Icon(Icons.shopping_cart_outlined,),
                SizedBox(width: 5,),
                Text(
                  'Minimarket',
                  style: TextStyle(
                    color: Color(0xFF222831),
                    fontSize: 16,
                    fontFamily: 'Hind',
                    fontWeight: FontWeight.w700,
                    height: 0.06,
                    letterSpacing: 0.32,
                  ),
                ),
                SizedBox(width: 80,),
                Icon(Icons.local_hospital_outlined),
                SizedBox(width: 5,),
                Text(
                  'Hospital/Medical',
                  style: TextStyle(
                    color: Color(0xFF222831),
                    fontSize: 16,
                    fontFamily: 'Hind',
                    fontWeight: FontWeight.w700,
                    height: 0.06,
                    letterSpacing: 0.32,
                  ),
                ),
              ],),
              SizedBox(height: 10,),
              Row(
                children: [
                  SizedBox(width: 50,),
                  Text("200m"),
                  SizedBox(width: 180,),
                  Text("200m"),
                ],
              ),
              SizedBox(height: 20,),
              Row(children: [
                Icon(Icons.restaurant),
                SizedBox(width: 5,),
                Text(
                  'Public canteen',
                  style: TextStyle(
                    color: Color(0xFF222831),
                    fontSize: 16,
                    fontFamily: 'Hind',
                    fontWeight: FontWeight.w700,
                    height: 0.06,
                    letterSpacing: 0.32,
                  ),
                ),
                SizedBox(width:55,),
                Icon(Icons.train_outlined),
                SizedBox(width: 5,),
                Text(
                  'Bus station',
                  style: TextStyle(
                    color: Color(0xFF222831),
                    fontSize: 16,
                    fontFamily: 'Hind',
                    fontWeight: FontWeight.w700,
                    height: 0.06,
                    letterSpacing: 0.32,
                  ),
                ),
              ],),
              SizedBox(height: 10,),
              Row(
                children: [
                  SizedBox(width: 50,),
                  Text("200m"),
                  SizedBox(width: 180,),
                  Text("200m"),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                width: 343,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.60,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFD6D6D6),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40,),
              Row(
                children: [
                  Text(
                    'About your hostel',
                    style: TextStyle(
                      color: Color(0xFF1A1E25),
                      fontSize: 18,
                      fontFamily: 'Hind',
                      fontWeight: FontWeight.w700,
                      height: 0.06,
                      letterSpacing: 0.36,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                width: size.width,
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 5, top: 5),
                  child: Text(hostelMap?['neighbourhood'], style: TextStyle(
                    fontSize: 18,  height: 1.2,
                  ), maxLines: 6,),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Text(
                    'Institutes and Colleges near Hostel',
                    style: TextStyle(
                      color: Color(0xFF1A1E25),
                      fontSize: 18,
                      fontFamily: 'Hind',
                      fontWeight: FontWeight.w700,
                      height: 0.06,
                      letterSpacing: 0.36,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                width: size.width,
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 5, top: 5),
                  child: Text(hostelMap?['institutes_near_hostel'], style: TextStyle(
                    fontSize: 18,  height: 1.2,
                  ), maxLines: 6,),
                ),
              ),
              SizedBox(height: 60,),

            ],
          ),
        ),
      ),
    );
  }
}
