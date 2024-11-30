import 'package:flutter/material.dart';

import '../widgets/round_container.dart';
import '../widgets/stopwatch.dart';

class TimerContainerScreen extends StatefulWidget {
  const TimerContainerScreen({super.key});

  @override
  State<TimerContainerScreen> createState() => _TimerContainerScreenState();
}

class _TimerContainerScreenState extends State<TimerContainerScreen> {
  int pointTotal = 0;
  int roundTotal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            size: 24,
            color: Color(0xFF7C0515),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.3,
            child: const StopWatch(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 24,
              left: 24,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.07,
                ),
              ],
            ),
          ),
          RoundContainer(
            label: 'Número de pontos',
            value: pointTotal.toString(),
            onIncrement: () {
              setState(() {
                pointTotal = pointTotal + 1;
              });
            },
            onDecrement: () {
              if (pointTotal == 0) return;
              setState(() {
                pointTotal = pointTotal - 1;
              });
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.07,
          ),
          RoundContainer(
            label: 'Número de rodadas',
            value: roundTotal.toString(),
            onIncrement: () {
              setState(() {
                roundTotal = roundTotal + 1;
              });
            },
            onDecrement: () {
              if (roundTotal == 0) return;
              setState(() {
                roundTotal = roundTotal - 1;
              });
            },
          ),
        ],
      ),
    );
  }
}
