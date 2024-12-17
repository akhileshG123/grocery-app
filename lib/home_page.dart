import 'package:flutter/material.dart';

import 'products_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _emailController =
      TextEditingController(); 
  final _passwordController =
      TextEditingController(); 
  final _formKey =
      GlobalKey<FormState>(); 
  bool _passwordValid = true; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 80),
            Image.asset(
              'assets/images/logo.png',
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              "Shop Smart, Save Big on Groceries!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Form(
                key: _formKey, 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller:
                          _emailController, 
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType
                          .emailAddress, 
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email'; 
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    // Password input field
                    TextFormField(
                      controller:
                          _passwordController, 
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: const Icon(Icons.visibility),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      obscureText: true, // Hide the password input by default
                      validator: (value) {
                        // Validate password input
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password'; // Error message for empty password
                        } else if (value.length < 8) {
                          setState(() {
                            _passwordValid =
                                false; // Set password validity to false
                          });
                          return 'Password must contain at least 8 characters'; // Error message for short password
                        }
                        setState(() {
                          _passwordValid =
                              true; // Set password validity to true if conditions met
                        });
                        return null; // If valid, return null (no error)
                      },
                    ),
                    // Show error message if the password is invalid
                    if (!_passwordValid)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          ' ',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    const SizedBox(height: 20),
                    // Login button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Check if form is valid

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductsList()),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1F8A70),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Forgot Password and Sign Up options
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, // Space elements evenly
                      children: [
                        TextButton(
                          onPressed: () {
                            // Add forgot password logic here
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Add sign-up logic here
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
