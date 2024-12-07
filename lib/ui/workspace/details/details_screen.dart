import 'package:crochetime/ui/extensions/extensions.dart';
import 'package:crochetime/ui/home/home_screen.dart';
import 'package:flutter/material.dart';

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
            expandedHeight: 300.0,
            // floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Projeto 1',
                style: context.textTheme.titleLarge!.copyWith(
                  color: context.theme.colorScheme.primary,
                ),
              ),
              collapseMode: CollapseMode.pin,
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
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
                color: context.theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Descrição',
                    style: context.textTheme.titleLarge!.copyWith(
                      color: context.theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Progresso',
                    style: context.textTheme.titleLarge!.copyWith(
                      color: context.theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color:
                                context.theme.colorScheme.surfaceContainerHigh,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tempo total',
                                style: context.textTheme.labelLarge!.copyWith(
                                  color: context.theme.colorScheme.onSurface,
                                ),
                              ),
                              Text(
                                '04:00:00',
                                textAlign: TextAlign.center,
                                style: context.textTheme.titleLarge!.copyWith(
                                  color: context.theme.colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color:
                                context.theme.colorScheme.surfaceContainerHigh,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total de pontos',
                                style: context.textTheme.labelLarge!.copyWith(
                                  color: context.theme.colorScheme.onSurface,
                                ),
                              ),
                              Text(
                                '150',
                                textAlign: TextAlign.center,
                                style: context.textTheme.titleLarge!.copyWith(
                                  color: context.theme.colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color:
                                context.theme.colorScheme.surfaceContainerHigh,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ultima rodada',
                                style: context.textTheme.labelLarge!.copyWith(
                                  color: context.theme.colorScheme.onSurface,
                                ),
                              ),
                              Text(
                                '31',
                                textAlign: TextAlign.center,
                                style: context.textTheme.titleLarge!.copyWith(
                                  color: context.theme.colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color:
                                context.theme.colorScheme.surfaceContainerHigh,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ultima vez',
                                style: context.textTheme.labelLarge!.copyWith(
                                  color: context.theme.colorScheme.onSurface,
                                ),
                              ),
                              Text(
                                '12/12/2021',
                                textAlign: TextAlign.center,
                                style: context.textTheme.titleLarge!.copyWith(
                                  color: context.theme.colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Notas',
                    style: context.textTheme.titleLarge!.copyWith(
                      color: context.theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    minLines: 4,
                    maxLines: 20,
                    decoration: InputDecoration(
                      hintText: 'Digite suas notas aqui...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: context.theme.colorScheme.surfaceContainerHigh,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Referências',
                    style: context.textTheme.titleLarge!.copyWith(
                      color: context.theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '- Lorem ipsum dolor sit amet.',
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
