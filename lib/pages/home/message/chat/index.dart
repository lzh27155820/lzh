import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lzh/fonts/Fonts.dart';
import 'package:lzh/utils/colorUtils.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    final model = Get.put(ChatModel());
    final arguments = Get.arguments;
    print(model.toString());
    print("arguments --${arguments.runtimeType} --${arguments}");
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          // elevation:1,
          backgroundColor: ColorUtils.sysColorBag(context),
          title: Text(model.mname.value,
              style: TextStyle(
                color: ColorUtils.sysColorText(context),
              )),
          leadingWidth: 40.h,
          iconTheme: IconThemeData(color: ColorUtils.sysColorText(context)),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
        ),
        preferredSize: Size.fromHeight(50.h),
      ),
      body: ChatInfo(),
      resizeToAvoidBottomInset: true,
      
      // bottomNavigationBar: Container(
      //   height:50.h,
      //   color: Colors.red,
      //   child: Row(
      //     children: [
      //       IconButton(onPressed: (){}, icon: Icon(Bli.photograph)),
      //       Expanded(
              
      //         child: Container(
      //           height: 30.h,
      //           decoration: BoxDecoration(
      //             color: Colors.black38,
      //             borderRadius: BorderRadius.circular(5)
      //           ),
      //           child: TextFormField(decoration: InputDecoration(helperText: "发个消息聊聊呗")),)

      //       ),
      //       ElevatedButton(onPressed: (){}, child: Text("发送"))
      //     ],
      //   ),
      // ),
    );
  }
}

class ChatInfo extends StatefulWidget {
  const ChatInfo({super.key});

  @override
  State<ChatInfo> createState() => _ChatInfoState();
}

class _ChatInfoState extends State<ChatInfo> {
  List<Widget> list = [];
//   @override
//   void initState() {
//        final model = Get.put(ChatModel());
//     for(int i=0;i<model.chatMessage.length;i++){
//        final chatMessage=model.chatMessage[i];
//         if(chatMessage.id==2){
//               list.add(
//               Container(
//             alignment:Alignment.centerLeft,
//             child: ListTile(
//                 title: Text(chatMessage.message),
//                 leading:ClipOval(
//                 child: Image.network(
//                   "https://thirdwx.qlogo.cn/mmopen/vi_32/Jicw4nBpIpwscNfWW3IWhdaicnl8sWd7iblwG12DK9G0JJWfv3zKOhqvITclxDtRq4ZMhTzFEhLiaiawpgMIx2Ah9MQ/132",
//                   fit: BoxFit.cover,
//                   width: 40,
//                   height: 40,
//                 ),
//               ),
//             ),
//           )
//         );
//         }else{

// list.add(
//               Container(
//             alignment:Alignment.centerRight,
//             child: ListTile(

//                 title: Container(
//                   color: Colors.red,
//                   alignment: Alignment.centerRight,
//                   child: Text(chatMessage.message)),
//                 trailing:ClipOval(
//                 child: Image.network(
//                   "https://thirdwx.qlogo.cn/mmopen/vi_32/Jicw4nBpIpwscNfWW3IWhdaicnl8sWd7iblwG12DK9G0JJWfv3zKOhqvITclxDtRq4ZMhTzFEhLiaiawpgMIx2Ah9MQ/132",
//                   fit: BoxFit.cover,
//                   width: 40,
//                   height: 40,
//                 ),
//               ),
//             ),
//           )
//         );

//         }

//     }
//   }
  // GlobalKey
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final model = Get.put(ChatModel());
    for (int i = 0; i < model.chatMessage.length; i++) {
      final chatMessage = model.chatMessage[i];
      if (chatMessage.id == 2) {
        // list.add(Container(
        //   alignment: Alignment.centerLeft,
        //   child: Row(
        //     children: [
        //       ClipOval(
        //         child: Image.network(
        //           "https://thirdwx.qlogo.cn/mmopen/vi_32/Jicw4nBpIpwscNfWW3IWhdaicnl8sWd7iblwG12DK9G0JJWfv3zKOhqvITclxDtRq4ZMhTzFEhLiaiawpgMIx2Ah9MQ/132",
        //           fit: BoxFit.cover,
        //           width: 60,
        //           height: 60,
        //         ),
        //       ),
        //       Expanded(child: Container(child: Text(chatMessage.message),))
        //     ],
        //   ),
        // ));

        list.add(Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: Image.network(
                "https://thirdwx.qlogo.cn/mmopen/vi_32/Jicw4nBpIpwscNfWW3IWhdaicnl8sWd7iblwG12DK9G0JJWfv3zKOhqvITclxDtRq4ZMhTzFEhLiaiawpgMIx2Ah9MQ/132",
                fit: BoxFit.cover,
                width: 40,
                height: 40,
              ),
            ),
            Expanded(
                child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 10, right: 40),
              child: Container(
                  // color: Colors.blue,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, 15.0), //阴影xy轴偏移量
                            blurRadius: 55.0, //阴影模糊程度
                            spreadRadius: 1.0 //阴影扩散程度
                            )
                      ],
                      color: Color.fromARGB(255, 126, 127, 129)),
                  padding: EdgeInsets.all(10),
                  // padding: EdgeInsets.only(top: 10,bottom: 10),
                  child: Text(
                    chatMessage.message,
                    style: TextStyle(fontSize: 14),
                  )),
            )),
          ],
          // ),
        ));
      } else {
        list.add(
            // Container(

            // color: Colors.red,
            // child:
            Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(left: 60, right: 10),
              child: chatMessage.type==1? Image.network("https://thirdwx.qlogo.cn/mmopen/vi_32/Jicw4nBpIpwscNfWW3IWhdaicnl8sWd7iblwG12DK9G0JJWfv3zKOhqvITclxDtRq4ZMhTzFEhLiaiawpgMIx2Ah9MQ/132"):
              
              Container(
                  // color: Colors.blue,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, 15.0), //阴影xy轴偏移量
                            blurRadius: 55.0, //阴影模糊程度
                            spreadRadius: 1.0 //阴影扩散程度
                            )
                      ],
                      color: Colors.blue),
                  padding: EdgeInsets.all(10),
                  // padding: EdgeInsets.only(top: 10,bottom: 10),
                  child: Text(
                    chatMessage.message,
                    style: TextStyle(fontSize: 14),
                  )),
            )),
            ClipOval(
              child: Image.network(
                "https://thirdwx.qlogo.cn/mmopen/vi_32/Jicw4nBpIpwscNfWW3IWhdaicnl8sWd7iblwG12DK9G0JJWfv3zKOhqvITclxDtRq4ZMhTzFEhLiaiawpgMIx2Ah9MQ/132",
                fit: BoxFit.cover,
                width: 40,
                height: 40,
              ),
            ),
          ],
          // ),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Expanded(child:   ListView.separated(
                itemBuilder: (context, index) {
                  return list[index];
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20,);
                },
                itemCount: list.length),),
 Container(
        height:50.h,
        color: Colors.red,
        child: Row(
          children: [
            IconButton(onPressed: (){}, icon: Icon(Bli.photograph)),
            Expanded(
              
              child: Container(

                 height: 30.h,
                margin: EdgeInsets.only(right: 5.w),
                padding: EdgeInsets.only(left: 8.w),
                decoration: BoxDecoration(
                  
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10.r)
                ),
                child: TextFormField(
                  
                  cursorColor: Color.fromRGBO(0, 0, 0, 0), //数线颜色
                  
                  
                  // textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 0, bottom: 0),

                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.r),borderSide: BorderSide(style: BorderStyle.none,color: Colors.transparent))
                    ,
                    // contentPadding: EdgeInsets.only(left: 20),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.r),borderSide: BorderSide(style: BorderStyle.none,color: Colors.transparent)),
                    // fillColor: const Color(0xffF6F6F8),
                     enabledBorder: InputBorder.none,
                  )

                  ),)

            ),
            ElevatedButton(onPressed: (){}, child: Text("发送"))
          ],
        ),
      ),
          ],
        ));
  }
}

class ChatModel extends GetxController {
  var id = 1.obs;
  var username = "张三".obs;
  var mid = 2.obs;
  var mname = "李四".obs;

  var chatMessage = [
    ChatMessage(1, 0, "你好"),
    ChatMessage(2, 0, "有什么事吗"),
    ChatMessage(1, 0,
        "我的骨骼的的护额是的哇u好的温度我i活动活动就问问i和地位的i凤凰网i发我ihi单位vi凤凰网放牛娃i和我覅五百i都叫我i回复ijfi王菲和地位回复iw、'w'fu想干你"),
    ChatMessage(2, 0, "来吧,干你丫的"),
    ChatMessage(2, 0, "希望你别装死"),
    ChatMessage(1, 0, "我nm"),
    ChatMessage(1, 0, "你快点"),
    ChatMessage(1, 0, "墨迹"),
    ChatMessage(1, 1, "墨迹"),
  ].obs;
}

class ChatMessage extends GetxController {
  int id;
  int type = 0;
  var message;
  ChatMessage(this.id, this.type, this.message);
}
