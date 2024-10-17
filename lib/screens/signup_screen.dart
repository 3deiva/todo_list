import 'package:flutter/material.dart';
import 'package:get/get.dart';  // Ensure Get is imported
import 'login_screen.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                if (phoneController.text.isEmpty || passwordController.text.isEmpty) {
                  // Show an error
                  Get.snackbar("Error", "Please enter phone number and password");
                } else {
                  // Add signup logic here
                  Get.off(() => LoginScreen());
                }
              },
              child: Text('Sign Up'),
            ),
            TextButton(
              onPressed: () {
                Get.back(); // Go back to login
              },
              child: Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}
