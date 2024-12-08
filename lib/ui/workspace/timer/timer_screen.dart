import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/themes/dimension.dart';
import '../../extensions/extensions.dart';
import 'widgets/counter.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  final _rounds = ValueNotifier<int>(0);
  final _points = ValueNotifier<int>(0);
  final _stopwatch = Stopwatch();

  @override
  void dispose() {
    _rounds.dispose();
    _points.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: ClipRRect(
                borderRadius: Dimension.large.circularBottomBorder,
                child: ColoredBox(
                  color: context.colorScheme.surfaceContainer,
                  child: Padding(
                    padding: Dimension.large.horizontalPadding +
                        Dimension.small.bottomPadding,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Dimension.extraLarge.vertical,
                        TimeKeeper(stopwatch: _stopwatch),
                        Dimension.small.vertical,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Dedicado hoje',
                                  style: context.textTheme.labelLarge!.copyWith(
                                    color: context.colorScheme.onSurface,
                                  ),
                                ),
                                Text(
                                  '00:00:00',
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.titleLarge!.copyWith(
                                    color: context.colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Tempo total',
                                  style: context.textTheme.labelLarge!.copyWith(
                                    color: context.colorScheme.onSurface,
                                  ),
                                ),
                                Text(
                                  '00:00:00',
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.titleLarge!.copyWith(
                                    color: context.colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
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
                Text(
                  'Rodadas',
                  style: context.textTheme.titleLarge!.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
                Dimension.small.vertical,
                ValueListenableBuilder(
                  valueListenable: _rounds,
                  builder: (context, value, child) {
                    return Counter(
                      value: value,
                      onDecrement: () {
                        if (value < 1) return;
                        _rounds.value--;
                      },
                      onIncrement: () {
                        _rounds.value++;
                      },
                    );
                  },
                ),
                Dimension.larger.vertical,
                Text(
                  'Pontos',
                  style: context.textTheme.titleLarge!.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
                Dimension.small.vertical,
                ValueListenableBuilder(
                  valueListenable: _points,
                  builder: (context, value, child) {
                    return Counter(
                      value: value,
                      onDecrement: () {
                        if (value < 1) return;
                        _points.value--;
                      },
                      onIncrement: () {
                        _points.value++;
                      },
                    );
                  },
                ),
                Dimension.larger.vertical,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TimeKeeper extends StatefulWidget {
  final Stopwatch stopwatch;

  const TimeKeeper({
    super.key,
    required this.stopwatch,
  });

  @override
  State<TimeKeeper> createState() => _TimeKeeperState();
}

class _TimeKeeperState extends State<TimeKeeper> {
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
              final hours = value.inHours.toString().padLeft(2, '0');
              final minutes =
                  value.inMinutes.remainder(60).toString().padLeft(2, '0');
              final seconds =
                  value.inSeconds.remainder(60).toString().padLeft(2, '0');
              return Text(
                '$hours:$minutes:$seconds',
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
