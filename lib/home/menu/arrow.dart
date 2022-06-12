import 'package:flutter/material.dart';

class Arrow extends StatelessWidget {
  final Color color;
  final height = 21.0;
  final width = 30.0;

  const Arrow({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ArrowClipper(isUpSide: true),
      child: Container(height: height, width: width, decoration: BoxDecoration(color: color)),
    );
  }
}

class ArrowClipper extends CustomClipper<Path> {
  // 箭頭是否向上
  bool isUpSide;

  ArrowClipper({required this.isUpSide});

  @override
  Path getClip(Size size) {
    Path path = Path();
    if (isUpSide) {
      path.moveTo(0, size.height); // 左下
      path.lineTo(size.width / 2, 0); // 中上
      path.lineTo(size.width, size.height); // 右下
      path.close();
    } else {
      path.moveTo(0, 0);
      path.lineTo(size.width / 2, size.height);
      path.lineTo(size.width, 0);
      path.close();
    }
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
