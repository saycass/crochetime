import 'package:flutter/material.dart';

class CreateItem extends StatelessWidget {
  const CreateItem({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body:
        Column (
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height *0.3,
              width:  MediaQuery.of(context).size.width*1,
              color: Theme.of(context).colorScheme.secondaryContainer,
              child: const Text("Create your new Project",
                style: TextStyle (
                  fontSize: 15,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40, right: 40, top: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( " Title",
                    style:  TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  TextField(
                    decoration:  InputDecoration (
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox( height: 30),
                  Text( " Description of your project",
                    style:  TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  TextField(
                    decoration:  InputDecoration (
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            )
          ],

        ),
    );
  }
}
