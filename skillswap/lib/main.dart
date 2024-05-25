import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillswap/utils/helpers/network_manager.dart';
import 'app.dart';

void main() {
  //add widget binding
  //init local storage
  //await native splash
  //initialize firebase
  //initialize authentication
  Get.put(NetworkManager());
  runApp(const MyApp());
}
