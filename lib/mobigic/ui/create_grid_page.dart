import 'package:api_task/mobigic/providers/grid_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateGridPage extends StatefulWidget {
  const CreateGridPage({super.key});

  @override
  State<CreateGridPage> createState() => _CreateGridPageState();
}

class _CreateGridPageState extends State<CreateGridPage> {
  List<String> _grid = [];
  final TextEditingController _gridCharsController = TextEditingController();
  String text = '';
  int _rows = 0;
  int _cols = 0;

  @override
  void initState() {
    super.initState();
    _rows = context.read<GridProvider>().getRows();
    _cols = context.read<GridProvider>().getCols();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobigic'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.next_plan),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              controller: _gridCharsController,
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
                          text[index],
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
