import 'package:api_task/core/assets.dart';
import 'package:api_task/the_gig_search/utils/constants.dart';
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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(
          horizontal: 11,
          vertical: 17,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Image.asset(Assets.gigLogo),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 34.0),
              child: Text(
                'Create Account',
                style: boldBlack30,
              ),
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: 'Email Address',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 34.0),
              child: TextFormField(
                obscureText: !_showPassword,
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
                    icon: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
            ),
            TextFormField(
              obscureText: !_showConfirmPassword,
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
                  icon: Icon(
                    _showConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 34.0),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Create Account'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              child: Text.rich(
                TextSpan(
                  text:
                      'By creating an account or signing in you agree to out Terms and Conditions',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
