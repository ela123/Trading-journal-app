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