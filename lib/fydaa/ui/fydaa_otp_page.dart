import 'dart:async';

import 'package:api_task/fydaa/providers/fyaa_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class FydaaOtpPage extends StatefulWidget {
  const FydaaOtpPage({
    super.key,
    this.otpLength = 5,
  });
  final int otpLength;

  @override
  State<FydaaOtpPage> createState() => _FydaaOtpPageState();
}

class _FydaaOtpPageState extends State<FydaaOtpPage> {
  late List<int> _otpList;
  late List<TextEditingController> _textControllerList;
  late List<FocusNode> _focusNodes;
  late List<FocusNode> _rawFocusNodes;
  String otp = '';
  bool? otpSuccess;
  late Timer _timer;
  int timerCount = 170;

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    for (int i = 0; i < _textControllerList.length; i++) {
      _textControllerList[i].dispose();
      _focusNodes[i].dispose();
    }
  }

  @override
  void initState() {
    super.initState();
    _otpList = List.generate(widget.otpLength, (index) => index);
    _textControllerList =
        List.generate(widget.otpLength, (index) => TextEditingController());
    _focusNodes = List.generate(widget.otpLength, (index) => FocusNode());
    _rawFocusNodes = List.generate(widget.otpLength, (index) => FocusNode());
    // _addListenersToControllers();
    timer();
  }

  void timer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerCount != 0) {
        setState(() {
          timerCount--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  void restartTimer() {
    _timer.cancel();
    setState(() {
      timerCount = 170;
    });
    timer();
  }

  void _addListenersToControllers() {
    for (int i = 0; i < _textControllerList.length; i++) {
      _textControllerList[i].addListener(() {
        if (_textControllerList[i].text.isEmpty) {
          _moveFocusToPrevField(i);
          if (otp.isNotEmpty) {
            otp = otp.substring(0, otp.length - 1);
          }
        }
      });
    }
  }

  void _moveFocusToNextField(int index) {
    if (index < _textControllerList.length - 1) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    }
  }

  void _moveFocusToPrevField(int index) {
    if (index > 0) {
      _textControllerList[index].clear();
      if (otp.isNotEmpty && otp.length > 1) {
        otp = otp.substring(0, otp.length - 2);
      } else if (otp.length == 1) {
        otp = "";
      }
      print('------------------------------> ${otp}');
      Future.delayed(const Duration(milliseconds: 50), () {
        FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
      });
    }
  }

  String formatTime() {
    int mins = timerCount ~/ 60;
    int seconds = timerCount - (mins * 60);

    return seconds < 10 ? '0$mins : 0$seconds' : '0$mins : $seconds';
  }

  String formattedPhoneNumber() {
    final watchProvider = context.watch<FydaaAuthProvider>();
    final phone = watchProvider.getPhoneNumber();
    String num =
        '(${phone.substring(0, 3)}) *** **${phone.substring(phone.length - 2)}';
    return num;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: SafeArea(
        minimum: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  padding: EdgeInsets.only(top: 24.0),
                  child: Text(
                    'Enter the verification code sent to',
                    style: TextStyle(
                      // fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Text(
                  formattedPhoneNumber(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                _buildOtpField(),
                Center(
                  child: Text('Verification code expires in: ${formatTime()}'),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50), // NEW
                  ),
                  onPressed: timerCount == 0
                      ? () {
                          restartTimer();
                        }
                      : null,
                  child: const Text('Resend Code'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    onPressed: () {
                      if (Navigator.of(context).canPop()) {
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Change Number'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container _buildOtpField() {
    return Container(
      decoration: BoxDecoration(
        color: otpSuccess != null
            ? otpSuccess!
                ? Colors.green
                : Colors.red
            : Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: _otpList
                .map(
                  (index) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: RawKeyboardListener(
                          focusNode: _rawFocusNodes[index],
                          onKey: (value) {
                            if (value.data.logicalKey ==
                                LogicalKeyboardKey.backspace) {
                              _moveFocusToPrevField(index);
                            }
                          },
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              FocusScope.of(context)
                                  .requestFocus(_focusNodes[index]);
                            },
                            onLongPress: () {
                              showMenu(
                                context: context,
                                position: RelativeRect.fill,
                                items: [
                                  PopupMenuItem(
                                    child: const Text('Paste'),
                                    onTap: () {
                                      _handlePaste(index);
                                    },
                                  ),
                                ],
                              );
                            },
                            child: IgnorePointer(
                              child: TextFormField(
                                enableSuggestions: false,
                                scribbleEnabled: false,
                                maxLength: 1,
                                focusNode: _focusNodes[index],
                                keyboardType:
                                    const TextInputType.numberWithOptions(),
                                controller: _textControllerList[index],
                                decoration: InputDecoration(
                                  counterText: "",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onChanged: (value) {
                                  if (value.length > 1) {
                                    _textControllerList[index].text = value[0];
                                  }
                                  if (value.isNotEmpty) {
                                    _moveFocusToNextField(index);
                                    setState(() {
                                      otp += value[0];
                                    });
                                  }
                                  print(
                                      '-----------------------------------------------> $otp');
                                  _checkOtp();
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                Text(
                  'Verified',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handlePaste(int index) async {
    // Get the clipboard data
    final ClipboardData? data = await Clipboard.getData('text/plain');
    print('OTP---------------> ${data}');

    if (data != null && data.text != null) {
      // Distribute each character to the corresponding text fields
      for (int i = 0; i < _otpList.length && i < data.text!.length; i++) {
        _textControllerList[i].text = data.text![i];
        otp += data.text![i];
        _moveFocusToNextField(i);
      }

      // Check OTP after pasting
      _checkOtp();
    }
  }

  void _checkOtp() {
    if (otp.length == widget.otpLength) {
      if (otp == "93447") {
        setState(() {
          otpSuccess = true;
        });
      } else {
        setState(() {
          otpSuccess = false;
        });
      }
    } else {
      setState(() {
        otpSuccess = null;
      });
    }
  }
}
