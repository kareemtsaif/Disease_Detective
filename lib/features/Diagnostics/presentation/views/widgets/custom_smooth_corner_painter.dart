import 'package:flutter/material.dart';
import 'package:disease_detective/core/utils/colors.dart';

class CustomSmoothCornerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColor.borderColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const double lineLength = 70;
    const double cornerRadius = 30;

    canvas.drawLine(
      const Offset(0, cornerRadius),
      const Offset(0, lineLength),
      paint,
    );
    canvas.drawLine(
      const Offset(cornerRadius, 0),
      const Offset(lineLength, 0),
      paint,
    );
    canvas.drawArc(
      Rect.fromCircle(
          center: const Offset(cornerRadius, cornerRadius),
          radius: cornerRadius),
      -3.14,
      3.14 / 2,
      false,
      paint,
    );

    canvas.drawLine(
      Offset(size.width - cornerRadius, 0),
      Offset(size.width - lineLength, 0),
      paint,
    );
    canvas.drawLine(
      Offset(size.width, cornerRadius),
      Offset(size.width, lineLength),
      paint,
    );
    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width - cornerRadius, cornerRadius),
          radius: cornerRadius),
      -3.14 / 2,
      3.14 / 2,
      false,
      paint,
    );

    canvas.drawLine(
      Offset(0, size.height - cornerRadius),
      Offset(0, size.height - lineLength),
      paint,
    );
    canvas.drawLine(
      Offset(cornerRadius, size.height),
      Offset(lineLength, size.height),
      paint,
    );
    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(cornerRadius, size.height - cornerRadius),
          radius: cornerRadius),
      3.14 / 2,
      3.14 / 2,
      false,
      paint,
    );

    canvas.drawLine(
      Offset(size.width - cornerRadius, size.height),
      Offset(size.width - lineLength, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(size.width, size.height - cornerRadius),
      Offset(size.width, size.height - lineLength),
      paint,
    );
    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width - cornerRadius, size.height - cornerRadius),
          radius: cornerRadius),
      0,
      3.14 / 2,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
