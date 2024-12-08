import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/routes.dart';
import '../../core/themes/dimension.dart';
import '../../extensions/extensions.dart';
import 'widgets/progress_card.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Projeto 1',
                style: context.textTheme.titleLarge!.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
              collapseMode: CollapseMode.pin,
              background: ClipRRect(
                borderRadius: Dimension.large.circularBottomBorder,
                child: Image.network(
                  randomImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: Dimension.large.circularBorder,
              ),
              padding: Dimension.medium.allPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Descrição',
                    style: context.textTheme.titleLarge!.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                  Dimension.small.vertical,
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  Dimension.small.vertical,
                  Text(
                    'Progresso',
                    style: context.textTheme.titleLarge!.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                  Dimension.small.vertical,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const ProgressCard(
                          label: 'Tempo dedicado',
                          value: '10h 30m',
                        ),
                        Dimension.small.horizontal,
                        const ProgressCard(
                          label: 'Total de pontos',
                          value: '323',
                        ),
                        Dimension.small.horizontal,
                        const ProgressCard(
                          label: 'Ultima rodada',
                          value: '31',
                        ),
                        Dimension.small.horizontal,
                        const ProgressCard(
                          label: 'Ultima vez',
                          value: '31/12/2021',
                        ),
                        Dimension.small.horizontal,
                      ],
                    ),
                  ),
                  Dimension.small.vertical,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Notas',
                        style: context.textTheme.titleLarge!.copyWith(
                          color: context.colorScheme.primary,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.save_outlined),
                      ),
                    ],
                  ),
                  Dimension.smaller.vertical,
                  TextFormField(
                    minLines: 4,
                    maxLines: 20,
                    decoration: InputDecoration(
                      hintText: 'Digite suas notas aqui...',
                      border: OutlineInputBorder(
                        borderRadius: Dimension.small.circularBorder,
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: context.colorScheme.surfaceContainerHigh,
                    ),
                  ),
                  Dimension.small.vertical,
                  Text(
                    'Referências',
                    style: context.textTheme.titleLarge!.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                  Dimension.small.vertical,
                  Text(
                    '- Lorem ipsum dolor sit amet.',
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  Dimension.extraLarge.vertical,
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go(Routes.workspaceTimer.withId('id'));
        },
        child: const Icon(Icons.timer),
      ),
    );
  }
}
