import 'package:crochetime/src/views/timer_container_screen.dart';
import 'package:flutter/material.dart';

class CrochetPatternCard extends StatelessWidget {
  const CrochetPatternCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.amber,
      width: 500,
      child: Card(
        child: Container(
          height: 50,
          color: Colors.blue,
          // child: Column(
          //   children: [
          //     Container(
          //       height: 200,
          //       decoration: BoxDecoration(
          //         borderRadius: const BorderRadius.only(
          //           topRight: Radius.circular(10),
          //           topLeft: Radius.circular(10),
          //         ),
          //         color: Theme.of(context).colorScheme.secondary,
          //       ),
          //     ),
          //     // Container(
          //     //   color: Colors.red,
          //     //   padding: const EdgeInsets.all(8),
          //     //   child: Column(
          //     //     crossAxisAlignment: CrossAxisAlignment.stretch,
          //     //     children: [
          //     //       Text(
          //     //         'Título do projeto',
          //     //         maxLines: 1,
          //     //         overflow: TextOverflow.ellipsis,
          //     //         style: TextStyle(
          //     //           fontSize: 16,
          //     //           color: Theme.of(context).colorScheme.onSurfaceVariant,
          //     //         ),
          //     //       ),
          //     //       const SizedBox(height: 8),
          //     //       const Text(
          //     //         'Pequena descricao sobre o projeto',
          //     //         style: TextStyle(
          //     //           fontSize: 10,
          //     //         ),
          //     //       ),
          //     //       const SizedBox(
          //     //         height: 8,
          //     //       ),
          //     //       ElevatedButton(
          //     //         onPressed: () {
          //     //           Navigator.of(context).push(
          //     //             MaterialPageRoute(
          //     //               builder: (context) => const TimerContainerScreen(),
          //     //             ),
          //     //           );
          //     //         },
          //     //         child: Text(
          //     //           'INICIAR',
          //     //           style: TextStyle(
          //     //             color: Theme.of(context).colorScheme.onSurface,
          //     //           ),
          //     //         ),
          //     //       ),
          //     //     ],
          //     //   ),
          //     // ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
