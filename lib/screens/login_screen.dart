import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signup_screen.dart';
import 'todo_list_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
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
                  Get.snackbar("Error", "Please enter phone number and password");
                } else {
                  // Add login logic here
                  Get.off(() => TodoListScreen());
                }
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => SignupScreen());
              },
              child: Text('Don’t have an account? Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
