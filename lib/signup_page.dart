import 'package:flutter/material.dart';
import 'package:instagram_clone/components/my_textfield.dart';
import 'package:instagram_clone/data/firebase_service/firebase_auth.dart';
import 'package:instagram_clone/home_page.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordControllerConfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/Untitled (1).png"),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: [
                  SizedBox(height: 200),
                  const Text(
                    "Sign Up to Cyber Styles",
                    style: TextStyle(
                      color: Color.fromARGB(255, 219, 182, 18),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  MyTextfield(
                    controller: emailController,
                    hintText: 'Enter your email...',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  MyTextfield(
                    controller: passwordController,
                    hintText: 'Enter your password...',
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  MyTextfield(
                    controller: passwordControllerConfirm,
                    hintText: 'Enter your password...',
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await Authentication().SignupPage(
                          email: emailController.text,
                          password: passwordController.text,
                          confirm_password: passwordControllerConfirm.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Homepage()), // Navigate to SignupPage
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: TextStyle(fontSize: 20),
                    ),
                    child: const Text('Sign Up'),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Do you have an Account?',
                          style: TextStyle(color: Colors.grey[700])),
                      const SizedBox(width: 4),
                      const Text(
                        'Login Now',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
