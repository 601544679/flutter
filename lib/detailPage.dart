import 'package:flutter/material.dart';
import 'textStyle.dart';
import 'logisticsInformation.dart';

class detailPage extends StatelessWidget {
  final orderNumber;
  final departure;
  final driverName;

  detailPage({this.orderNumber, this.departure, this.driverName});

  @override
  Widget build(BuildContext context) {
    int number = orderNumber != null ? orderNumber['ordernumber'] : 0;
    String dp = departure != null ? departure['departure'] : "0";
    String drname = driverName != null ? driverName['driverName'] : "0";
    print(number.runtimeType);
    print(dp.runtimeType);
    print(drname.runtimeType);
    print(number.toString() + '哈哈');
    print('详细城市' + dp);
    print('详细司机' + drname);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('详细'),
        ),
        body: Column(
          children: [
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  '返回',
                  style: TextStyle(color: Colors.black,fontSize: 22.0,),
                )),
            Expanded(
                child: ListView(
              children: [
                bu(
                    number: number,
                    departure: dp,
                    driverName: drname,
                    context: context),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

Widget bu(
    {int number, String departure, String driverName, BuildContext context}) {
  List<Widget> ll = [];
  Widget content;
  for (var e in ff()) {
    if (e.orderNumber == number ||
        e.Departure == departure ||
        e.destination == departure ||
        e.driverName == driverName) {
      ll.add(Card(
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  textStyle(s: '送货单号：', size: 20.0),
                  textStyle(s: e.orderNumber.toString(), size: 20.0)
                ],
              ),
              SizedBox(height: 15.0),
              Row(
                children: [
                  Expanded(
                      child: textStyle(
                          s: e.Departure, size: 25.0, align: TextAlign.center)),
                  Expanded(
                      child: textStyle(
                          s: '状态', size: 18.0, align: TextAlign.center)),
                  Expanded(
                      child: textStyle(
                          s: e.destination,
                          size: 25.0,
                          align: TextAlign.center)),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              SizedBox(height: 15.0),
              Row(
                children: [
                  Expanded(
                      child: textStyle(
                          s: '司机：' + e.driverName,
                          size: 17.0,
                          align: TextAlign.center)),
                  Expanded(
                      child: Column(
                    children: [
                      textStyle(
                          s: e.state,
                          size: 15.0,
                          align: TextAlign.center,
                          color: e.state == '运输中' ? Colors.red : Colors.green),
                      Container(
                          height: 30,
                          width: 55.0,
                          child: Expanded(
                              child: Image.asset(
                            "images/arrow.png",
                            fit: BoxFit.fill,
                          )))
                    ],
                  )),
                  Expanded(
                      child: textStyle(
                          s: '项目：' + e.projectName,
                          size: 17.0,
                          align: TextAlign.center)),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [textStyle(s: '送货单信息', size: 18.0)],
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  textStyle(s: e.message, size: 15.0),
                ],
              ),
              Row(
                children: [
                  textStyle(
                      s: date(e.orderTime), size: 15.0, color: Colors.red),
                ],
              ),
            ],
          ),
        ),
      ));
    }
    content = Expanded(
        child: Column(
      children: ll,
    ));
  }
  return content;
}
