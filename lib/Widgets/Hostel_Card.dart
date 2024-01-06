import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostel_finder/modules/HostelWarden.dart';

class Hostel_Card extends StatefulWidget {
  final HostelWarden hsward;
  const Hostel_Card({super.key, required this.hsward});

  @override
  State<Hostel_Card> createState() => _Hostel_CardState();
}

class _Hostel_CardState extends State<Hostel_Card> {

  @override
  // for authentication
  FirebaseAuth auth = FirebaseAuth.instance;

  // for accessing cloud firestore database
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Widget build(BuildContext context) {
    return GestureDetector(
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
                      widget.hsward.hostelname,
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
                        Text(widget.hsward.HostelAddress,
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
                        Text(widget.hsward.fullName,style: TextStyle(fontSize: 13, color: Colors.pink),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


