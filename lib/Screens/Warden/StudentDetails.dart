import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hostel_finder/utils.dart';

class StudentDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StudentDetailsState();
  }
}

class StudentDetailsState extends State<StudentDetails> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/header.png', height: 25, width: 270,),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('student').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No data available'));
          }
          List<DataRow> rows = [];
          snapshot.data!.docs.forEach((doc) {
            rows.add(DataRow(
              cells: [
                DataCell(Text(doc['full_name'] ?? '')),
                DataCell(Text(doc['phone number'] ?? '')),
                DataCell(Text(doc['Checkin_Date'] ?? '')),
                DataCell(Text(doc['Guardain_name'] ?? '')),
                DataCell(Text(doc['Guardian_Contactnumber'] ?? '')),
                DataCell(Text(doc['Institute_name'] ?? '')),
                DataCell(Text(doc['Occupation'] ?? '')),
                DataCell(Text(doc['Room_Type'] ?? '')),
                DataCell(Text(doc['address'] ?? '')),
                DataCell(Text(doc['email'] ?? '')),
                // Add more DataCells for other fields
              ],
            ));
          });

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(label: Text('Full Name')),
                DataColumn(label: Text('Phone Number')),
                DataColumn(label: Text('Checkin_Date')),
                DataColumn(label: Text('Guardain_name')),
                DataColumn(label: Text('Guardian_Contactnumber')),
                DataColumn(label: Text('Institute_name')),
                DataColumn(label: Text('Occupation')),
                DataColumn(label: Text('Room_Type')),
                DataColumn(label: Text('address')),
                DataColumn(label: Text('email')),
                // Add more DataColumns for other fields
              ],
              rows: rows,
            ),
          );
        },
      ),
    );
  }
}