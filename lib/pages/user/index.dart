// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../fonts/Fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';
import 'package:lzh/widget/circle.dart';
import 'package:lzh/widget/wire.dart';

class UserPage extends StatelessWidget {
  UserPage({super.key});

  bool flag = true;

  @override
  Widget build(BuildContext context) {
    print(ScreenUtil().statusBarHeight.toString());
    print(MediaQueryData.fromWindow(window).padding.top);

    return Container(
      margin:EdgeInsets.only(top: MediaQueryData.fromWindow(window).padding.top),
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Column(children: [
        // 顶部
        Row(
          textDirection: TextDirection.rtl,
          children: [
            TopIcon(2, Bli.half_month, onPressed: () {
              if (flag) {
                Get.changeTheme(ThemeData.light());
                flag = false;
              } else {
                Get.changeTheme(ThemeData.dark());
                flag = true;
              }
            }),
            TopIcon(10, Bli.clothing, onPressed: () {}),
            TopIcon(10, Bli.ewm, onPressed: () {})
          ],
        ),
        UserInfo(),

        Expanded(child: UserSystemInfo()),
      ]),
    );
  }
}

class TopIcon extends StatelessWidget {
  final VoidCallback onPressed;
  int right;
  IconData iconData;
  TopIcon(this.right, this.iconData, {required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: ,
      margin: EdgeInsets.only(right: right.w),
      width: 25.w,
      child: IconButton(
        padding: EdgeInsets.all(0),
        onPressed: onPressed,
        icon: Icon(
          this.iconData,
          color: Colors.black38,
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180.h,
        // color: Colors.red,
        // padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: Column(
          children: [
            Container(
                height: 90.h,
                // color: Colors.yellow,
                width: double.infinity,
                // padding: EdgeInsets.only(right: 10.w),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        ClipOval(
                          child: Image.network(
                            "https://www.itying.com/themes/itying/images/ionic4.png",
                            width: 65.w,
                            height: 65.h,
                            fit: BoxFit.cover,
                          ),
                        ),

                        SizedBox(
                          width: 18.w,
                        ),
                        TextButton(
                          child: Text("点击登入",
                              style: TextStyle(
                                fontSize: 18.sp,
                              )),
                          onPressed: () {
                            Get.toNamed("/login");
                          },
                        )

                        // '点击登入',
                        //   style: TextStyle(
                        //     fontSize: 18.sp,
                        //   )),
                      ],
                    ),
                    Align(
                      alignment: Alignment(1, -0.5),
                      child: Icon(Icons.navigate_next),
                    )
                  ],
                )),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: UserContext(
                      title: "动态",
                    ),
                  ),
                  VerticaMoulding(height: 30, width: 1),
                  Expanded(
                    flex: 1,
                    child: UserContext(
                      title: "动态",
                    ),
                  ),
                  VerticaMoulding(height: 30, width: 1),
                  Expanded(
                    flex: 1,
                    child: UserContext(
                      title: "动态",
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class UserContext extends StatelessWidget {
  final String title;
  const UserContext({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 40.h,
        // margin: EdgeInsets.only(right: 20.w),
        // color: Colors.green,
        // width: 80.w,
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(children: [
          Text(
            "-",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          // TextButton.icon(onPressed: (){}, icon: Icon(Icons.add),label: Text("xxx"),)
          Text(title)
        ]),
        //垂直分割线
      ],
    ));
  }
}

class UserSystemInfo extends StatelessWidget {
  const UserSystemInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(children: <Widget>[
        Row(
          children: [
            Expanded(
              flex: 1,
              child: UserTextIcon(
                Bli.download,
                title: "离线缓存",
                iconColor: Colors.blue,
              ),
            ),
            Expanded(
              flex: 1,
              child: UserTextIcon(
                Bli.history,
                title: "历史记录",
                iconColor: Colors.blue,
              ),
            ),
            Expanded(
              flex: 1,
              child: UserTextIcon(
                Bli.collect,
                title: "我的收藏",
                iconColor: Colors.blue,
              ),
            ),
            Expanded(
              flex: 1,
              child: UserTextIcon(
                Bli.history,
                title: "稍后观看",
                iconColor: Colors.blue,
              ),
            )
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "创作中心",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
            ),
            Container(
                height: 30.h,
                width: 80.w,
                child: ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.pink[200]),
                        padding: MaterialStateProperty.all(EdgeInsets.all(0))),
                    onPressed: () {},
                    icon: Icon(Bli.uploading),
                    label: Text(
                      "发布",
                      style: TextStyle(fontSize: 12.sp),
                    )))
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            UserTextIcon(
              Bli.bulb,
              title: "创作首页",
              iconColor: Colors.yellow,
            ),
            UserTextIcon(Bli.manuscript, title: "稿件管理"),
            UserTextIcon(Bli.task, title: "任务中心"),
            UserTextIcon(Bli.activity, title: "有奖活动"),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "推荐服务",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
        ),
        SizedBox(
          height: 10.h,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                UserTextIcon(Bli.manuscript,
                    iconColor: Color.fromARGB(255, 243, 81, 135),
                    title: "个性装扮"),
                UserTextIcon(Bli.manuscript,
                    iconColor: Color.fromARGB(255, 243, 81, 135),
                    title: "个性装扮"),
                UserTextIcon(Bli.manuscript,
                    iconColor: Color.fromARGB(255, 243, 81, 135),
                    title: "个性装扮"),
                UserTextIcon(Bli.manuscript,
                    iconColor: Color.fromARGB(255, 243, 81, 135),
                    title: "个性装扮"),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                UserTextIcon(Bli.manuscript,
                    iconColor: Color.fromARGB(255, 243, 81, 135),
                    title: "个性装扮"),
                UserTextIcon(Bli.manuscript,
                    iconColor: Color.fromARGB(255, 243, 81, 135),
                    title: "个性装扮"),
                UserTextIcon(Bli.manuscript,
                    iconColor: Color.fromARGB(255, 243, 81, 135),
                    title: "个性装扮"),
                UserTextIcon(Bli.manuscript,
                    iconColor: Color.fromARGB(255, 243, 81, 135),
                    title: "个性装扮"),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                UserTextIcon(Bli.manuscript,
                    iconColor: Color.fromARGB(255, 243, 81, 135),
                    title: "个性装扮"),
                UserTextIcon(Bli.manuscript,
                    iconColor: Color.fromARGB(255, 243, 81, 135),
                    title: "个性装扮"),
                UserTextIcon(Bli.manuscript,
                    iconColor: Color.fromARGB(255, 243, 81, 135),
                    title: "个性装扮"),
                UserTextIcon(Bli.manuscript,
                    iconColor: Color.fromARGB(255, 243, 81, 135),
                    title: "个性装扮"),
              ],
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "更多服务",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          child: Column(
            children: [
              Container(
                height: 50.h,
                child: ListTile(
                  minLeadingWidth: 20.w,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  leading: Icon(Bli.customerServiceStaff),
                  title: Text("联系客服"),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: Color.fromARGB(31, 65, 65, 65),
                  ),
                ),
              ),
              Container(
                height: 50.h,
                child: ListTile(
                  minLeadingWidth: 20.w,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  leading: Icon(Bli.customerServiceStaff),
                  title: Text("联系客服"),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: Color.fromARGB(31, 65, 65, 65),
                  ),
                ),
              ),
              Container(
                height: 50.h,
                child: ListTile(
                  minLeadingWidth: 20.w,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  leading: Icon(Icons.settings),
                  title: Text("联系客服"),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: Color.fromARGB(31, 65, 65, 65),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class UserTextIcon extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final double iconSize;
  final String title;
  final double titleSize;
  const UserTextIcon(this.iconData,
      {super.key,
      this.iconColor = Colors.black,
      this.iconSize = 23.0,
      required this.title,
      this.titleSize = 12});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment:MainAxisAlignment.,
      children: [

        Container(
          width: 40,
          height: 30,
          child: IconButton(
            
            padding: EdgeInsets.all(0),
            onPressed: (){}, icon: Icon(
            iconData,
            color: iconColor,
            size: iconSize.sp,
          )),
        )
        ,
        // SizedBox(
        //   height: 5.h,
        // ),
        Text(
          title,
          style: TextStyle(fontSize: titleSize.sp),
        )
      ],
    );
  }
}
