import 'package:dofia_the_book/data/user_storage.dart';
import 'package:dofia_the_book/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dofia_the_book/data/user_provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneOrEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool isValidPhoneNumber(String phoneNumber) {
    String cleaned = phoneNumber.replaceAll(RegExp(r'\s'), '');
    if (cleaned.startsWith('+')) cleaned = cleaned.substring(1);
    return RegExp(r'^\d{7,15}$').hasMatch(cleaned);
  }

  @override
  void dispose() {
    _phoneOrEmailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
    );

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _phoneOrEmailController,
            decoration:
                inputDecoration.copyWith(hintText: 'Phone Number or Email'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number or email';
              }
              if (!isValidEmail(value) && !isValidPhoneNumber(value)) {
                return 'Enter a valid phone number or email';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: inputDecoration.copyWith(hintText: 'Password'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'The password must contain at least 6 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.cyanAccent[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              minimumSize: const Size.fromHeight(50),
            ),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final contact = _phoneOrEmailController.text.trim();

                final username =
                    await UserStorage.getUsernameFromContact(contact);

                if (username != null) {
                  final userProvider =
                      Provider.of<UserProvider>(context, listen: false);
                  userProvider.login(username);
                  await UserStorage.saveCurrentUsername(username);

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const MainScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('User not found. Try signing up.')),
                  );
                }
              }
            },
            child: const Text(
              'Log In',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () => print('Forgot Password? action triggered'),
              child: const Text(
                'Forgot password?',
                style: TextStyle(color: Colors.cyan),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
