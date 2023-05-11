import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lzh/fonts/Fonts.dart';
import 'package:lzh/utils/colorUtils.dart';
import 'package:lzh/widget/MyAppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorUtils.sysColorBag(context),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
        // floatingActionButton: Container(
        //   height: 1,
        //   color: Colors.grey,
        // ),
        appBar: PreferredSize(
          child: AppBar(
            // backgroundColor: Colors.transparent,
            backgroundColor: ColorUtils.sysColorBag(context),
            elevation: 1,
            shadowColor: Colors.black,

            iconTheme: IconThemeData(color: ColorUtils.sysColorText(context)),
            title: Text("消息"),
            leadingWidth: 40.w,
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Bli.addressList)),
              IconButton(onPressed: () {}, icon: Icon(Bli.verticalPoint))
            ],
          ),
          preferredSize: Size.fromHeight(50.h),
        ),
        body: MessageInfo());
  }
}

class MessageInfo extends StatelessWidget {
  final List<Widget> list = [
    ListTile(
      dense: true,
      visualDensity: VisualDensity(vertical: -4, horizontal: -4),
      // contentPadding: EdgeInsets.all(0),
      leading: ClipOval(
        child: Image.network(
          "https://thirdwx.qlogo.cn/mmopen/vi_32/Jicw4nBpIpwscNfWW3IWhdaicnl8sWd7iblwG12DK9G0JJWfv3zKOhqvITclxDtRq4ZMhTzFEhLiaiawpgMIx2Ah9MQ/132",
          fit: BoxFit.cover,
          // width: 40,
          // height: 40,
        ),
      ),
      onTap: () {
        Get.toNamed("/home/message/chat", arguments: {"id":1});
      },
      title: Text("前端瞎折腾"),
      subtitle: Text("你要的答案我没有学习"),
    ),
    ListTile(
      dense: true,
      visualDensity: VisualDensity(vertical: -4, horizontal: -4),
      // contentPadding: EdgeInsets.all(0),
      leading: ClipOval(
        child: Image.network(
          "https://thirdwx.qlogo.cn/mmopen/vi_32/Jicw4nBpIpwscNfWW3IWhdaicnl8sWd7iblwG12DK9G0JJWfv3zKOhqvITclxDtRq4ZMhTzFEhLiaiawpgMIx2Ah9MQ/132",
          fit: BoxFit.cover,
          // width: 40,
          // height: 40,
        ),
      ),
      title: Text("前端瞎折腾"),
      subtitle: Text("你要的答案我没有学习"),
    ),
    ListTile(
      dense: true,
      visualDensity: VisualDensity(vertical: -4, horizontal: -4),
      // contentPadding: EdgeInsets.all(0),
      leading: ClipOval(
        child: Image.network(
          "https://thirdwx.qlogo.cn/mmopen/vi_32/Jicw4nBpIpwscNfWW3IWhdaicnl8sWd7iblwG12DK9G0JJWfv3zKOhqvITclxDtRq4ZMhTzFEhLiaiawpgMIx2Ah9MQ/132",
          fit: BoxFit.cover,
          // width: 40,
          // height: 40,
        ),
      ),
      title: Text("前端瞎折腾"),
      subtitle: Text("你要的答案我没有学习"),
    ),
  ];
  MessageInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.,

      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ImageTextCont(
                  title: Text("回复我的"),
                  width: 70,
                  height: 50,
                  child: Image.asset(
                    "assets/images/replyto.png",
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    print("wwwww");
                  }),
              ImageTextCont(
                  title: Text("回复我的"),
                  width: 70,
                  height: 50,
                  child: Image.asset(
                    "assets/images/replyto.png",
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    print("wwwww");
                  }),
              ImageTextCont(
                  title: Text("回复我的"),
                  width: 70,
                  height: 50,
                  child: Image.asset(
                    "assets/images/replyto.png",
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    print("wwwww");
                  }),
              ImageTextCont(
                  title: Text("回复我的"),
                  width: 70,
                  height: 50,
                  child: Image.asset(
                    "assets/images/replyto.png",
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    print("wwwww");
                  }),
            ],
          ),
          Container(alignment: Alignment.centerLeft, child: Text('聊天列表')),
          Divider(),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return list[index];
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
                itemCount: list.length),
          )
        ],
      ),
    );
  }
}

// ImageTextCont(
//     title: Text("回复我的"),
//     width: 70,
//     height: 50,
//     child: Image.asset(
//       "assets/images/replyto.png",
//       fit: BoxFit.cover,
//     ),
//     onTap: () {
//       print("wwwww");
//     }),
class ImageTextCont extends StatelessWidget {
  final GestureTapCallback onTap;
  final double width;
  final double height;
  final Widget child;
  final Widget title;
  final double sizeBoxHeight;
  const ImageTextCont(
      {this.sizeBoxHeight = 3,
      required this.title,
      this.height = 50,
      this.width = 40,
      required this.child,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width.w,
        height: height.h,
        child: Column(children: [
          Expanded(child: child),
          // Text("回复我的")
          SizedBox(
            height: sizeBoxHeight,
          ),
          title
        ]),
      ),
    );
  }
}
