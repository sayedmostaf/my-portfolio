import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_colors.dart';

class SkillWidget extends StatefulWidget {
  final String skillName;
  final String iconPath;

  const SkillWidget(
      {super.key, required this.skillName, required this.iconPath});

  @override
  _SkillWidgetState createState() => _SkillWidgetState();
}

class _SkillWidgetState extends State<SkillWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isHovered ? 110 : 100,
        height: isHovered ? 110 : 100,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          color: isHovered ? AppColors.bgColor2 : AppColors.bgColor,
          borderRadius: BorderRadius.circular(15),
          border: isHovered
              ? Border.all(
                  color: AppColors.themeColor, width: 2) // Updated border color
              : null,
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: AppColors.themeColor,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(2, 3),
                  ),
                ]
              : [
                  BoxShadow(
                    color: AppColors.bgColor,
                    spreadRadius: 4,
                  )
                ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.iconPath,
              width: 35,
              height: 35,
              // color: isHovered ? AppColors.robinEdgeBlue : AppColors.themeColor,
            ),
            const SizedBox(height: 5.0),
            FittedBox(
              child: Text(
                widget.skillName,
                style: TextStyle(
                  color: !isHovered ? AppColors.white : AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
