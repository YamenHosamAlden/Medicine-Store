import 'package:flutter/rendering.dart';

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

  
    path.lineTo(0, size.height *0.25);
  path.lineTo(size.width/2,0);
    path.lineTo(size.width, size.height *0.25);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
