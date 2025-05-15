import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width;
    //final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset("assets/bg1.png", fit: BoxFit.cover),
          ),

          // Positioned text - OUT of the button area
          Positioned(
            top: 100, // Adjust position as needed
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(20),
              //color: Colors.black.withOpacity(0.5),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Welcome Back!\n',
                      style: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: '\nEnter personal details to your employee account',
                      style: TextStyle(fontSize: 20, color: Colors.white),
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                customButton(
                  context,
                  "Login",
                  buttonWidth * 0.5,
                  Colors.transparent,
                  Colors.white,
                  Login(),
                ),
                customButton(
                  context,
                  "Sign Up",
                  buttonWidth * 0.5,
                  Colors.white,
                  Colors.black,
                  Signup(),
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
    Color custom,
    Color textcolor,
    Widget onTap,
  ) {
    // Adjust the width as needed

    return  SizedBox(
        width: width, // full width
        child: TextButton(
          onPressed: () {
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => onTap),
              );
            }
          },
          style: TextButton.styleFrom(
            backgroundColor: custom, // fully transparent background
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textcolor, // text color
            ),
          ),
        ),
    );
  }
}
