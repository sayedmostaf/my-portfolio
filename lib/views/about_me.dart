import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_buttons.dart';
import 'package:my_portfolio/globals/app_colors.dart';
import 'package:my_portfolio/globals/app_text_styles.dart';
import 'package:my_portfolio/globals/constants.dart';
import 'package:my_portfolio/helper/helper_class.dart';
import 'package:my_portfolio/widgets/profile_animation.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          buildAboutMeContents(),
          Constants.sizedBox(height: 35),
          const ProfileAnimation(useProfile: true) // Updated usage
        ],
      ),
      tablet: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ProfileAnimation(useProfile: true), // Updated usage
          Constants.sizedBox(width: 25.0),
          Expanded(child: buildAboutMeContents()),
        ],
      ),
      desktop: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ProfileAnimation(useProfile: true), // Updated usage
          Constants.sizedBox(width: 25.0),
          Expanded(child: buildAboutMeContents()),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor2,
    );
  }

  Column buildAboutMeContents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInRight(
          duration: const Duration(milliseconds: 1200), // Adjusted duration
          child: RichText(
            text: TextSpan(
              text: 'About ',
              style: AppTextStyles.headingStyles(fontSize: 30),
              children: [
                TextSpan(
                  text: 'Me!',
                  style: AppTextStyles.headingStyles(
                      fontSize: 30, color: AppColors.robinEdgeBlue),
                ),
              ],
            ),
          ),
        ),
        Constants.sizedBox(height: 6),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400), // Adjusted duration
          child: Text(
            'Flutter Developer!',
            style: AppTextStyles.montserratStyle(color: Colors.white),
          ),
        ),
        Constants.sizedBox(height: 8),
        FadeInLeft(
          duration: const Duration(milliseconds: 1600), // Adjusted duration
          child: Text(
            "A passionate, highly motivated 3rd-year student in Computer Science and Software Engineer with a major in Mobile App Development (Flutter & Java). Competitive problem solver ranked Codeforces Specialist, experience in competitive programming, reached the ECPC finals. Passionate about developing impactful software that involves leading-edge technology with continued learning.",
            style: AppTextStyles.normalStyle(),
          ),
        ),
        Constants.sizedBox(height: 15),
        // AppButtons.buildMaterialButton(buttonName: 'Read More', onTap: () {}),
      ],
    );
  }

  // FadeInRight buildProfilePicture() {
  //   return FadeInRight(
  //     duration: const Duration(milliseconds: 1200), // Adjusted duration
  //     child: Image.asset(
  //       AppAssets.profile2, // Ensure this path is correct
  //       height: 450,
  //       width: 400,
  //     ),
  //   );
  // }
}
