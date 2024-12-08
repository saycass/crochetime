import 'package:flutter/material.dart';

import '../core/themes/dimension.dart';
import '../extensions/extensions.dart';
import 'widgets/counter.dart';
import 'widgets/stop_watch.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({
    super.key,
    required this.id,
  });

  final String id;

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
    return CustomScrollView(
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
                      StopWatch(stopwatch: _stopwatch),
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
    );
  }
}
