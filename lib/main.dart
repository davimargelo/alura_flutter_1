import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tarefas'),
        ),
        body: ListView(
          children: const [
            TaskCard(
                'Aprender Fluttersssssssssssssssssssssssssssss ssssssssssssssss'),
            TaskCard('Andar de bike'),
            TaskCard('Meditar'),
          ],
        ),
        // floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}

class TaskCard extends StatefulWidget {
  final String name;

  const TaskCard(this.name, {Key? key}) : super(key: key);

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  int level = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.grey,
                    width: 72,
                    height: 100,
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      widget.name,
                      style: const TextStyle(
                          fontSize: 24, overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          level++;
                        });
                      },
                      child: const Icon(Icons.arrow_drop_up))
                ],
              ),
            ),
            Container(
              color: Colors.blue,
              height: 40,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: min(level / 10, 10),
                        )),
                    Text(
                      'Nível $level',
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
