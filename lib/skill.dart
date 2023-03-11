import 'package:flutter/material.dart';

class Skill extends StatelessWidget {
  final String title;
  final String imgPath;
  final bool isActive;
  final Color shadowColor;
  final Function() onTap;

  const Skill({
    Key? key,
    required this.imgPath,
    required this.title,
    required this.isActive,
    required this.shadowColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BorderRadius defaultBorderRadius = BorderRadius.circular(12);

    return InkWell(
      onTap: onTap,
      borderRadius: defaultBorderRadius,
      child: Container(
        height: 110,
        width: 110,
        decoration: isActive
            ? BoxDecoration(
                color: const Color(0x0dffffff),
                borderRadius: defaultBorderRadius,
              )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: isActive
                  ? BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: shadowColor.withOpacity(0.3),
                        blurRadius: 20,
                      )
                    ])
                  : null,
              child: Image.asset(imgPath, width: 40, height: 40),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
