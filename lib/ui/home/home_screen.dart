import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routing/routes.dart';
import '../extensions/extensions.dart';
import 'home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.viewModel,
  });

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Olá, SayCass!',
                style: context.textTheme.displayMedium,
              ),
              const SizedBox(height: 28),
              const Note(
                icon: Icons.timer_rounded,
                text: 'Seu tempo dedicado ao crochê hoje foi de 2h e 30min.',
              ),
              const SizedBox(height: 24),
              TitledHorizontalList(
                title: 'Seus projetos',
                onTap: () => context.go(Routes.workspace),
                items: const [1, 2, 3, 4, 5],
              ),
              const SizedBox(height: 24),
              TitledHorizontalList(
                title: 'Explore novos projetos',
                onTap: () => context.go(Routes.explore),
                items: const [1, 2, 3, 4, 5],
              ),
              const SizedBox(height: 24),
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

class TitledHorizontalList extends StatelessWidget {
  final List items;
  final String title;
  final VoidCallback onTap;

  const TitledHorizontalList({
    super.key,
    required this.title,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InkWell(
              onTap: onTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: context.textTheme.headlineMedium!.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 200,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      randomImage,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String get randomImage {
  final random = Random();
  final images = [
    'https://i.pinimg.com/736x/6a/27/0d/6a270df6ca56ee87a01700fc80e6fae7.jpg',
    'https://i.pinimg.com/736x/83/c5/dc/83c5dcba28b4dbe5cfea87f9df25bc39.jpg',
    'https://i.pinimg.com/736x/00/44/96/0044960c9934cfa0ccb068000db688c8.jpg',
  ];
  return images[random.nextInt(images.length)];
}

class Note extends StatelessWidget {
  final IconData icon;
  final String text;

  const Note({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: context.colorScheme.onTertiaryContainer,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              text,
              style: context.textTheme.labelLarge!.copyWith(
                color: context.colorScheme.onTertiaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
