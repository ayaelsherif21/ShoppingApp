import 'package:flutter/material.dart';
import 'package:shopping_app/product.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register" , style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body:SingleChildScrollView(
        child: Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Full Name
                TextFormField(
                  controller: fullNameController,
                  decoration: const InputDecoration(
                    hintText: 'Full Name',
                    labelText: 'Full Name',
                    prefixIcon: Icon(Icons.person, color: Colors.lightBlue),
                    errorStyle: TextStyle(fontSize: 18.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9.0)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your full name.";
                    }
                    if (value[0] != value[0].toUpperCase()) {
                      return "The first letter must be capitalized.";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12.0),
        
                // Email
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email, color: Colors.lightBlue),
                    errorStyle: TextStyle(fontSize: 18.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9.0)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email.";
                    }
                    if (!value.contains('@')) {
                      return "Please enter a valid email address.";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12.0),
        
                // Password
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock, color: Colors.lightBlue),
                    errorStyle: TextStyle(fontSize: 18.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9.0)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a password.";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters.";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12.0),
        
                // Confirm Password
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Confirm Password',
                    labelText: 'Confirm Password',
                    prefixIcon: Icon(Icons.lock_outline, color: Colors.lightBlue),
                    errorStyle: TextStyle(fontSize: 18.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9.0)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please confirm your password.";
                    }
                    if (value != passwordController.text) {
                      return "Passwords do not match.";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
        
                // Sign Up Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    textStyle: TextStyle(color: Colors.white) // Button color
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // If all validations pass, show success dialog
                      _showSuccessDialog(context);
                    } else {
                      // Show snack bar for validation errors
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fix the errors above.'),
                        ),
                        
                      );
                    }
                 
                  },
                  
                  child: const Text('Sign Up' , style: TextStyle(color: Colors.white),),
                  
                ),
              ],
            ),
          ),
        ),
      ),
      ) 
   
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Account Created Successfully'),
          content: const Text('You can now proceed to the shopping screen.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProductPage()),
                );
              },
              child: const Text('Go to Shopping'),
            ),
          ],
        );
      },
    );
  }
}
