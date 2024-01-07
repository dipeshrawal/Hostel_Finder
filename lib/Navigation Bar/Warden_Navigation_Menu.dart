import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hostel_finder/Screens/Warden/Chat/Warden_Chats.dart';
import 'package:hostel_finder/Screens/Warden/Warden_Dashboard.dart';
import 'package:hostel_finder/Screens/Warden/Warden_Profile_Page.dart';
import 'package:icons_plus/icons_plus.dart';

class Warden_NavigationMenu extends StatelessWidget {
  const Warden_NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(Warden_NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
            () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.message), label: 'Chat'),
            NavigationDestination(icon: Icon(Iconsax.edit), label: 'Edit'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class Warden_NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [const Warden_Dashboard(), Warden_Chats(), Container(color: Colors.yellow), Warden_Profile_Page()];
}
