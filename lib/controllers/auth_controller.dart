import 'dart:developer';
import 'package:book/components/message.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  final String baseUrl = 'http://192.168.100.24:3000/api/';

  void login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    log("Calling========================");
    final url = Uri.parse('${baseUrl}auth/login');
    log("Parsed url $url");
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      final responseBody = jsonDecode(response.body);
      log(responseBody['message']);
      if (response.statusCode == 200) {
        // Handle successful login
        showCustomSnackBar(
          title: 'Success',
          message: 'You logged in successfully!',
          isSuccess: true,
        );
        log('You logged successfully');
        // Get.to(() => SignPassword());
      } else {
        // Handle login error
        final errorResponse = jsonDecode(response.body);
        log('error response: ${errorResponse["message"]}');

        showCustomSnackBar(
          title: 'Error',
          message: errorResponse["message"],
          isSuccess: false,
        );
        log('else');
      }
    } catch (e) {
      // Handle network or other errors
      showCustomSnackBar(
        title: 'Error',
        message: 'An error occurred. Please try again.',
        isSuccess: false,
      );
      log('Login error: $e');
    }
  }

  void register(
      {required String email,
      required String password,
      required BuildContext context}) async {
    log("Calling========================");
    final url = Uri.parse('${baseUrl}auth/register');
    log("Parsed url $url");
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      final responseBody = jsonDecode(response.body);
      log(responseBody['message']);
      if (response.statusCode == 200) {
        // Handle successful registration
        showCustomSnackBar(
          title: 'Success',
          message: 'You registered successfully!',
          isSuccess: true,
        );
        log('You registered successfully');
        // Get.to(() => SignPassword());
      } else {
        // Handle registration error
        final errorResponse = jsonDecode(response.body);
        log('error response: ${errorResponse["message"]}');

        showCustomSnackBar(
          title: 'Error',
          message: errorResponse["message"],
          isSuccess: false,
        );
        log('else');
      }
    } catch (e) {
      // Handle network or other errors
      showCustomSnackBar(
        title: 'Error',
        message: 'An error occurred. Please try again.',
        isSuccess: false,
      );
      log('Registration error: $e');
    }
  }
}
