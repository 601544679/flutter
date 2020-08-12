import 'package:flutter/material.dart';

class floatButton extends StatefulWidget {
  @override
  _floatButtonState createState() => _floatButtonState();
}

class _floatButtonState extends State<floatButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.0,
      height: 55.0,
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: FloatingActionButton(
            child: Icon(
              Icons.add,
              size: 40.0,
            ),
            onPressed: () {
              myDialog(context);
            }),
      ),
      margin: EdgeInsets.only(top: 55.0),
    );
  }
}

int sendOrderNumber = 0;
String departure = '0';
String driverName = '0';

void myDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('输入任意信息查询'),
          content: Container(
              height: 200,
              child: Column(
                children: [
                  TextField(
                    onChanged: (v) {
                      sendOrderNumber = int.parse(v);
                      print(sendOrderNumber);
                    },
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: '请输入送货单号',
                    ),
                  ),
                  TextField(
                    onChanged: (v) {
                      departure = v;
                      print('城市：' + departure);
                    },
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: '请输入城市名',
                    ),
                  ),
                  TextField(
                    onChanged: (v) {
                      driverName = v;
                      print('司机：' + driverName);
                    },
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: '请输入司机名',
                    ),
                  )
                ],
              )),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('取消')),
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/detail', arguments: {
                    "ordernumber": sendOrderNumber,
                    "departure": departure,
                    "driverName": driverName
                  });
                },
                child: Text('确定')),
          ],
        );
      });
}
