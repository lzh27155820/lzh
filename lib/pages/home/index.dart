import 'dart:math';

import 'package:flutter/material.dart';
import '../../fonts/HomeFont.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: PreferredSize(
        child: AppBar(
          leading: Container(
            height: 40,
            width: 40,
            color: Colors.red,
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(2),
            child: ClipOval(
              child: Image.network(
                "https://thirdwx.qlogo.cn/mmopen/vi_32/Jicw4nBpIpwscNfWW3IWhdaicnl8sWd7iblwG12DK9G0JJWfv3zKOhqvITclxDtRq4ZMhTzFEhLiaiawpgMIx2Ah9MQ/132",
                fit: BoxFit.cover,
                width: 40,
                height: 40,
              ),
            ),
          ),
          title: Stack(
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 35,
                            // color: Colors.red,
                            padding: EdgeInsets.only(left: 30),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)),
                            width: 200,
                            child: Text("软件设计师"),
                          ),
                        ],
                      )),
                  // Icon(Icons.search),
                  // Icon(Icons.search),
                ],
              ),
              Positioned(
                  top: 5,
                  left: 5,
                  child: Center(
                    child: Icon(Icons.search),
                  ))
            ],
          ),
          actions: [
            // SizedBox(width: ,),
            Icon(Bli.game),
            SizedBox(
              width: 15,
            ),
            Icon(Bli.message),
            SizedBox(
              width: 5,
            ),
          ],
        ),
        preferredSize: Size.fromHeight(45),
      ),
      body: HomeNavigation(),
    );
  }
}

// // Container(
// //             height: 40,
// //             width: 40,
// //             color: Colors.red,
// //             margin: EdgeInsets.all(5),
// //             padding: EdgeInsets.all(2),
// //             child: ClipOval(
// //               child: Image.network(
// //                   "https://thirdwx.qlogo.cn/mmopen/vi_32/Jicw4nBpIpwscNfWW3IWhdaicnl8sWd7iblwG12DK9G0JJWfv3zKOhqvITclxDtRq4ZMhTzFEhLiaiawpgMIx2Ah9MQ/132",fit: BoxFit.cover,width: 40,height: 40,),

// //             ),
// class HomeNavigation extends StatefulWidget {
//   const HomeNavigation({super.key});

//   @override
//   State<HomeNavigation> createState() => _HomeNavigationState();
// }

// class _HomeNavigationState extends State<HomeNavigation>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _tabController=TabController(length: 6, vsync: this);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         child: Stack(
//           children: [
//             AppBar(
//           // leadingWidth: 1,
//           // leading: Container(color: Colors.red),
//           // automaticallyImplyLeading :true,

//           title: Container(
//             // height: 30,
//             // transform: ,
//             transform: Matrix4.translationValues(-10, 0.0, 0.0),
//             color: Colors.green,
//             child: TabBar(

//               controller: _tabController,
//                isScrollable: true,

//                   labelColor: Colors.red,
//                   unselectedLabelColor: Colors.black,
//                   indicatorColor: Colors.red,
//                   indicatorSize: TabBarIndicatorSize.label,
//               tabs: [
//                 Tab(
//                       child: Text("人们"),
//                     ),
//                     Tab(
//                       child: Text("格局"),
//                     ),
//                     Tab(
//                       child: Text("你好"),
//                     ),
//                     Tab(
//                       child: Text("爱情"),
//                     ),
//                     Tab(
//                       child: Text("文档"),
//                     ),
//                     Tab(
//                       child: Text("我的"),
//                     ),

//             ]),
//           ),

//         actions: [
//           Icon(Icons.mail)
//         ],

//         ),
//           ],
//         ),

//         preferredSize: Size.fromHeight(50),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//              Text("wwwww"),
//         Text("zzz"),
//         Text("zzz"),

//         Text("zzz"),
//         Text("zzz"),
//         Text("zzz"),
//         ]),

//     );
//   }
// }

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({super.key});

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 6, vsync: this);

    _tabController.addListener(() {
      print(_tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Stack(
          children: [
            Container(
              height: 35,
              // transform: ,
              // transform: Matrix4.translationValues(-16, 0.0, 0.0),
              color: Colors.green,
              margin: EdgeInsets.only(right: 20),
              child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  padding: EdgeInsets.all(0),
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.black38,
                  indicatorColor: Colors.red,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(
                      child: Text("人们"),
                    ),
                    Tab(
                      child: Text("格局"),
                    ),
                    Tab(
                      child: Text("你好"),
                    ),
                    Tab(
                      child: Text("爱情"),
                    ),
                    Tab(
                      child: Text("文档"),
                    ),
                    // Tab(
                    //   child: Text("我的"),
                    // ),
                    //  Tab(
                    //   child: Text("格局"),
                    // ),
                    Tab(
                      child: Text("信增城"),
                    ),
                  ]),
            ),
            Positioned(
                top: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  width: 25,
                  height: 35,
                  color: Colors.red,
                  child: IconButton(
                    padding: EdgeInsets.all(0),
                    icon: Icon(Bli.sanxian),
                    onPressed: () {},
                  ),
                ))
          ],
        ),

        // actions: [
        //   Icon(Icons.line_axis)
        // ],

        preferredSize: Size.fromHeight(50),
      ),
      body: TabBarView(controller: _tabController, children: [
        Text("wwwww"),
        Text("zzz"),
        Text("zzz"),

        Text("zzz"),
        Text("zzz"),
        Text("zzz"),
        // Text("zzz"),
        //   Text("zzz"),
      ]),
    );
  }
}
