import 'package:api_task/the_gig_search/utils/constants.dart';
import 'package:flutter/material.dart';

class SecondaryElevatedButton extends StatelessWidget {
  const SecondaryElevatedButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.borderRadius,
  });
  final Widget child;
  final void Function() onPressed;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          side: const BorderSide(
            color: Color(0xff747474),
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
