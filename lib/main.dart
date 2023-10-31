import 'package:flutter/material.dart';
import 'package:my_app/widget/card_body_widget.dart';
import 'package:my_app/widget/card_model_button.dart';
import 'package:my_app/modal/items.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.black,
        ),
        home: const MyApp(),
      )
  );
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<DateItems> items = [];

  void _handleAddTask(String name) {
    final newItem = DateItems(id: DateTime.now().toString(), name: name);
    setState(() {
      items.add(newItem);
    });
  }

  void _handleDeleteTask(String id) {
    setState(() {
      items.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDoList', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: items.map((item) => CarBodyWidget(
              index : items.indexOf(item),
              item: item,
              handleDelete: _handleDeleteTask
          )).toList(),
        )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, size: 30),
        onPressed: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
            return ModelButton(addTask : _handleAddTask);
          });
        },
      ),
    );
  }
}

