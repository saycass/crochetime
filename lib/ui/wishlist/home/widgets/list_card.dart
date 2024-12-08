import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {

  final String title;
  const ListCard({super.key,
    this. title =' comprar linha amigurumi',
  });

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: ListTile(
        leading: IconButton(onPressed: () {},
            icon: Icon(Icons.check_box_outline_blank_outlined),
        ),
        title: Text(title),
      ),
    );
  }
}
