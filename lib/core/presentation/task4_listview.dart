import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Task4ListView extends StatefulWidget {
  const Task4ListView({super.key});

  @override
  State<StatefulWidget> createState() => _Task4ListViewState();
}

class _Task4ListViewState extends State<Task4ListView> {
  List<String> elements = [
    "1st element",
    "2nd element",
    "3rd element",
    "4th element",
    "5th element",
    "6th element",
    "7th element",
    "8th element",
    "9th element",
    "10th element",
    "11th element",
    "12th element",
    "13th element",
    "14th element",
    "15th element",
    "16th element",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView with deletion'),
      ),
      body: ListView.builder(
        itemCount: elements.length,
        itemBuilder: (ctx, idx) {
          return ListTile(
            key: ValueKey(elements[idx]),
            title: Text(elements[idx]),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    elements.removeAt(idx);
                  });
                },
                icon: const Icon(Icons.delete_forever)),
          );
        },
      ),
    );
  }
}
