import 'package:api_task/mobigic/providers/grid_provider.dart';
import 'package:api_task/mobigic/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RowsAndColumnsInputPage extends StatefulWidget {
  const RowsAndColumnsInputPage({super.key});

  @override
  State<RowsAndColumnsInputPage> createState() =>
      _RowsAndColumnsInputPageState();
}

class _RowsAndColumnsInputPageState extends State<RowsAndColumnsInputPage> {
  String _rows = '';
  String _cols = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              context.read<GridProvider>().setRowsAndColumns(_rows, _cols);
              navKey.currentState?.pushNamed(Routes.createGridPageRoute);
            }
          },
          child: const Icon(Icons.skip_next),
        ),
        appBar: AppBar(
          title: const Text('Mobigic'),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _namedInputField(
                title: 'Enter number of rows:',
                isRow: true,
              ),
              _namedInputField(
                title: 'Enter number of columns:',
                isRow: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _namedInputField({
    required String title,
    required bool isRow,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              title,
              textAlign: TextAlign.left,
            ),
          ),
          TextFormField(
            maxLength: 2,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              counterText: "",
            ),
            validator: (val) {
              if (val != null && val.isEmpty) {
                return 'Cannot be empty';
              }
              return null;
            },
            onChanged: (val) {
              setState(() {
                isRow ? _rows = val : _cols = val;
              });
            },
          ),
        ],
      ),
    );
  }
}
