import 'package:api_task/finmapp(airpay)/widgets/divider_part_wodget.dart';
import 'package:flutter/material.dart';

class ProgressLineWidget extends StatelessWidget {
  const ProgressLineWidget({
    super.key,
    required this.value,
    required this.n,
  });
  final double value;
  final int n;

  @override
  Widget build(BuildContext context) {
    final List<DividerPartWidget> arr = [];
    for (int i = 1; i <= n; i++) {
      arr.add(
        DividerPartWidget(
          markChecked: value >= i ? true : false,
        ),
      );
    }
    return Row(
      children: arr,
    );
  }
}
