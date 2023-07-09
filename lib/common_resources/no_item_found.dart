import 'package:flutter/material.dart';

class NoitemFoundPage extends StatelessWidget {
  final String title;

  const NoitemFoundPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Image(
              image: AssetImage('assets/images/no_item.png'),
              height: 180,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("${title}")],
            ),
          ],
        ),
      ),
    );
  }
}
