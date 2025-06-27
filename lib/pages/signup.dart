import 'package:flutter/material.dart';
import 'logo.dart';
import 'login.dart';
import 'auth.dart';
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _codeController = TextEditingController(); // Optional

  final _formKey = GlobalKey<FormState>();

  final Auth _auth = Auth(); // Your Firebase Auth class

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Signup successful")),
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Login()));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${e.toString()}")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/bg1.png", fit: BoxFit.cover),
          ),
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
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text('Get Started', style: TextStyle(fontSize: screenWidth * 0.075, fontWeight: FontWeight.w900)),
                          SizedBox(height: screenHeight * 0.025),
                          customTextFormField(context, 'FullName', 'Enter FullName', _fullNameController),
                          SizedBox(height: screenHeight * 0.02),
                          customTextFormField(context, 'Email', 'Enter Email', _emailController, email: true),
                          SizedBox(height: screenHeight * 0.02),
                          customTextFormField(context, 'Password', 'Enter Password', _passwordController, password: true),
                          SizedBox(height: screenHeight * 0.02),
                          customTextFormField(context, 'Code', 'Enter Code', _codeController),
                          SizedBox(height: screenHeight * 0.02),
                          signupbutton(context, _signUp),
                          SizedBox(height: screenHeight * 0.03),
                          const LoginOptions(Login(), "Login"),
                        ],
                      ),
                    ),
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
Widget customTextFormField(BuildContext context, String name, String hint, TextEditingController controller, {bool email = false, bool password = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: TextFormField(
      controller: controller,
      obscureText: password,
      keyboardType: email ? TextInputType.emailAddress : TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) return 'Please enter $name';
        if (email && !value.contains('@')) return 'Enter a valid email';
        if (password && value.length < 6) return 'Password must be 6+ chars';
        return null;
      },
      decoration: InputDecoration(
        labelText: name,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black26),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );
}


// --- Sign Up Button ---
Widget signupbutton(BuildContext context, VoidCallback onTap) {
  final screenWidth = MediaQuery.of(context).size.width;
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        padding: const EdgeInsets.symmetric(vertical: 16),
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
