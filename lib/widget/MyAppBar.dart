import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppBar extends StatelessWidget {
  final Widget title;
  final int elevation;
  final List<Widget>? actions;
  final double fromHeight;
  final Color backgroundColor;
  MyAppBar(
      {required this.title,
      this.elevation = 0,
      this.fromHeight = 10,
      this.actions,
      this.backgroundColor = Colors.transparent,
      super.key});

  // PreferredSize preferredSize( required this.title,
  //     this.elevation = 0,
  //     this.fromHeight = 10,
  //     this.actions,
  //     this.backgroundColor=Colors.transparent,
  //     super.key){
  //   return PreferredSize(
  //     child: AppBar(
  //         leadingWidth: 30.w,
  //         backgroundColor: backgroundColor,
  //         elevation: 0,
  //         iconTheme: IconThemeData(color: Colors.black),
  //         title: title,
  //         actions: actions),
  //     preferredSize: Size.fromHeight(fromHeight.h),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // context.
    return PreferredSize(
      child: AppBar(
          leadingWidth: 30.w,
          backgroundColor: backgroundColor,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: title,
          actions: actions),
      preferredSize: Size.fromHeight(fromHeight.h),
    );
  }
}

class TextIconCont extends StatelessWidget {
  final IconData iconData;
  final Color? iconColor;
  final double iconSize;
  final String title;
  final double titleSize;
  final double iconWidth;
  final double iconheight;
  final VoidCallback onPressed;
  const TextIconCont(this.iconData,
      {super.key,
      this.iconColor,
      this.iconSize = 23.0,
      required this.title,
      this.iconWidth=40,
      this.iconheight=30,
      required this.onPressed,
      this.titleSize = 12});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment:MainAxisAlignment.,
      children: [
        Container(
          width: iconWidth.w,
          height: iconheight.h,
          child: IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              icon: Icon(
                iconData,
                color: iconColor,
                size: iconSize.sp,
              )),
        ),
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
