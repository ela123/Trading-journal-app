import 'package:flutter/material.dart';
import 'logo.dart';
import 'login.dart';
class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset("assets/bg1.png", fit: BoxFit.cover),
          ),

          // Foreground content
          Column(
            children: [
              SizedBox(height: screenHeight * 0.1),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.06,
                    vertical: screenHeight * 0.03,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: IntrinsicHeight(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Get Started',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.075,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.025),
                                customTextFormField(context, 'FullName', 'Enter FullName'),
                                SizedBox(height: screenHeight * 0.02),
                                customTextFormField(context, 'Email', 'Enter Email'),
                                SizedBox(height: screenHeight * 0.02),
                                customTextFormField(context, 'Password', 'Please enter Password'),
                                SizedBox(height: screenHeight * 0.02),
                                customTextFormField(context, 'Code', 'Enter Code'),
                                SizedBox(height: screenHeight * 0.015),
                                signupbutton(context),
                                SizedBox(height: screenHeight * 0.03),
                                const LoginOptions(Login(),"Login"),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// --- Responsive Form Field ---
Widget customTextFormField(BuildContext context, String name, String hint) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: name,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black26),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}

// --- Sign Up Button ---
Widget signupbutton(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        // TODO: Add sign-up logic
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        'Sign up',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: screenWidth * 0.045,
        ),
      ),
    ),
  );
}
Widget loginoption(BuildContext context) {
  return Column(
    children: [
      // Divider with "Sign up with" text
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Divider(thickness: 0.7, color: Colors.grey.withOpacity(0.5)),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Sign up with',
              style: TextStyle(color: Colors.black45),
            ),
          ),
          Expanded(
            child: Divider(thickness: 0.7, color: Colors.grey.withOpacity(0.5)),
          ),
        ],
      ),
      const SizedBox(height: 25.0),

      // Corrected Icons Row
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Logo(FontAwesomeIcons.facebookF),
          Logo(FontAwesomeIcons.twitter),
          Logo(FontAwesomeIcons.google),
          Logo(FontAwesomeIcons.apple),
        ],
      ),
      const SizedBox(height: 25.0),

      // Sign-up redirect
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Don\'t have an account? ',
            style: TextStyle(color: Colors.black45),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Signup()),
              );
            },
            child: Text(
              'Sign up',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}