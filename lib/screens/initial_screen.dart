import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/task_card.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool hideList = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
        leading: Container(),
      ),
      body: AnimatedOpacity(
        opacity: hideList ? 0 : 1,
        duration: const Duration(milliseconds: 250),
        child: ListView(
          children: const [
            TaskCard(
              name:
                  'Aprender Fluttersssssssssssssssssssssssssssss ssssssssssssssss',
              difficulty: 4,
              avatar:
                  'https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png',
            ),
            TaskCard(
              name: 'Andar de bike',
              difficulty: 2,
              avatar:
                  'https://cdn.autopapo.com.br/box/uploads/2023/01/14160714/capa-foto-felipe-cunha-.png',
            ),
            TaskCard(
              name: 'Meditar',
              difficulty: 5,
              avatar:
                  'https://organicsnewsbrasil.com.br/wp-content/uploads/2016/04/benef%C3%ADcios-da-ioga.jpg',
            ),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            hideList = !hideList;
          });
        },
        child: hideList
            ? const Icon(Icons.visibility)
            : const Icon(Icons.visibility_off),
      ),
    );
  }
}
