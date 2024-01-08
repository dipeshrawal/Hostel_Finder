import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddHostelDetailsPage extends StatefulWidget {
  const AddHostelDetailsPage({super.key});

  @override
  State<AddHostelDetailsPage> createState() => AddHostelDetailsPageState();
}

class AddHostelDetailsPageState extends State<AddHostelDetailsPage> {
  TextEditingController hostelFacilitiesController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController neighbourhoodController = TextEditingController();
  TextEditingController institutesController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Validation flag for each field
  bool _isLocationValid = true;
  final bool _isNeighbourhoodValid = true;
  List<String> selectedPhotos = [];

  Future<void> _pickImages() async {
    List<XFile>? images = await ImagePicker().pickMultiImage();
    if (images.isNotEmpty) {
      setState(() {
        selectedPhotos.addAll(images.map((image) => image.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/header.png',
          height: 25,
          width: 270,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  width: 210.59,
                  height: 32,
                  child: Text(
                    'Add Hostel Details',
                    style: TextStyle(
                      color: Color(0xFF21205B),
                      fontSize: 25,
                      fontFamily: 'ABeeZee',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              // Photo Selector
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: selectedPhotos.length + 1,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  if (index == selectedPhotos.length) {
                    // Add Photo Button
                    return InkWell(
                      onTap: _pickImages,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Icon(Icons.add),
                      ),
                    );
                  } else {
                    // Display Selected Photo
                    return Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: FileImage(File(selectedPhotos[index])),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 4,
                          right: 4,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedPhotos.removeAt(index);
                              });
                            },
                            child: Icon(
                              Icons.cancel,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),

              SizedBox(
                height: 20,
              ),

              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    // Check if all fields are valid before submitting hostel details
                    if (_isLocationValid && _isNeighbourhoodValid) {
                      try {
                        // Save hostel details to Firestore
                        await FirebaseService().addHostelDetails(
                          hostelFacilities: hostelFacilitiesController.text,
                          location: locationController.text,
                          neighbourhood: neighbourhoodController.text,
                          institutes: institutesController.text,
                          imageUrls: selectedPhotos,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Hostel Details Submitted!'),
                            duration: Duration(seconds: 1),
                          ),
                        );

                        // ... Remaining logic remains unchanged
                      } catch (e) {
                        // Show error message for incomplete or invalid fields
                        print('Error : $e');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                            Text('Please fill in all fields correctly.'),
                          ),
                        );
                      }
                    } else {
                      // Handle feedback submission errors
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Hostel details submission failed. Please try again.'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF14223B),
                  ),
                  child: Text(
                    'Submit Hostel Details                          ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Hind',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              // Text Fields for Hostel Details
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 15),
                child: Container(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.hotel),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      hintText: 'Hostel Facilities',
                    ),
                    controller: hostelFacilitiesController,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 5, right: 15),
                child: Container(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on),
                      errorText:
                      _isLocationValid ? null : 'Enter a valid location',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      hintText: 'Location',
                    ),
                    controller: locationController,
                    onChanged: (value) {
                      setState(() {
                        _isLocationValid = value.isNotEmpty;
                      });
                    },
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 5, right: 15),
                child: Container(
                  child: TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: "About Location's Neighbourhood",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                    ),
                    controller: neighbourhoodController,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 5, right: 15),
                child: Container(
                  child: TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: "Institutes and Colleges near Hostel",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                    ),
                    controller: institutesController,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    // Check if all fields are valid before submitting hostel details
                    if (_isLocationValid && _isNeighbourhoodValid) {
                      try {
                        // Save hostel details to Firestore
                        await FirebaseService().addHostelDetails(
                          hostelFacilities: hostelFacilitiesController.text,
                          location: locationController.text,
                          neighbourhood: neighbourhoodController.text,
                          institutes: institutesController.text,
                          imageUrls: selectedPhotos,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Hostel Details Submitted!'),
                            duration: Duration(seconds: 1),
                          ),
                        );

                        // ... Remaining logic remains unchanged
                      } catch (e) {
                        // Show error message for incomplete or invalid fields
                        print('Error : $e');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                            Text('Please fill in all fields correctly.'),
                          ),
                        );
                      }
                    } else {
                      // Handle feedback submission errors
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Hostel details submission failed. Please try again.'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF14223B),
                  ),
                  child: Text(
                    'Submit Hostel Details                          ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Hind',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addHostelDetails({
    required String hostelFacilities,
    required String location,
    required String neighbourhood,
    required String institutes,
    required List<String> imageUrls,
  }) async {
    try {
      await _firestore.collection('hostels').add({
        'hostel_facilities': hostelFacilities,
        'location': location,
        'neighbourhood': neighbourhood,
        'institutes_near_hostel': institutes,
        'image_urls': imageUrls,
        'hostelwarden_id': _auth.currentUser?.uid,
      });
    } catch (e) {
      print('Error adding hostel details: $e');
      rethrow;
    }
  }
}
