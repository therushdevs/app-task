import 'dart:convert';

import 'package:api_task/cognota/models/task_model.dart';
import 'package:api_task/cognota/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({super.key});

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _dateController;
  DateTime? _pickedDate;
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _dateController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _formKey.currentState?.dispose();
    _dateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add/Update'),
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 15),
                    child: TextFormField(
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Title cannot be empty";
                        }
                        return null;
                      },
                      controller: _titleController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 15),
                    child: TextFormField(
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Title cannot be empty";
                        }
                        return null;
                      },
                      controller: _descriptionController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        alignLabelWithHint: true,
                        labelText: 'Descriotion',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 15),
                    child: TextFormField(
                      validator: (val) {
                        if (_dateController.text.isEmpty) {
                          return "Date cannot be empty";
                        }
                        return null;
                      },
                      controller: _dateController,
                      onChanged: (val) {},
                      maxLines: 3,
                      decoration: const InputDecoration(
                        alignLabelWithHint: true,
                        labelText: 'Date & Time',
                        border: OutlineInputBorder(),
                      ),
                      onTap: () async {
                        _pickedDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2050),
                        );
                        _dateController.text = _pickedDate.toString();
                      },
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await _saveTaskToPref();
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveTaskToPref() async {
    final sharedPref = await SharedPreferences.getInstance();
    final taskModel = TaskModel(
      title: _titleController.text,
      description: _descriptionController.text,
      dateTime: _pickedDate ?? DateTime.now(),
    ).toJson();
    final string = sharedPref.getString('tasks');
    final List<dynamic> listOld = jsonDecode(string.toString()) ?? [];
    final List<dynamic> list = listOld;
    list.add(taskModel);
    await sharedPref.setString('tasks', jsonEncode(list));
    // navigate after saving
    cNavKey.currentState!
        .pushNamedAndRemoveUntil(Routes.homePageRoute, (route) => false);
  }
}
