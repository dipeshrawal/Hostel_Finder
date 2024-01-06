
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;

class Add_Signup_Image{
  Future<String> uploadCitizenImagetoStorage(String childname, Uint8List file1) async{
    Reference ref = _storage.ref().child(childname);
    UploadTask uploadTask = ref.putData(file1);
     TaskSnapshot snapshot = await uploadTask;
     String citizen_downloadUrl = await snapshot.ref.getDownloadURL();
     return citizen_downloadUrl;
  }
  Future<String> uploadVatImagetoStorage(String childname, Uint8List file2) async{
    Reference ref = _storage.ref().child(childname);
    UploadTask uploadTask = ref.putData(file2);
    TaskSnapshot snapshot = await uploadTask;
    String citizen_downloadUrl = await snapshot.ref.getDownloadURL();
    return citizen_downloadUrl;
  }

  Future<String> save_warden_signup_images({
    // required String full_name,
    // required String password,
    // required String phone_number,
    // required String email,
    // required String address,
    // required String hostelname,
    // required String Hostel_Address,
    // required String Hostel_registration_Number,
    // required String Hostel_Register_Date,
    // required String Hostel_Type,
    required Uint8List file1,
    required Uint8List file2,
  }) async{
    String reps ="Some error Occured";
    try{
      String citizenimageUrl = await uploadCitizenImagetoStorage("Citizen Image", file1);
      String vatimageUrl = await uploadCitizenImagetoStorage("Vat Image", file2);
      // // Create user with email and password
      // UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      //   email: email,
      //   password: password,
      // );
      // Store additional user data in Firestore
      // await _firestore.collection('warden').doc(userCredential.user?.uid).set({
      //   'full_name': full_name,
      //   'phone_number': phone_number,
      //   'email': email,
      //   'address': address,
      //   'hostelname': hostelname,
      //   'Hostel_Address': Hostel_Address,
      //   'Hostel_registration_Number': Hostel_registration_Number,
      //   'Hostel_Register_Date': Hostel_Register_Date,
      //   'Hostel_Type': Hostel_Type,
      //   'Warden_Citizensgip' : citizenimageUrl,
      //   'Hostel_Pan' : vatimageUrl,
      // });
    } catch (err){
      reps = err.toString();
    }
    return reps;
  }
}