import 'package:flutter/material.dart';
import 'textStyle.dart';
import 'isFinish.dart';
Column homepage(int a){
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  if (a == 0)
                    Text(
                      '正在进行',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  if (a == 1)
                    Text(
                      '已完成',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  if (a == 2)
                    Text(
                      '所有送货单',
                      style: TextStyle(fontSize: 20.0),
                    ),
                ],
              ))
        ],
      ),
      SizedBox(
        height: 25.0,
      ),
      Expanded(
          child: ListView(
            children: [bu(a)],
          ))
    ],
  );
}