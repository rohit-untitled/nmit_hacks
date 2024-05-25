import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:skillswap/navigation_menu_educator.dart';
import 'package:skillswap/utils/constants/api_constants.dart';
import '../../../../navigation_menu_learner.dart';
import '../../../../utils/constants/global.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../screens/learner_login/widgets/learner_login_form.dart';

class LoginController extends GetxController {
  // variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // Use an empty string if the value is null
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  // email and password signin learner
  Future<void> emailAndPasswordSignInLearner() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog(
          'Logging you in...', TImages.docerAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // remove loader
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
            title: 'Oh Snap', message: 'No internet connection');
        return;
      }

      // form validation
      if (!loginFormKey.currentState!.validate()) {
        // remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // login user using Email and password authentication
      final response = await postLogin(email.text.trim(), password.text.trim());

      if (response != null && response['message'] == 'Login successful') {
        // save data if remember me is selected
        if (rememberMe.value) {
          localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
          localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
        } else {
          localStorage.remove('REMEMBER_ME_EMAIL');
          localStorage.remove('REMEMBER_ME_PASSWORD');
        }

        // write to local storage to keep user logged in
        localStorage.write('isLoggedIn', true);
        // Assign values to global variables
        usernameGlobal = email.text.trim();
        passwordGlobal = password.text.trim();

        // remove loader
        TFullScreenLoader.stopLoading();

        // navigate user to the Navigation menu or NextScreen with email and password
        Get.offAll(() => const NavigationMenuLearner());
      } else {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
            title: 'Oh Snap', message: 'Invalid credentials');
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  // email and password signin educator
  Future<void> emailAndPasswordSignInEducator() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog(
          'Logging you in...', TImages.docerAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // remove loader
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
            title: 'Oh Snap', message: 'No internet connection');
        return;
      }

      // form validation
      if (!loginFormKey.currentState!.validate()) {
        // remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // login user using Email and password authentication
      final response = await postLogin(email.text.trim(), password.text.trim());

      if (response != null && response['message'] == 'Login successful') {
        // save data if remember me is selected
        if (rememberMe.value) {
          localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
          localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
        } else {
          localStorage.remove('REMEMBER_ME_EMAIL');
          localStorage.remove('REMEMBER_ME_PASSWORD');
        }

        // write to local storage to keep user logged in
        localStorage.write('isLoggedIn', true);
        // Assign values to global variables
        usernameGlobal = email.text.trim();
        passwordGlobal = password.text.trim();

        // remove loader
        TFullScreenLoader.stopLoading();

        // navigate user to the Navigation menu or NextScreen with email and password
        Get.offAll(() => const NavigationMenuEducator());
      } else {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
            title: 'Oh Snap', message: 'Invalid credentials');
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  Future<void> logout() async {
    localStorage.write('isLoggedIn', false);
    Get.offAll(() => const LearnerLoginForm());
  }

  Future<Map<String, dynamic>?> postLogin(
      String username, String password) async {
    const String url = ApiConstants.baseUrl + ApiConstants.loginEndpoint;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        TLoaders.errorSnackBar(title: 'Oh Snap', message: 'Failed to login');
        return null;
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      return null;
    }
  }
}
