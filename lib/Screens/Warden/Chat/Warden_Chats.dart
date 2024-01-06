
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostel_finder/Screens/Warden/Chat/Chats.dart';
import 'package:hostel_finder/Screens/Warden/Chat/Warden_Chatroom.dart';

class Warden_Chats extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return Warden_Chats_state();
  }
}
class Warden_Chats_state extends State<Warden_Chats> with WidgetsBindingObserver{

  Map<String, dynamic>? userMap;
  bool isLoading = false;
  final TextEditingController _search_controller = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void setStatus(String status) async {
    await _firestore.collection('warden').doc(_auth.currentUser!.uid).update({
      "status": status,
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    setStatus("Online");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // online
      setStatus("Online");
    } else {
      // offline
      setStatus("Offline");
    }
  }

  // String chatRoomId(String user1, String user2) {
  //   if (user1[0].toLowerCase().codeUnits[0] >
  //       user2.toLowerCase().codeUnits[0]) {
  //     return "$user1$user2";
  //   } else {
  //     return "$user2$user1";
  //   }
  // }

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    setState(() {
      isLoading = true;
    });

    await _firestore
        .collection('users')
        .where("full_name", isEqualTo: _search_controller.text)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        isLoading = false;
      });
      print(userMap);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Image.asset('assets/images/header.png', height: 25, width: 270,)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
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
                  hintText: 'Search via Person name',
                ),
                controller: _search_controller,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 60,),
          userMap != null
              ? ListTile(
            onTap: () {
              String roomId = Chats.chatRoomId(
                  _auth.currentUser!.uid ,
                  userMap!['uid']);

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => Warden_ChatRoom(
                    chatRoomId: roomId,
                    userMap: userMap!,
                  ),
                ),
              );
            },
            leading: Icon(Icons.account_box, color: Colors.black),
            title: Text(
              userMap!['full_name'],
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(userMap!['email']),
            trailing: Icon(Icons.chat, color: Colors.black),
          )
              : Container(),
        ],
      ),
    );

  }


}
