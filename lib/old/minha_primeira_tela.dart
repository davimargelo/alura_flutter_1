import 'package:flutter/material.dart';

@Deprecated('Apenas a primeira tela ja feita')
class MyFirstWidget extends StatelessWidget {
  const MyFirstWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                color: Colors.red,
                height: 100,
                width: 100,
              ),
              Container(
                color: Colors.blue,
                height: 50,
                width: 50,
              ),
            ],
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                color: Colors.blue,
                height: 100,
                width: 100,
              ),
              Container(
                color: Colors.red,
                height: 50,
                width: 50,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: const Color.fromRGBO(50, 200, 250, 1),
                height: 50,
                width: 50,
              ),
              Container(
                color: Colors.pinkAccent,
                height: 50,
                width: 50,
              ),
              Container(
                color: Colors.purple,
                height: 50,
                width: 50,
              ),
            ],
          ),
          Container(
            color: Colors.amber,
            height: 30,
            width: 300,
            child: const Text(
              'Diamante Amarelo',
              style: TextStyle(color: Colors.black, fontSize: 28),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                print('Pertou');
              },
              child: const Text('Aperte o botão'))
        ],
      ),
    );
  }
}
