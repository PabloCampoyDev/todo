import 'package:flutter/material.dart';

import 'models/item.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  //const HomePage({Key? key}) : super(key: key);

  var items = <Item>[];

  HomePage({Key? key}) : super(key: key) {
    items = [];
    items.add(Item(title: "Banana", done: false));
    items.add(Item(title: "Maça", done: true));
    items.add(Item(title: "Abacaxi", done: false));
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo list"),
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = widget.items[index];
          return CheckboxListTile(
            title: Text(item.title!),
            key: Key(item.title!),
            value: item.done,
            onChanged: (value) {
              setState(
                () {
                  item.done = value;
                },
              ); // setState
            }, // onChanged
          );
        },
      ),
    );
  }
}
