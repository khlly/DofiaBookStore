import 'package:dofia_the_book/data/user_provider.dart';
import 'package:dofia_the_book/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpForm extends StatefulWidget {
  // Add a callback function
  final VoidCallback? onSignUpSuccess;

  const SignUpForm({super.key, this.onSignUpSuccess});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController(); // email ou phone

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _usernameController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  // is valid email function
  bool isValidEmail(String email) {
    // Regex for validation.
    // can use package like 'email_validator' if in need of robustess.
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  // check phone format
  // basic regex
bool isValidPhoneNumber(String phoneNumber) {
  // Delete spaces
  String cleanedNumber = phoneNumber.replaceAll(RegExp(r'\s'), '');

  // If begin with +, delete it but valid
  if (cleanedNumber.startsWith('+')) {
    cleanedNumber = cleanedNumber.substring(1);
  }

  // If only numbers 
  if (!RegExp(r'^\d*$').hasMatch(cleanedNumber)) {
    return false; // Not only numbers 
  }

  return cleanedNumber.length >= 7 && cleanedNumber.length <= 15;
}

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      //errorStyle: const TextStyle(height: 0.5),
    );

    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // --- Form Fields ---
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: inputDecoration.copyWith(
                          hintText: 'First Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your first name';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: inputDecoration.copyWith(
                          hintText: 'Last Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your last name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _usernameController,
                  decoration: inputDecoration.copyWith(hintText: 'Username'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _contactController,
                  decoration: inputDecoration.copyWith(hintText: 'Phone Number or Email'),
                  keyboardType: TextInputType.emailAddress, // Propose @ et . pour l'email
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a phone number or an email';
                    }

                    final isEmail = isValidEmail(value);
                    final isPhoneNumber = isValidPhoneNumber(value);

                    if (!isEmail && !isPhoneNumber) {
                      return 'Enter a valid phone number or email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: inputDecoration.copyWith(hintText: 'Create new password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Create a new password';
                    }
                    if (value.length < 6) {
                      return 'The password must contains at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: inputDecoration.copyWith(hintText: 'Confirm new password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirm your new password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords don\'t match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyanAccent[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: const Size.fromHeight(45),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final contact = _contactController.text.trim();
                      final username = _usernameController.text.trim();

                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();

                      // Save mapping: contact (email/phone) -> username
                      await prefs.setString('user:$contact', username);

                      // Save current session
                      await prefs.setString('current_user', username);

                      // Connect user
                      final userProvider =
                          Provider.of<UserProvider>(context, listen: false);
                      userProvider.login(username);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Account created & logged in!')),
                      );

                      if (widget.onSignUpSuccess != null) {
                        widget.onSignUpSuccess!();
                      } else {
                        // Optional: redirect to home if no callback provided
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const MainScreen()),
                        );
                      }
                    }
                  },
                  child: const Text(
                    'Create Account',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}