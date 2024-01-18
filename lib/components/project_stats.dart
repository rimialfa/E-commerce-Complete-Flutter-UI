import 'package:app/constants.dart';
import 'package:app/services/models.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProjectStats extends StatelessWidget {
  const ProjectStats({required this.project, super.key});
  final Project project;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "${project.price}",
                      style: const TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.w900),
                    ),
                    const Text('Goal'),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                          width: 1, color: Colors.grey.withOpacity(0.5)),
                      right: BorderSide(
                        width: 1,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "${project.totalSales}",
                        style: const TextStyle(
                            color: kPrimaryColor, fontWeight: FontWeight.w900),
                      ),
                      const Text('Collected '),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "${project.remainingSales}",
                      style: const TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.w900),
                    ),
                    const Text('Remaining'),
                  ],
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CircularPercentIndicator(
              radius: 25.0,
              lineWidth: 5.0,
              percent: project.percentage,
              center: Text(
                "${(project.percentage * 100).floor()}%",
                style: const TextStyle(color: kPrimaryColor, fontSize: 11),
              ),
              progressColor: kPrimaryColor,
            ),
          ],
        ),
      ],
    );
  }
}
