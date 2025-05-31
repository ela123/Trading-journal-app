import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final dynamic title;
  final IconData? leadingIcon;
  const CustomAppBar({
    super.key,
    required this.title,
    required this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final double screenWidth = MediaQuery.of(context).size.width;

    return AppBar(
      automaticallyImplyLeading: leadingIcon == null,
      backgroundColor: const Color.fromARGB(27, 168, 164, 161).withOpacity(0.7),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              leadingIcon,
              color: Colors.black,
              size:
                  screenWidth *
                  0.08, // Responsive icon size (8% of screen width)
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize:
                  screenWidth *
                  0.07, // Responsive text size (7% of screen width)
              fontFamily: 'Samantha',
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
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
            