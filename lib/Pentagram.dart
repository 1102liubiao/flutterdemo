import 'dart:math';

import 'package:flutter/material.dart';

class Pentagram  extends CustomPainter{
  Pentagram(this.color);
  //画笔的颜色
  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    //把画笔设置成stroke模式
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill//填充模式
      ..strokeWidth = 2;
    var rect = Offset.zero & size;
    var center = rect.center;
    canvas.drawPath(getPentagramPath(12), paint);
  }
  Path getPentagramPath(double radius) {
    var initDegreen = 180;
// 连接五角星的五个顶点，360/5，每个是72度
    final path = Path();
    var posOne = getOffsetPosition(initDegreen, radius);
    var posTwo = getOffsetPosition(72 + initDegreen, radius);
    var posThree = getOffsetPosition(144 + initDegreen, radius);
    var posfour = getOffsetPosition(216 + initDegreen, radius);
    var posFive = getOffsetPosition(288 + initDegreen, radius);
    path.moveTo(posOne.dx, posOne.dy);
    path.lineTo(posfour.dx, posfour.dy);
    path.lineTo(posTwo.dx, posTwo.dy);
    path.lineTo(posFive.dx, posFive.dy);
    path.lineTo(posThree.dx, posThree.dy);
//最后用close的方式把path封闭起来
    path.close();
    return path;
  }
  Offset getOffsetPosition(int degreen, double radius) {
    //角度转成弧度
    var radian = degreen * pi / 180;
    var dx = sin(radian) * radius;
    var dy = cos(radian) * radius;
    return Offset(dx + radius, dy + radius);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

}