import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_assets.dart';
import 'package:my_portfolio/globals/app_buttons.dart';
import 'package:my_portfolio/globals/app_colors.dart';
import 'package:my_portfolio/globals/app_text_styles.dart';
import 'package:my_portfolio/globals/constants.dart';
import 'package:my_portfolio/helper/helper_class.dart';
import 'package:my_portfolio/widgets/profile_animation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final socialButtons = <Map<String, String>>[
    {
      'asset': AppAssets.facebook,
      'url': 'https://www.facebook.com/profile.php?id=100090430537950'
    },
    {
      'asset': AppAssets.codeforces,
      'url': 'https://codeforces.com/profile/Sayed_Mostafa'
    },
    {
      'asset': AppAssets.linkedIn,
      'url': 'https://www.linkedin.com/in/sayed-mostafa-915374246'
    },
    {
      'asset': AppAssets.upwork,
      'url': 'https://www.upwork.com/freelancers/~013976b369e4024ca9'
    },
    {'asset': AppAssets.github, 'url': 'https://github.com/sayedmostaf'},
  ];

  var social;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return HelperClass(
      mobile: Column(
        children: [
          buildHomePersonalInfo(size),
          Constants.sizedBox(height: 25.0),
          const ProfileAnimation(),
        ],
      ),
      tablet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: buildHomePersonalInfo(size)),
          const ProfileAnimation(),
        ],
      ),
      desktop: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: buildHomePersonalInfo(size)),
          const ProfileAnimation(),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: Colors.transparent,
    );
  }

  Column buildHomePersonalInfo(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 1200), // Adjusted duration
          child: Text(
            'Hello, It\'s Me',
            style: AppTextStyles.montserratStyle(color: Colors.white),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInRight(
          duration: const Duration(milliseconds: 1400), // Adjusted duration
          child: Text(
            'Sayed Mostafa',
            style: AppTextStyles.headingStyles(),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400), // Adjusted duration
          child: Row(
            children: [
              Text(
                'And I\'m a ',
                style: AppTextStyles.montserratStyle(color: Colors.white),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'Flutter Developer',
                    textStyle: AppTextStyles.montserratStyle(
                        color: AppColors.themeColor),
                  ),
                  TyperAnimatedText(
                    'Problem Solver',
                    textStyle: AppTextStyles.montserratStyle(
                        color: AppColors.themeColor),
                  ),
                  TyperAnimatedText(
                    'Freelancer',
                    textStyle: AppTextStyles.montserratStyle(
                        color: AppColors.themeColor),
                  ),
                ],
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
            ],
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInDown(
          duration: const Duration(milliseconds: 1600), // Adjusted duration
          child: Text(
            "I design and develop high-performance mobile apps for iOS and Android, focusing on user experience and seamless functionality. My expertise spans native and cross-platform development, ensuring robust, responsive applications.",
            style: AppTextStyles.normalStyle(),
          ),
        ),
        Constants.sizedBox(height: 22.0),
        FadeInUp(
          duration: const Duration(milliseconds: 1600), // Adjusted duration
          child: SizedBox(
            height: 48,
            child: ListView.separated(
              itemCount: socialButtons.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, child) =>
                  Constants.sizedBox(width: 8.0),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => launchUrl(socialButtons[index]['url']!),
                  onHover: (value) {
                    setState(() {
                      social = value ? index : null;
                    });
                  },
                  borderRadius: BorderRadius.circular(550.0),
                  hoverColor: AppColors.themeColor,
                  splashColor: AppColors.lawGreen,
                  child: buildSocialButton(
                    asset: socialButtons[index]['asset']!,
                    hover: social == index,
                  ),
                );
              },
            ),
          ),
        ),
        Constants.sizedBox(height: 18.0),
        FadeInUp(
          duration: const Duration(milliseconds: 1800), // Adjusted duration
          child: AppButtons.buildMaterialButton(
              onTap: () {}, buttonName: 'Download CV'),
        ),
      ],
    );
  }

  Ink buildSocialButton({required String asset, required bool hover}) {
    return Ink(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.themeColor, width: 2.0),
        color: AppColors.bgColor,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(6),
      child: Image.asset(
        asset,
        width: 20, // Adjusted width for visibility
        height: 20, // Adjusted height for visibility
        color: hover ? AppColors.bgColor : AppColors.themeColor,
      ),
    );
  }

  void launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrlString(uri.toString(),
          mode: LaunchMode.externalApplication);
    } else {
      throw 'Colud not launch $url';
    }
  }
}
