import 'dart:convert';

import 'package:api_task/cognota/models/task_model.dart';
import 'package:api_task/cognota/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageCognota extends StatefulWidget {
  const HomePageCognota({super.key});

  @override
  State<HomePageCognota> createState() => _HomePageCognotaState();
}

class _HomePageCognotaState extends State<HomePageCognota> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Tasks'),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            cNavKey.currentState!.pushNamed(Routes.createTaskPageRoute);
          },
        ),
        body: SafeArea(
          child: FutureBuilder(
            future: _tasksFuture(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List<TaskModel>? data = snapshot.data;

                return data != null && data.isNotEmpty
                    ? ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text('Title: ${data[index].title}'),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Description: ${data[index].description}'),
                                  Text('Date & Time: ${data[index].dateTime}'),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: Text('No Tasks present'),
                      );
              } else if (snapshot.hasError) {
                print('Error: ${snapshot.error}');
                return const Center(
                  child: Text('Something went wrong'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<List<TaskModel>> _tasksFuture() async {
    final sharedPref = await SharedPreferences.getInstance();
    final tasks = sharedPref.getString('tasks');
    print('tasks: ${tasks}');
    final List<dynamic> list = await jsonDecode(tasks.toString()) ?? [];
    print('list: ${list}');
    final res = TaskModel.fromJsonList(list);
    print('res: ${res}');
    return res;
  }
}
