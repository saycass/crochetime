import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/themes/dimension.dart';
import '../../../extensions/extensions.dart';

class StopWatch extends StatefulWidget {
  final Stopwatch stopwatch;

  const StopWatch({
    super.key,
    required this.stopwatch,
  });

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch>
    with SingleTickerProviderStateMixin {
  final _elapsedTime = ValueNotifier(Duration.zero);
  final _isRunning = ValueNotifier(false);
  Timer? _timer;
  late AnimationController _controller;

  get _stopwatch => widget.stopwatch;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(minutes: 1),
    );
  }

  void _start() {
    _isRunning.value = true;
    _stopwatch.start();
    _controller.repeat();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _elapsedTime.value = _stopwatch.elapsed;
    });
  }

  void _stop() {
    _isRunning.value = false;
    _stopwatch.stop();
    _controller.stop();
    _timer?.cancel();
  }

  @override
  void dispose() {
    _elapsedTime.dispose();
    _isRunning.dispose();
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 164,
          width: 170,
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: Dimension.small.bottomPadding,
                  child: ValueListenableBuilder(
                    valueListenable: _elapsedTime,
                    builder: (context, value, _) {
                      return Text(
                        value.formatted,
                        style: context.textTheme.displaySmall,
                      );
                    },
                  ),
                ),
              ),
              Center(
                child: ValueListenableBuilder(
                  valueListenable: _isRunning,
                  builder: (context, value, child) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: value ? SizedBox.shrink(key: UniqueKey()) : child,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.colorScheme.surfaceContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.play_circle,
                      size: Dimension.extraLarge.size,
                      shadows: [
                        BoxShadow(
                          color: context.colorScheme.shadow.withOpacity(0.5),
                          offset: const Offset(0, 2),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: ValueListenableBuilder(
                    valueListenable: _elapsedTime,
                    builder: (context, value, _) {
                      return GestureDetector(
                        onTap: () {
                          if (_isRunning.value) return _stop();
                          _start();
                        },
                        child: AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            return CircularProgressIndicator(
                              value: _controller.value,
                              strokeWidth: 10,
                              valueColor: AlwaysStoppedAnimation(
                                context.colorScheme.primary,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
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
