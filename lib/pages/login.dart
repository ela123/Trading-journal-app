import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width; 
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset("assets/bg1.png", fit: BoxFit.cover),
          ),

          // Transparent overlay with buttons at the bottom center
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  customButton(context, "Login",buttonWidth*0.5),
                  customButton(context, "Sign Up",buttonWidth*0.5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customButton(BuildContext context, String text ,double width) {
    // Adjust the width as needed

    return SizedBox(
          width: width, // Makes the button full width
          child: ElevatedButton(
            onPressed: () {
              // Add navigation or logic here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only( topLeft:Radius.circular(50)),
              ),
            ),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
    );
  }
}
