// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  TextEditingController _textEditingController = TextEditingController();
  Login({super.key});
  Color backgroundColor=Colors.red;
  @override
  Widget build(BuildContext context) {

    print(Theme.of(context).accentColor);
     return Scaffold(
      // appBar:
      body: Container(
  // margin:EdgeInsets.only(top: MediaQueryData.fromWindow(window).padding.top),
        // alignment: Alignment.center,
       child: Column(
         children: [
           PreferredSize(child: AppBar(
             backgroundColor: Colors.transparent,
             elevation: 0,
             iconTheme: IconThemeData(color: Colors.black),
             title: Text("hdhhdhdhhddhhd",style: TextStyle(fontSize:14,color: Colors.black),),
             actions: [
               Center(child: Text("kkkkkkkkkk",style: TextStyle(fontSize:14,color: Colors.black),))
             ],),preferredSize: Size.fromHeight(40),),
         ],
       ),
    ),

    );
  }
}

//  return Scaffold(
//       appBar: PreferredSize(child: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         iconTheme: IconThemeData(color: Colors.black),
//         title: Text("hdhhdhdhhddhhd",style: TextStyle(fontSize:14,color: Colors.black),),
//         actions: [
//           Center(child: Text("kkkkkkkkkk",style: TextStyle(fontSize:14,color: Colors.black),))
//         ],),preferredSize: Size.fromHeight(40),),
//       body: Container(
//   // margin:EdgeInsets.only(top: MediaQueryData.fromWindow(window).padding.top),
//         // alignment: Alignment.center,
//        child: Text("xxxxxx"),
//     ),
    
//     );