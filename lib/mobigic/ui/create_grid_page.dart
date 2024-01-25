import 'package:api_task/mobigic/providers/grid_provider.dart';
import 'package:api_task/mobigic/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateGridPage extends StatefulWidget {
  const CreateGridPage({super.key});

  @override
  State<CreateGridPage> createState() => _CreateGridPageState();
}

class _CreateGridPageState extends State<CreateGridPage> {
  List<String> _grid = [];
  String text = '';
  int _rows = 0;
  int _cols = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _rows = context.read<GridProvider>().getRows();
    _cols = context.read<GridProvider>().getCols();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mobigic'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              context.read<GridProvider>().gridConversion(text.toUpperCase());
              navKey.currentState?.pushNamedAndRemoveUntil(
                Routes.homePageRoute,
                (route) => false,
              );
            }
          },
          child: const Icon(Icons.skip_next),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Cannot be Empty...";
                  } else if (value!.length < (_rows * _cols)) {
                    return "add more ${(_rows * _cols) - value.length} characters";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                maxLength: (_rows * _cols),
                onChanged: (val) {
                  setState(() {
                    text = val;
                  });
                },
              ),
              if (text.isNotEmpty)
                Expanded(
                  child: GridView.builder(
                      itemCount: text.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 5,
                        crossAxisCount: _cols,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(4),
                          color: Colors.blue,
                          child: Center(
                            child: Text(
                              text[index].toUpperCase(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
