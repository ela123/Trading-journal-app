import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';
import 'journal_sample_view.dart';
import 'home.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/bg1.png",
              fit: BoxFit.cover,
            ),
          ),

          // Welcome Text
          Positioned(
            top: screenHeight * 0.15, // 15% from top
            left: screenWidth * 0.05, // 5% from left
            right: screenWidth * 0.05, // 5% from right
            child: Container(
              padding: const EdgeInsets.all(20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Welcome Back!\n',
                      style: TextStyle(
                        fontSize: screenWidth * 0.09, // Scaled font size
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text:
                          '\n“Plan your trade and trade your plan.” \n– Anonymous',
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Buttons at the bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              children: [
                customButton(
                  context,
                  "Login",
                  screenWidth * 0.5,
                  Colors.transparent,
                  Colors.white,
                  const HomePage(),
                  topLeft: false,
                ),
                customButton(
                  context,
                  "Sign Up",
                  screenWidth * 0.5,
                  Colors.white,
                  Colors.black,
                  const Signup(),
                  topLeft: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customButton(
    BuildContext context,
    String text,
    double width,
    Color backgroundColor,
    Color textColor,
    Widget targetPage, {
    bool topLeft = false,
  }) {
    return SizedBox(
      width: width,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => targetPage),
          );
        },
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: topLeft ? const Radius.circular(50) : Radius.zero,
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 18),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: width * 0.08, // Button font size relative to width
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }





}





