import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import './routers/index.dart';
import 'utils/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); //不加这个强制横/竖屏会报错
  // 强制竖屏
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 1.手机的物理分辨率
    final physicalWidth = window.physicalSize.width;
    final physicalHeight = window.physicalSize.height;

    // 2.获取dpr 直接拿到比值
    final dpr = window.devicePixelRatio;

    // 3.宽度和高度
    double screenWidth = physicalWidth / dpr;
    double screenHeight = physicalHeight / dpr;

    print("屏幕高$screenHeight 宽$screenWidth");

    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    // 初始化 存储
    ///PersistentStorage.getInstance();
    return ScreenUtilInit(
      // designSize: const Size(360, 690),
      designSize: Size(screenWidth, screenHeight),

      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            theme: ThemeData(
              // scaffoldBackgroundColor: const Color(0xFFEFEFEF),
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),

              ///全局取消水波纹
              splashColor: Colors.transparent, // 点击时的高亮效果设置为透明
              highlightColor: Colors.transparent, // 长按时的扩散效果设置为透明
            ),
            // home: child,
            initialRoute: "/",
            getPages: Routers.routers);
      },

      // child: const HomePage(title: 'First Method'),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
