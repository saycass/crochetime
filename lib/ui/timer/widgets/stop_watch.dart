import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/themes/dimension.dart';
import '../../extensions/extensions.dart';

class StopWatch extends StatefulWidget {
  final Stopwatch stopwatch;

  const StopWatch({
    super.key,
    required this.stopwatch,
  });

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  final _elapsedTime = ValueNotifier(Duration.zero);
  final _isRunning = ValueNotifier<bool>(false);
  Timer? _timer;

  get _stopwatch => widget.stopwatch;

  void _start() {
    _isRunning.value = true;
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _elapsedTime.value = _stopwatch.elapsed;
    });
  }

  void _stop() {
    _isRunning.value = false;
    _stopwatch.stop();
    _timer?.cancel();
  }

  @override
  void dispose() {
    _elapsedTime.dispose();
    _isRunning.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: Dimension.small.bottomPadding,
          child: ValueListenableBuilder(
            valueListenable: _elapsedTime,
            builder: (context, value, _) {
              return Text(
                value.formatted,
                style: context.textTheme.displayLarge!.copyWith(
                  color: context.colorScheme.primary,
                ),
              );
            },
          ),
        ),
        IconButton(
          onPressed: () {
            if (_isRunning.value) return _stop();
            _start();
          },
          icon: ValueListenableBuilder(
            valueListenable: _isRunning,
            builder: (_, value, __) {
              final icon = value
                  ? Icons.pause_circle_outline_rounded
                  : Icons.play_circle_outline_rounded;
              return Icon(icon, size: Dimension.extraLarge.size);
            },
          ),
        ),
      ],
    );
  }
}

extension on Duration {
  String get formatted {
    final hours = inHours.toString().padLeft(2, '0');
    final minutes = inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }
}
