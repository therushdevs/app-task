import 'dart:async';

import 'package:api_task/constants.dart';
import 'package:api_task/core/assets.dart';
import 'package:api_task/promilo/promilo_auth_provider.dart';
import 'package:api_task/promilo/ui/promilo_home_page.dart';
import 'package:api_task/promilo/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PromiloAuthPage extends StatefulWidget {
  const PromiloAuthPage({super.key});

  @override
  State<PromiloAuthPage> createState() => _PromiloAuthPageState();
}

class _PromiloAuthPageState extends State<PromiloAuthPage> {
  late TextEditingController _username;
  late TextEditingController _password;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _username = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _username.dispose();
    _password.dispose();
    _formKey.currentState?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final providerWatch = context.watch<PromiloAuthProvider>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Promilo',
          style: titleBold,
        ),
      ),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: SafeArea(
              minimum: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Hi, Welcome Back!",
                        style: subtitleBold,
                      ),
                    ),
                  ),
                  const Text(
                    "Please Sign in to continue",
                    style: titleNormal,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Username cannot be empty";
                      } else if (value.length < 3) {
                        return "Ussername is too short!";
                      }
                    },
                    controller: _username,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      Text(
                        'Sign in With OTP',
                        style: titleNormalBlue,
                      ),
                    ],
                  ),
                  const Text(
                    'Password',
                    style: titleNormal,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password cannot be empty";
                      } else if (value.length < 8) {
                        return "Passowrd is too short!";
                      }
                    },
                    obscureText: true,
                    controller: _password,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(value: false, onChanged: (val) {}),
                          const Text(
                            'Remember Me',
                            style: titleNormal,
                          )
                        ],
                      ),
                      const Text(
                        'Forgot Password?',
                        style: titleNormalBlue,
                      ),
                    ],
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50), // NEW
                      ),
                      onPressed: () async {
                        final provider = context.read<PromiloAuthProvider>();
                        if (_formKey.currentState!.validate()) {
                          await provider.login(
                            username: _username.text,
                            password: _password.text,
                          );

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const PromiloHomePage(),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'Submit',
                        maxLines: 1,
                      ),
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        'OR',
                        textAlign: TextAlign.center,
                        style: titleNormal,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        child: Image.asset(
                          Assets.google,
                          width: 44,
                          height: 44,
                        ),
                      ),
                      InkWell(
                        child: Image.asset(
                          Assets.linkedin,
                          width: 44,
                          height: 44,
                        ),
                      ),
                      InkWell(
                        child: Image.asset(
                          Assets.facebook,
                          width: 44,
                          height: 44,
                        ),
                      ),
                      InkWell(
                        child: Image.asset(
                          Assets.instagram,
                          width: 44,
                          height: 44,
                        ),
                      ),
                      InkWell(
                        child: Image.asset(
                          Assets.whatsapp,
                          width: 44,
                          height: 44,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Business User?'),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Login here'),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('Dint have an account?'),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Sign Up'),
                          )
                        ],
                      ),
                    ],
                  ),
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      text: "By continuing you agree to Promilo's",
                      style: TextStyle(color: Colors.blueGrey.shade300),
                      children: const [
                        TextSpan(
                          text: ' Terms of Use & Privacy Policy.',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    softWrap: true,
                  ),
                ],
              ),
            ),
          ),
          Loader(isVisible: providerWatch.isloading),
        ],
      ),
    );
  }
}
