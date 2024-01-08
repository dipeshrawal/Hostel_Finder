
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hostel_finder/Hostel_data/data.dart';
import 'package:hostel_finder/Navigation Bar/Navigation_Slider.dart';



class Visitor_Dashboard extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return Visitor_Dashboard_state();
  }
}

class Visitor_Dashboard_state extends State<Visitor_Dashboard>{
  TextEditingController search_controller = TextEditingController();
  bool isLoading = false;
  Map<String, dynamic>? hostelMap;
  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    setState(() {
      isLoading = true;
    });
    await _firestore
        .collection('warden')
        .where("Hostel_Address", isEqualTo: search_controller.text)
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
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Navigation_Slider(),
      appBar: AppBar(
        title: Image.asset('assets/images/header.png', height: 25, width: 270,),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 15),
            child: Column(
              children: [
                Container(
                  height: 50,
                    child: TextField(
                      onEditingComplete:onSearch,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.3),
                        hintText: 'Search via hostel location',

                      ),
                      controller: search_controller,
                      style: TextStyle(color: Colors.black),
                    ),
                ),
                SizedBox(height: 20,),
                Center(
                  child: Text('Hostel in Nepal',
                    style: TextStyle(
                      color: Color(0xFF373C3D),
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0.11,
                      letterSpacing: 0.20,)),
                ),

                SizedBox(height: 20,),
                Container(
                  height: size.height/2,
                  width: size.width,
                  child: hostelMap != null
                      ?GestureDetector(
                    onTap: (){},
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                              ),
                              child: Image.asset(
                                "assets/images/warden_login.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    hostelMap!['hostelname'],
                                    style: TextStyle(
                                      color: Color(0xFF1A1E25),
                                      fontSize: 20,
                                      fontFamily: 'Hind',
                                      fontWeight: FontWeight.w400,
                                      height: 0.08,
                                    ),
                                    maxLines: 2,
                                  ),
                                  const SizedBox(height:20),
                                  Row(
                                    children: [
                                      Icon(Icons.place, size: 13),
                                      SizedBox(width: 2,),
                                      Text(hostelMap!['Hostel_Address'],
                                        style: TextStyle(
                                          color: Color(0xFF7D7F88),
                                          fontSize: 13,
                                          fontFamily: 'Hind',
                                          fontWeight: FontWeight.w400,
                                          height: 0.10,
                                          letterSpacing: 0.13,
                                        ),),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Icon(Icons.chair_rounded, size: 13),
                                      SizedBox(width: 2,),
                                      Text("1-Seater", style: TextStyle(fontSize: 13, color: Colors.black),),
                                      SizedBox(width: 15,),
                                      Icon(Icons.chair_rounded, size: 13),
                                      SizedBox(width: 2,),
                                      Text("2-Seater", style: TextStyle(fontSize: 13, color: Colors.black),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.chair_rounded, size: 13),
                                      SizedBox(width: 2,),
                                      Text("3-Seater",style: TextStyle(fontSize: 13, color: Colors.black),),
                                      SizedBox(width: 15,),
                                      Icon(Icons.chair_rounded, size: 13),
                                      SizedBox(width: 2,),
                                      Text("4-Seater",style: TextStyle(fontSize: 13, color: Colors.black),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Warden : ",style: TextStyle(fontSize: 13, color: Colors.black),),
                                      SizedBox(width: 5,),
                                      Text(hostelMap!['full_name'],style: TextStyle(fontSize: 13, color: Colors.pink),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ): const data(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
