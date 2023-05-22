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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            TaskCard('Aprender Flutter'),
            TaskCard('Andar de bike'),
            TaskCard('Meditar'),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}


class TaskCard extends StatelessWidget {
  final String name;
  const TaskCard(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  color: Colors.red,
                  width: 72,
                  height: 100,
                ),
                Text(name),
                ElevatedButton(
                    onPressed: (){},
                    child: const Icon(Icons.arrow_drop_up))
              ],
            ),
          ),
          Container(
            color: Colors.blue,
            height: 40,
          )
        ],
      ),
    );
  }
}
