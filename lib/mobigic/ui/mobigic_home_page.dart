import 'dart:math';

import 'package:api_task/mobigic/providers/grid_provider.dart';
import 'package:api_task/mobigic/routes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class MobigicHomePage extends StatefulWidget {
  const MobigicHomePage({super.key});

  @override
  State<MobigicHomePage> createState() => _MobigicHomePageState();
}

class _MobigicHomePageState extends State<MobigicHomePage> {
  int m = 4;
  int n = 3;
  List<List<String>> _grid = [];
  late TextEditingController _searchTextController;
  List<List<int>> result = [];

  @override
  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
    _grid = context.read<GridProvider>().getCharGrid();
  }

  @override
  void dispose() {
    super.dispose();
    _searchTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobigic Grid'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              controller: _searchTextController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      result =
                          getWordIndices(_grid, _searchTextController.text);
                    });
                    if (result.isEmpty) {
                      Fluttertoast.showToast(
                        msg: 'Word Not found',
                      );
                    }
                    print('result: $result');
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
            if (_grid.isNotEmpty)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: GridView.builder(
                      itemCount: (_grid[0].length * _grid.length),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 5,
                        crossAxisCount: _grid[0].length,
                      ),
                      itemBuilder: (context, index) {
                        int row = index ~/ _grid[0].length;
                        int col = index % _grid[0].length;
                        final indexList = [row, col];
                        return Card(
                          color: contains(indexList) ? Colors.blue : null,
                          child: Container(
                            // margin: const EdgeInsets.all(1),
                            // color: contains(indexList) ? Colors.blue : null,
                            child: Center(
                              child: Text(
                                _grid[row][col],
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                navKey.currentState?.pushNamed(Routes.rowAndColumnPageRoute);
              },
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }

  bool contains(List<int> list) {
    if (result.isEmpty) return false;
    for (int i = 0; i < result.length; i++) {
      if (result[i][0] == list[0] && result[i][1] == list[1]) return true;
    }
    return false;
  }

  List<List<int>> getWordIndices(List<List<String>> grid, String word) {
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[0].length; j++) {
        String char = grid[i][j];

        int right = grid[0].length - j;
        int bottom = grid.length - i;
        int diagonal = min(right, bottom);
        int wordLength = word.length;

        if (char.toLowerCase() == word[0].toLowerCase() &&
            right >= wordLength) {
          final res = horizontalSearch(row: i, col: j, word: word);
          if (res.isNotEmpty) {
            return res;
          }
        }
        if (char.toLowerCase() == word[0].toLowerCase() &&
            bottom >= wordLength) {
          final res = verticalSearch(row: i, col: j, word: word);
          if (res.isNotEmpty) {
            return res;
          }
        }
        if (char.toLowerCase() == word[0].toLowerCase() &&
            diagonal >= wordLength) {
          final res = diagonalSearch(row: i, col: j, word: word);
          if (res.isNotEmpty) {
            return res;
          }
        }
      }
    }
    return [];
  }

  List<List<int>> horizontalSearch({
    required int row,
    required int col,
    required String word,
  }) {
    List<List<int>> res = [];
    String str = '';
    int r = row;
    int c = col;

    while (c < (word.length + col)) {
      str += _grid[r][c];
      res.add([r, c]);
      if (str.toLowerCase() == word.toLowerCase()) {
        return res;
      }
      c++;
    }
    return [];
  }

  List<List<int>> verticalSearch({
    required int row,
    required int col,
    required String word,
  }) {
    List<List<int>> res = [];
    String str = '';
    int r = row;
    int c = col;

    while (r < (word.length + row)) {
      str += _grid[r][c];
      res.add([r, c]);
      if (str.toLowerCase() == word.toLowerCase()) {
        return res;
      }

      r++;
    }
    return [];
  }

  List<List<int>> diagonalSearch({
    required int row,
    required int col,
    required String word,
  }) {
    List<List<int>> res = [];
    String str = '';
    int r = row;
    int c = col;

    while (r < (word.length + row)) {
      str += _grid[r][c];
      res.add([r, c]);
      if (str.toLowerCase() == word.toLowerCase()) {
        print('Mastched: $str == $word');
        return res;
      }
      r++;
      c++;
    }
    return [];
  }
}
