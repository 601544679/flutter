import 'package:demo/nullView.dart';
import 'package:flutter/material.dart';
import 'floatButton.dart';
import 'homepage.dart';
class bodyView extends StatefulWidget {
  @override
  _bodyViewState createState() => _bodyViewState();
}

class _bodyViewState extends State<bodyView> {
  int currentindex = 0;
  String value = '2';
  int a = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: DropdownButtonHideUnderline(
            child: DropdownButton(
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
                value: value,
                items: [
                  DropdownMenuItem(
                    child: Text(
                      'ALL',
                      style: TextStyle(color: Colors.black),
                    ),
                    value: '2',
                  ),
                  DropdownMenuItem(
                    child: Text('已完成', style: TextStyle(color: Colors.black)),
                    value: '1',
                  ),
                  DropdownMenuItem(
                    child: Text('运输中', style: TextStyle(color: Colors.black)),
                    value: '0',
                  )
                ],
                onChanged: (v) {
                  setState(() {
                    value = v;
                    a = int.parse(v);
                    //print(v);
                  });
                })),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('搜索');
                myDialog(context);
                print(sendOrderNumber);
              }),
          PopupMenuButton(itemBuilder: (context) {
            return <PopupMenuItem<String>>[
              PopupMenuItem<String>(
                child: Text("热度"),
                value: "hot",
              ),
              PopupMenuItem<String>(
                child: Text("最新"),
                value: "new",
              ),
            ];
          })
        ],
      ),
      body: currentindex == 0
          ? homepage(a)
          : nullView(),
      floatingActionButton: floatButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
        selectedItemColor: Colors.blueAccent,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance, size: 25.0),
              title: Container()),
          BottomNavigationBarItem(
              icon: Icon(Icons.list, size: 35.0), title: Container()),
        ],
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
      ),
    );
  }
}

int sendOrderNumber=0;
String departure='0';
String driverName='0';

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
                      print('司机：' +driverName);
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
