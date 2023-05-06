import 'package:get/get.dart';
import 'package:lzh/pages/login/index.dart';

import '../pages/navigationBar/index.dart';

class Routers{

  static final  routers=[
    GetPage(name:"/",page:()=>NavigationBar()),
    GetPage(name: "/login", page:()=> Login())
  ];
}