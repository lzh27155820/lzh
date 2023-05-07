import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/index.dart';
import '../user/index.dart';
import '../member/index.dart';
import '../publishVideo/index.dart';
import '../dynamically/index.dart';
import '../../fonts/Fonts.dart';
class NavigationBar extends StatelessWidget {



  int count = 0;
  final  List list = [
    HomePage(),
    DynamicallyPage(),
    PublishVideoPage(),
    MemberPage(),
    UserPage(),
  ];
  @override
  Widget build(BuildContext context) {
   var indexCount= Get.put(IndexCount());
    return Scaffold(
      bottomNavigationBar: Container(


          height: 50,
          child: BottomNavigationBar(
              onTap: (index) {
                // setState(() {
                //   count = index;
                // });
                indexCount.count.value=index;
              },
              iconSize: 20, //设置图标大小
              type: BottomNavigationBarType.fixed, //底部弹性布局
              backgroundColor: Colors.green,
              currentIndex: count, //当前第几页
              selectedFontSize: 12, //选中时的字体大小
              unselectedFontSize: 12, //未选择的字体大小
              fixedColor: Colors.pink, //选中的颜色
              unselectedItemColor: Colors.black,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "首页",
                ),
                BottomNavigationBarItem(icon: Icon(Bli.fengche), label: "设置"),
                BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
                BottomNavigationBarItem(icon: Icon(Bli.member), label: "会员购"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.breakfast_dining), label: "我的"),
              ])),
      body: GetX<IndexCount>(
        builder: (value) {
          return list[indexCount.count.value];
        }
      ),
      // 设置中间图标
      floatingActionButton: Container(
          width: 40,
          height: 40,
          margin: EdgeInsets.only(top: 50),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.pink, borderRadius: BorderRadius.circular(10)),
          child: IconButton(
            padding: EdgeInsets.all(0),//除去IconButton自带间隙
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              // setState(() {
              //   count = 2;
              // });
              indexCount.count.value=2;
            },
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}


class IndexCount extends GetxController{

  var count=0.obs;
}