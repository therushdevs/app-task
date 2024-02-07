import 'package:api_task/core/assets.dart';
import 'package:api_task/promilo/widgets/loader.dart';
import 'package:api_task/the_gig_search/providers/create_account_provider.dart';
import 'package:api_task/the_gig_search/providers/sso_provider.dart';
import 'package:api_task/the_gig_search/utils/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GigCreateAccountPage extends StatefulWidget {
  const GigCreateAccountPage({
    super.key,
    this.isLogin = false,
  });
  final bool isLogin;

  @override
  State<GigCreateAccountPage> createState() => _GigCreateAccountPageState();
}

class _GigCreateAccountPageState extends State<GigCreateAccountPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _showConfirmPassword = false;
  late SsoProvider watchLoginProvider;
  late CreateAccountProvider watchCreateAccProvider;

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
    watchLoginProvider = context.watch<SsoProvider>();
    watchCreateAccProvider = context.watch<CreateAccountProvider>();
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(
            horizontal: 11,
            vertical: 17,
          ),
          child: Stack(
            children: [
              ListView(
                children: [
                  Image.asset(
                    Assets.gigLogo,
                    height: MediaQuery.of(context).size.height / 3.2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 34.0),
                    child: Text(
                      widget.isLogin ? 'Log In' : 'Create Account',
                      style: boldBlack30,
                    ),
                  ),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Email cannot be empty';
                      } else if (!value!.contains('@')) {
                        return 'incorrect email id';
                      }
                      return null;
                    },
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
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Password cannot be empty';
                        } else if (value!.length < 8 || value.length > 15) {
                          return 'Password should be in the range of 8-15 characters';
                        }
                        return null;
                      },
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
                            _showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (!widget.isLogin)
                    TextFormField(
                      validator: widget.isLogin
                          ? null
                          : (value) {
                              if (value != null && value.isEmpty) {
                                return 'Confirm Password cannot be empty';
                              } else if (value != _passwordController.text) {
                                return 'Password does not match';
                              }
                              return null;
                            },
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
                      onPressed: () {
                        final loginProvider = context.read<SsoProvider>();
                        final createAccProvider =
                            context.read<CreateAccountProvider>();
                        if (_formKey.currentState?.validate() ?? false) {
                          widget.isLogin
                              ? loginProvider.signInWithEmailAndPassword(
                                  _emailController.text,
                                  _passwordController.text)
                              : createAccProvider
                                  .createAccountWithEmailAndPassword(
                                      _emailController.text,
                                      _passwordController.text);
                        }
                      },
                      child: Text(widget.isLogin ? 'Login' : 'Create Account'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45.0),
                    child: Center(
                      child: Text.rich(
                        TextSpan(
                          text:
                              'By creating an account or signing in you agree to our ',
                          style: mediumBlack12,
                          children: [
                            TextSpan(
                              text: 'Terms & Conditions',
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 12,
                                color: Color(0xff2805FF),
                                fontWeight: FontWeight.w500,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              Loader(
                isVisible: widget.isLogin
                    ? watchLoginProvider.isLoading
                    : watchCreateAccProvider.isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
