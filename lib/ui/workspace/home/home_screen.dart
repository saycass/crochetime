import 'widgets/project_card.dart';
import 'package:flutter/material.dart';
import '../../core/themes/dimension.dart';
import '../../extensions/extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seus projetos',
          style: TextStyle(
            color: context.colorScheme.primary,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_circle_sharp,
              )),
        ],
      ),
      body: ListView.builder(
        padding: Dimension.medium.allPadding,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: Dimension.small.verticalPadding,
            child: ProjectCard(
              title: 'Projeto  ${index + 1}',
            ),
          );
        },
      ),
    );
  }
}
