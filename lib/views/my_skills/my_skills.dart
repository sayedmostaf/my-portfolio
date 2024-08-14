import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_colors.dart';
import 'package:my_portfolio/globals/app_text_styles.dart';
import 'package:my_portfolio/globals/constants.dart';
import 'package:my_portfolio/helper/helper_class.dart';
import 'package:my_portfolio/views/my_skills/widgets/skill_widget.dart';

class MySkills extends StatelessWidget {
  const MySkills({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          buildMySkillsText(),
          Constants.sizedBox(height: 25.0),
          buildSkillsGrid(),
        ],
      ),
      tablet: Column(
        children: [
          buildMySkillsText(),
          Constants.sizedBox(height: 30.0),
          buildSkillsGrid(),
        ],
      ),
      desktop: Column(
        children: [
          buildMySkillsText(),
          Constants.sizedBox(height: 50.0),
          buildSkillsGrid(),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor,
    );
  }

  Widget buildMySkillsText() {
    return FadeInRight(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'My ',
          style: AppTextStyles.headingStyles(
            fontSize: 30,
          ),
          children: [
            TextSpan(
              text: 'Skills',
              style: AppTextStyles.headingStyles(
                fontSize: 30,
                color: AppColors.themeColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSkillsGrid() {
    return const Wrap(
      spacing: 20.0,
      runSpacing: 20.0,
      children: [
        SkillWidget(skillName: 'Dart', iconPath: 'assets/icons/dart.png'),
        SkillWidget(skillName: 'Flutter', iconPath: 'assets/icons/flutter.png'),
        SkillWidget(skillName: 'C++', iconPath: 'assets/icons/cpp.png'),
        SkillWidget(skillName: 'Java', iconPath: 'assets/icons/java.png'),
        SkillWidget(skillName: 'Kotlin', iconPath: 'assets/icons/kotlin.png'),
        SkillWidget(
            skillName: 'Firebase', iconPath: 'assets/icons/firebase.png'),
        SkillWidget(skillName: 'Python', iconPath: 'assets/icons/python.png'),
        SkillWidget(
            skillName: 'Android Studio',
            iconPath: 'assets/icons/android_studio.png'),
        SkillWidget(skillName: 'GitHub', iconPath: 'assets/icons/github.png'),
        SkillWidget(
            skillName: 'Problem Solving',
            iconPath: 'assets/images/codeforces.png'),
      ],
    );
  }
}
