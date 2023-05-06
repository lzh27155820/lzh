import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleNetWork extends StatelessWidget {
  
  final String url;
  final double width;
   final double height;
  const CircleNetWork({required this.width,required this.height,required this.url,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(width/2.w),
            image: const DecorationImage(
                image: NetworkImage(
                  "https://www.itying.com/themes/itying/images/ionic4.png",
                ),
                fit: BoxFit.cover)),
      ),
    );
  }
}
