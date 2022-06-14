import 'package:flutter/material.dart';

/// 箭頭 widget
/// @param color: 箭頭顏色
/// @param isUpArrow: 箭頭是否往上
class Arrow extends StatelessWidget {
  final Color color;
  final bool isUpArrow;
  static const height = 21.0;
  static const width = 30.0;

  const Arrow({Key? key, required this.color, required this.isUpArrow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ArrowClipper(isUp: isUpArrow),
      child: Container(height: height, width: width, decoration: BoxDecoration(color: color)),
    );
  }
}

/// 繪製向上箭頭
class ArrowClipper extends CustomClipper<Path> {
  // 箭頭是否向上
  bool isUp;

  ArrowClipper({required this.isUp});

  @override
  Path getClip(Size size) {
    Path path = Path();
    if (isUp) {
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
