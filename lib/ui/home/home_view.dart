import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routing/routes.dart';
import '../core/themes/dimension.dart';
import '../extensions/extensions.dart';
import 'home_viewmodel.dart';
import 'widgets/note.dart';
import 'widgets/titled_horizontal_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required this.viewModel,
  });

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: Dimension.small.allPadding,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Olá, SayCass!',
                style: context.textTheme.displaySmall,
              ),
              Dimension.medium.vertical,
              const Note(
                icon: Icons.timer_rounded,
                text: 'Seu tempo dedicado ao crochê hoje foi de 2h e 30min.',
              ),
              Dimension.medium.vertical,
              TitledHorizontalList(
                title: 'Seus projetos',
                onTap: () {
                  context.go(Routes.workspace.complete);
                },
                items: const [1, 2, 3, 4, 5],
              ),
              Dimension.medium.vertical,
              TitledHorizontalList(
                title: 'Explore novos projetos',
                onTap: () {
                  context.go(Routes.explore.complete);
                },
                items: const [1, 2, 3, 4, 5],
              ),
              Dimension.medium.vertical,
              const Note(
                icon: Icons.info_rounded,
                text: 'Novidades estão chegando! Continue acompanhando!',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
