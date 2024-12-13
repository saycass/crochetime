import 'package:flutter/material.dart';

import '../../core/themes/dimension.dart';
import '../../extensions/extensions.dart';

class CreateView extends StatelessWidget {
  const CreateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crie seu projeto'),
      ),
      body: Padding(
        padding: Dimension.small.allPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Título',
              style: context.textTheme.titleLarge!,
            ),
            Dimension.small.vertical,
            TextFormField(
              minLines: 1,
              maxLines: 2,
              decoration: const InputDecoration(
                hintText: 'Aqui vai o título',
              ),
            ),
            Dimension.small.vertical,
            Text(
              'Descrição',
              style: context.textTheme.titleLarge!,
            ),
            Dimension.small.vertical,
            TextFormField(
              minLines: 1,
              maxLines: 2,
              decoration: const InputDecoration(
                hintText: 'E aqui vai descrição',
              ),
            ),
            Dimension.small.vertical,
            Text(
              'Referencias',
              style: context.textTheme.titleLarge!,
            ),
            Dimension.small.vertical,
            TextFormField(
              minLines: 1,
              maxLines: 2,
              decoration: const InputDecoration(
                hintText: 'Link de receitas ou vídeos',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save),
      ),
    );
  }
}
