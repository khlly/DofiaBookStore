// lib/screens/auth/login_screen.dart
import 'package:flutter/material.dart';
import '../../widgets/auth/auth_header.dart'; // Assurez-vous que ce widget existe
import '../home_screen.dart'; // Importez votre HomePage
import 'signup_screen.dart'; // Importez votre SignUpScreen

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneOrEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // is valid email function
  bool isValidEmail(String email) {
    // Regex for validation.
    // can use package like 'email_validator' if in need of robustess.
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  // check phone format
  // basic regex
  bool isValidPhoneNumber(String phoneNumber) {
    // delete non numerical characters
    String cleanedNumber = phoneNumber.replaceAll(RegExp(r'\S'), '');
    // phone between 7 and 15 number
    return cleanedNumber.length >= 7 && cleanedNumber.length <= 15;
    // can use package like 'phone_form_field' for more robustess
  }

  @override
  void dispose() {
    _phoneOrEmailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // style for main input
    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      //errorStyle: const TextStyle(height: 1.2), //space for error messages
    );

    return Scaffold(
      backgroundColor: const Color(0xFFE0F7FF), // backgroundcolor
      body: SafeArea( // Ensures that content is not below system bars
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header 
            const AuthHeader(title: 'DofiaTheBook', showBack: true), 
            Expanded(
              child: SingleChildScrollView( // Enables scrolling if content exceeds
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    // --- Logo  ---
                    Image.asset(
                      'assets/share/logoDofia.png', 
                      height: 120, 
                    ),
                    const SizedBox(height: 20),

                    // --- Title "Log In" ---
                    const Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // color of title
                      ),
                    ),
                    const SizedBox(height: 20),

                    // --- Login form ---
                    Form(
                      key: _formKey, // Key for form validation
                      child: Column(
                        children: [
                          // --- Field "Phone Number or Email" ---
                          TextFormField(
                            controller: _phoneOrEmailController,
                            decoration: inputDecoration.copyWith(hintText: 'Phone Number or Email'),
                            keyboardType: TextInputType.emailAddress, // adapt the keybord
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number or email';
                              }
                              
                              final isEmail = isValidEmail(value);
                              final isPhoneNumber = isValidPhoneNumber(value);

                              if (!isEmail && !isPhoneNumber) {
                                return 'Enter a valid phone number or email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),

                          // --- Field "Password" ---
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true, // Hide the password
                            decoration: inputDecoration.copyWith(hintText: 'Password'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }

                              if (value.length < 6) {
                                return 'The password must contains at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),


                          // --- button "Log In" ---
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.cyanAccent[400],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              minimumSize: const Size.fromHeight(50), // button width
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // If form valid simulate connection
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Successful connection! Redirection...')),
                                );
                                // Naviguer vers la HomePage en remplaçant la page actuelle
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                                );
                              }
                            },
                            child: const Text(
                              'Log In',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                          // --- Text "Forgot password?" ---
                          Align(
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () {
                                // TODO: Logique de navigation vers la page "Mot de passe oublié"
                                print('Forgot Password? action triggered');
                              },
                              child: const Text(
                                'Forgot password?',
                                style: TextStyle(color: Colors.cyan), // color of the text
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                    // --- Separator "OR" ---
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'OR',
                            style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // --- Button "Create a new account" ---
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.cyanAccent[400], // text color
                        side: BorderSide(color: Colors.cyanAccent[400]!), // Border color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        minimumSize: const Size.fromHeight(50), // Full-width button
                      ),
                      onPressed: () {
                        // go to SignUpScreen (Account creation)
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpScreen()),
                        );
                      },
                      child: const Text(
                        'Create a new account',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
