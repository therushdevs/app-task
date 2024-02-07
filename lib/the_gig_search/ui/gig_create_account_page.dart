import 'package:api_task/core/assets.dart';
import 'package:flutter/material.dart';

class GigCreateAccountPage extends StatefulWidget {
  const GigCreateAccountPage({super.key});

  @override
  State<GigCreateAccountPage> createState() => _GigCreateAccountPageState();
}

class _GigCreateAccountPageState extends State<GigCreateAccountPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(Assets.gigLogo),
          const Text('Create Account'),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: 'Email Address',
            ),
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: 'Password',
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
                icon: const Icon(Icons.visibility),
              ),
            ),
          ),
          TextFormField(
            controller: _confirmPasswordController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: 'Confirm Password',
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _showConfirmPassword = !_showConfirmPassword;
                  });
                },
                icon: const Icon(Icons.visibility),
              ),
            ),
          ),
          RichText(
            text: const TextSpan(
              text:
                  'By creating an account or signing in you agree to out Terms and Conditions',
            ),
          ),
        ],
      ),
    );
  }
}
