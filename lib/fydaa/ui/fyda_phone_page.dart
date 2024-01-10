import 'package:api_task/fydaa/providers/fyaa_auth_provider.dart';
import 'package:api_task/fydaa/ui/fydaa_otp_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FydaaPhonePage extends StatefulWidget {
  const FydaaPhonePage({super.key});

  @override
  State<FydaaPhonePage> createState() => _FydaaPhonePageState();
}

class _FydaaPhonePageState extends State<FydaaPhonePage> {
  bool allowFydaa = false;
  String phoneNumber = '';
  late TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    _phoneNumberController = TextEditingController();
    final providerWatch = context.read<FydaaAuthProvider>();
    _phoneNumberController.text = providerWatch.getPhoneNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: SafeArea(
        minimum: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Verify your phone',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 14.0, bottom: 24),
                  child: Text(
                    'We need to verify your number',
                    style: TextStyle(
                      // fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const Text(
                  'Phoone Number *',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                TextFormField(
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  controller: _phoneNumberController,
                  decoration: const InputDecoration(
                    counterText: "",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      phoneNumber = value;
                    });
                  },
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: Colors.black,
                  ),
                  onPressed: phoneNumber.isEmpty ||
                          phoneNumber.length < 10 ||
                          !allowFydaa
                      ? null
                      : () {
                          final provider = context.read<FydaaAuthProvider>();
                          provider.setPhoneNumber(phoneNumber);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const FydaaOtpPage(),
                            ),
                          );
                        },
                  child: const Text(
                    'Get Otp',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      value: allowFydaa,
                      onChanged: (value) {
                        setState(() {
                          allowFydaa = !allowFydaa;
                        });
                      },
                    ),
                    const Expanded(
                      child: Text(
                        "Allow Fydaa to sent financial knowledge & critical alerts on your WhatsApp",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
