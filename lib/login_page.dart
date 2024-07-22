import 'package:flutter/material.dart';
import 'package:instagram_clone/components/my_button.dart';
import 'package:instagram_clone/components/my_textfield.dart';
import 'package:instagram_clone/data/firebase_service/firebase_auth.dart';
import 'package:instagram_clone/home_page.dart';
import 'package:instagram_clone/signup_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                image: AssetImage("images/Untitled_1).png"), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              SizedBox(height: 200),
              const Text("Login in Cyber Styles",
                  style: TextStyle(
                    color: Color.fromARGB(255, 219, 182, 18),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  )),
              MyTextfield(
                controller: _emailController,
                hintText: 'Username...',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              MyTextfield(
                obscureText: true,
                controller: _passwordController,
                hintText: 'Password...',
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: Color.fromARGB(255, 219, 182, 18),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              MyButton(
                onTap: () async {
                  await Authentication().Login(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Homepage()), // Navigate to SignupPage
                  );
                },
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an Account?',
                      style: TextStyle(color: Colors.grey[1100])),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SignupPage()), // Navigate to SignupPage
                      );
                    },
                    child: const Text(
                      'Register Now',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
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
