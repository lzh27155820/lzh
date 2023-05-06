import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
///竖线
class VerticaMoulding extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  const VerticaMoulding({this.color=Colors.black54 ,required this.height,required this.width,  super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height:height.w,
      child: DecoratedBox(
        decoration: BoxDecoration(color:color),
      ),
    );
  }
}

///横线
// class HorizontalLine extends StatelessWidget {
//   final Color color;
//   final double width;
//   final double height;
//   const HorizontalLine({this.color=Colors.black54 ,required this.height,required this.width,  super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width.w,
//       height:height.w,
//       child: Divider(height: height,color: color,)
//     );
//   }
// }

 // Description：横线
class HorizontalLine extends StatelessWidget {
final double dashedWidth;
final double dashedHeight;
final Color color;

HorizontalLine({
    this.dashedHeight = 1,
    this.dashedWidth = double.infinity,
    this.color = const Color(0xFF979797),
  });

  @override
  Widget build(BuildContext context) {
    return Container(width: dashedWidth, height: dashedHeight, color: color);
  }
}