import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Page1(),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom painter'),
      ),
      body: CustomPaint(
        painter: ShapePainter(),
        child: Container(),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // _drawLine(canvas, size);
    // _drawLineWithPath(canvas, size);
    _drawACircleInBuiltMethod(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  _drawACircleInBuiltMethod(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black54
      ..strokeWidth = 25
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var midPoint = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(midPoint, 50, paint);
  }

  _drawLineWithPath(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black54
      ..strokeWidth = 25
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();
    path.moveTo(25, size.height / 2);
    path.lineTo(size.width - 100, size.height / 2);
    path.relativeLineTo(0, 25);
    canvas.drawPath(path, paint);
  }

  _drawLine(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    Offset startingPoint = Offset(0, size.height / 2);
    Offset endingPoint = Offset(size.width, size.height / 2);

    canvas.drawLine(startingPoint, endingPoint, paint);
  }
}
