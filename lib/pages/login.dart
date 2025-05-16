import 'package:flutter/material.dart';
import 'signup.dart';
import 'logo.dart';
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset("assets/bg1.png", fit: BoxFit.cover),
          ),
          Column(
            children: [
              const Expanded(flex: 1, child: SizedBox(height: 10)),
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 10.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      customTextFormField(context, 'Email', 'Enter Email'),
                      const SizedBox(height: 25.0),
                      customTextFormField(
                        context,
                        'Password',
                        'Please enter Password',
                      ),
                      const SizedBox(height: 25.0),
                      custom(context),
                      const SizedBox(height: 25.0),
                      loginbutton(context),
                      const LoginOptions(Signup(),"Sign In"),

                    ],
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

Widget customTextFormField(BuildContext context, String name, String hint) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 8),
    child: TextFormField(
      decoration: InputDecoration(
        label: Text(name),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black26),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black, // Default border color
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black, // Default border color
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}

Widget custom(BuildContext context) {
  bool rememberPassword = false;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Checkbox(
            value: rememberPassword,
            onChanged: (bool? value) {},
            activeColor:
                Theme.of(
                  context,
                ).primaryColor, // Or replace with a specific color
          ),
          const Text('Remember me', style: TextStyle(color: Colors.black45)),
        ],
      ),
      GestureDetector(
        onTap: () {
          // Navigate to forgot password screen
        },
        child: Text(
          'Forgot password?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor, // Or your custom color
          ),
        ),
      ),
    ],
  );
}

Widget loginbutton(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        // Your sign-up logic here
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple, // Set your desired background color
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text(
        'Sign up',
        style: TextStyle(
          color: Colors.white, // Text color
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ),
  );
}
