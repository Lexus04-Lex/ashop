import 'package:flutter/material.dart';
class ACurvedEdges extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    final firstcurve = Offset(0, size.height -20);
    final lasttcurve = Offset(30, size.height -20);
    path.quadraticBezierTo(firstcurve.dx, firstcurve.dy, lasttcurve.dx, lasttcurve.dy);


    final secondfirstcurve = Offset(0, size.height -20);
    final secondlasttcurve = Offset(size.width -30, size.height -20);
    path.quadraticBezierTo(secondfirstcurve.dx, secondfirstcurve.dy, secondlasttcurve.dx, secondlasttcurve.dy);

    final thirdfirstcurve = Offset(size.width, size.height -20);
    final thirdlastcurve = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdfirstcurve.dx, thirdfirstcurve.dy, thirdlastcurve.dx, thirdlastcurve.dy);


    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
      return true;
  }

}