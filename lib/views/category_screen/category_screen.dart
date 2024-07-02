import 'package:flutter/material.dart';
import 'package:money_mate/constants/app_lists.dart';
import 'package:money_mate/constants/color_pallet.dart';
import 'package:money_mate/constants/spacing.dart';
import 'package:money_mate/views/shared_widget/category_card.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  static String id = "CategoryScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.offWhitecolor,
        title: Text(
          "Category",
        ),
      ),
      body: Container(
        padding: Spacing.screenPadding,
        child: Column(
          children: [
            Spacing.heightBox(20),
            // Container(
            //   width: 120,
            //   height: 120,
            //   child: CustomPaint(
            //     painter: _CircularPercentPainter(
            //       lineWidth: 20.0,
            //       percent: 1,
            //       colors: [
            //         Colors.red,
            //         Colors.yellow,
            //         Colors.green,
            //         Colors.blue,
            //         // Colors.purple
            //       ],
            //     ),
            //   ),
            // ),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return categoryCardWidget(
                  category: "${AppLists.categoryList[index]}",
                  color: AppLists.categoryColorList[index],
                  totalExpense: 650,
                  totalItems: 4,
                  icon: AppLists.iconExpenseList[index],
                );
              },
              itemCount: 4,
            ),
          ],
        ),
      ),
    );
  }
}

class _CircularPercentPainter extends CustomPainter {
  final double lineWidth;
  final double percent;
  final List<Color> colors;

  _CircularPercentPainter({
    required this.lineWidth,
    required this.percent,
    required this.colors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double startAngle = -90.0;
    List<double> thresholds = [
      0.3,
      0.5,
      0.7,
      1,
    ]; // Thresholds for each segment

    double sweepAngle1 =
        360.0 * (percent > thresholds[0] ? thresholds[0] : percent);
    double sweepAngle2 = 360.0 *
        (percent > thresholds[1]
            ? (thresholds[1] - thresholds[0])
            : (percent - thresholds[0])
                .clamp(0.0, thresholds[1] - thresholds[0]));
    double sweepAngle3 = 360.0 *
        (percent > thresholds[2]
            ? (thresholds[2] - thresholds[1])
            : (percent - thresholds[1]).clamp(
                0.0,
                thresholds[2] - thresholds[1],
              ));
    double sweepAngle4 = 360.0 *
        (percent > thresholds[3]
            ? (thresholds[3] - thresholds[2])
            : (percent - thresholds[2]).clamp(
                0.0,
                thresholds[3] - thresholds[2],
              ));

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = lineWidth;

    canvas.drawArc(
      Rect.fromLTWH(0.0, 0.0, size.width, size.height),
      radians(startAngle),
      radians(sweepAngle1),
      false,
      paint..color = colors[0],
    );

    canvas.drawArc(
      Rect.fromLTWH(0.0, 0.0, size.width, size.height),
      radians(startAngle + sweepAngle1),
      radians(sweepAngle2),
      false,
      paint..color = colors[1],
    );

    canvas.drawArc(
      Rect.fromLTWH(0.0, 0.0, size.width, size.height),
      radians(startAngle + sweepAngle1 + sweepAngle2),
      radians(sweepAngle3),
      false,
      paint..color = colors[2],
    );
    canvas.drawArc(
      Rect.fromLTWH(0.0, 0.0, size.width, size.height),
      radians(startAngle + sweepAngle1 + sweepAngle2),
      radians(sweepAngle3),
      false,
      paint..color = colors[2],
    );
    canvas.drawArc(
      Rect.fromLTWH(0.0, 0.0, size.width, size.height),
      radians(startAngle + sweepAngle1 + sweepAngle2 + sweepAngle3),
      radians(sweepAngle4),
      false,
      paint..color = colors[3],
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double radians(double degrees) {
    return degrees * (3.141592653589793 / 180.0);
  }
}
