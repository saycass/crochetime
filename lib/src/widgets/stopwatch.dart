import 'dart:async';

import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  Duration duration = const Duration();
  Timer? timer;
  bool isRunning = false;

  @override
  void initState() {
    super.initState();

    // startTimer();
  }

  void addTime() {
    const addSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      duration = Duration(seconds: seconds);
    });
  }

  void startTimer() {
    setState(() {
      isRunning = true;
    });
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void stopTimer() {
    setState(() {
      isRunning = false;
    });
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    final hours = twoDigits(duration.inHours.remainder(60));

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      startTimer();
                    },
                    icon: Icon(
                      Icons.play_circle_outline_rounded,
                      color: Theme.of(context).colorScheme.onPrimary,
                      size: 44,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.07,
                  ),
                  Text(
                    '$hours:$minutes:$seconds',
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.07,
                  ),
                  IconButton(
                    onPressed: () {
                      if (isRunning) {
                        stopTimer();
                      }
                    },
                    icon: Icon(
                      Icons.pause_circle_outline_rounded,
                      color: Theme.of(context).colorScheme.onPrimary,
                      size: 44,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.04,
              ),
              Text(
                "Tempo de hoje: $hours:$minutes:$seconds",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
