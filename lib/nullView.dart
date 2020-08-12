import 'package:flutter/material.dart';

class nullView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [],
        ),
        SizedBox(
          height: 25.0,
        ),
        Center(
          child: Text(
            '空白页',
            style: TextStyle(
                backgroundColor: Colors.yellowAccent,
                decoration: TextDecoration.underline,
                fontStyle: FontStyle.italic,
                color: Colors.blueAccent,
                fontSize: 30.0),
          ),
        )
      ],
    );
  }
}
