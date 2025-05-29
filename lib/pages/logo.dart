import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'signup.dart';

class Logo extends StatelessWidget {
  final IconData icon;

  const Logo(this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: Colors.grey.shade200,
      child: Icon(icon, size: 20, color: Colors.black),
    );
  }
}

class LoginOptions extends StatelessWidget {
  final String text;
  final Widget page;
  const LoginOptions(this.page, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // --- Divider with "Sign up with" label ---
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Divider(
                thickness: 0.7,
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Sign up with',
                style: TextStyle(color: Colors.black45),
              ),
            ),
            Expanded(
              child: Divider(
                thickness: 0.7,
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
          ],
        ),

        const SizedBox(height: 25.0),

        // --- Social Media Icons Row ---
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [Logo(FontAwesomeIcons.google)],
        ),

        const SizedBox(height: 25.0),

        // --- Sign Up Redirect ---
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
                  MaterialPageRoute(builder: (context) => page),
                );
              },
              child: Text(
                text,
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
}
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///