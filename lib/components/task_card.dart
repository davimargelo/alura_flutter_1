import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/difficulty_stars.dart';

class TaskCard extends StatefulWidget {
  final String name;
  final String avatar;
  final int difficulty;

  const TaskCard(
      {Key? key,
      required this.name,
      required this.avatar,
      required this.difficulty})
      : super(key: key);

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
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(4)),
                    ),
                    width: 72,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.network(widget.avatar, fit: BoxFit.cover),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          widget.name,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 24, overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      DifficultyStars(difficultyLevel: widget.difficulty)
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    width: 90,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            level++;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.arrow_drop_up),
                            Text(
                              'Level up!',
                              textAlign: TextAlign.center,
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: getLinearProgressStatus() >= 1 &&
                          getLinearProgressStatus() < 2
                      ? Colors.green
                      : getLinearProgressStatus() >= 2 &&
                              getLinearProgressStatus() < 3
                          ? Colors.orange
                          : getLinearProgressStatus() >= 3
                              ? Colors.black
                              : Colors.blue,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4))),
              height: 40,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: 200,
                            child: LinearProgressIndicator(
                              color: Colors.white,
                              value: min(
                                  getLinearProgressStatus() -
                                      getLinearProgressStatus().truncate(),
                                  1),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text('M${getLinearProgressStatus().truncate()}',
                              style: const TextStyle(color: Colors.white)),
                        )
                      ],
                    ),
                    Text(
                      'Nível ${masterLevel()}',
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

  int masterLevel() {
    const int maxToResetMastery = 3;

    return (level -
            (getLinearProgressStatus().truncate() > 0 &&
                    getLinearProgressStatus() >=
                        getLinearProgressStatus().truncate()
                ? (min(getLinearProgressStatus().truncate(),
                        maxToResetMastery) *
                    (level / getLinearProgressStatus()))
                : 0))
        .toInt();
  }

  double getLinearProgressStatus() {
    return (level / (widget.difficulty > 0 ? widget.difficulty : 1)) / 10;
  }
}
