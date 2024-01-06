
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostel_finder/Widgets/Hostel_Card.dart';
import 'package:hostel_finder/modules/HostelWarden.dart';

class data extends StatefulWidget {
  const data({super.key});
  @override
  State<data> createState() => _dataState();
}

class _dataState extends State<data> {
  @override

 List<HostelWarden> list = [];

  // for accessing cloud firestore database
  static FirebaseFirestore firestore = FirebaseFirestore.instance;


  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: firestore.collection('warden').snapshots(),
        builder: (context, snapshot) {
              final data = snapshot.data?.docs;
              list = data?.map((e) => HostelWarden.fromJson(e.data())).toList() ?? [];

            return ListView.builder(
                itemCount: list.length,
                padding: EdgeInsets.only(top: 20),
                physics: const  BouncingScrollPhysics(),
                itemBuilder:(context, index){
                  return Hostel_Card(hsward: list[index],);
                } );
        },
      ),
    );
  }
}
