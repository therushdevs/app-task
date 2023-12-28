import 'package:flutter/material.dart';

class DividerPartWidget extends StatelessWidget {
  const DividerPartWidget({
    super.key,
    required this.markChecked,
  });
  final bool markChecked;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 4.0, left: 2),
        child: Divider(
          thickness: 3,
          color: markChecked ? Colors.green : Colors.grey,
        ),
      ),
    );
  }
}
