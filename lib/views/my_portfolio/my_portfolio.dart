import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_assets.dart';
import 'package:my_portfolio/globals/app_colors.dart';
import 'package:my_portfolio/globals/app_text_styles.dart';
import 'package:my_portfolio/globals/constants.dart';
import 'package:my_portfolio/helper/helper_class.dart';
import 'package:my_portfolio/views/my_portfolio/project.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MyPortfolio extends StatefulWidget {
  const MyPortfolio({super.key});

  @override
  State<MyPortfolio> createState() => _MyPortfolioState();
}

class _MyPortfolioState extends State<MyPortfolio> {
  final onHoverEffect = Matrix4.identity()..scale(1);

  List<Project> projects = <Project>[
    Project(
      image: AppAssets.work1,
      title: 'Notes App',
      description: 'A Flutter app for creating and organizing notes.',
      url: 'https://github.com/sayedmostaf/notes-app',
      type: 'App Development',
    ),
    Project(
      image: AppAssets.work2,
      title: 'Store App',
      description: 'An simple shopping app built with Flutter.',
      url: 'https://github.com/sayedmostaf/store-app/',
      type: 'App Development',
    ),
    Project(
      image: AppAssets.work6,
      title: 'Portfolio Website',
      description: 'A personal portfolio website to showcase projects.',
      url: 'https://github.com/sayedmostaf/my-portfolio',
      type: 'Web Development',
    ),
    Project(
      image: AppAssets.work3,
      title: 'Weather App',
      description: 'A Flutter app that provides weather forecasts.',
      url: 'https://github.com/sayedmostaf/WeatherApp',
      type: 'App Development',
    ),
    Project(
      image: AppAssets.work4,
      title: 'Tic Tac Toe',
      description:
          'A classic Tic Tac Toe game built with Flutter, allowing two players to compete in a fun and interactive way.',
      url: 'https://github.com/sayedmostaf/TicTacToe',
      type: 'App Development',
    ),
    Project(
      image: AppAssets.work5,
      title: 'Chat App',
      description:
          'A real-time chat application built with Flutter, enabling users to send messages, and stay connected with friends. The app features a sleek UI, seamless message delivery, and user authentication.',
      url: 'https://github.com/sayedmostaf/chat-app',
      type: 'App Development',
    ),
  ];

  var hoveredIndex;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 1),
        ],
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 2),
        ],
      ),
      desktop: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 3),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor2,
    );
  }

  FadeInDown buildProjectText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'Latest ',
          style: AppTextStyles.headingStyles(
            fontSize: 30,
          ),
          children: [
            TextSpan(
              text: 'Projects',
              style: AppTextStyles.headingStyles(
                fontSize: 30,
                color: AppColors.robinEdgeBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  GridView buildProjectGridView({required int crossAxisCount}) {
    return GridView.builder(
      itemCount: projects.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: 280,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
      ),
      itemBuilder: (context, index) {
        var project = projects[index];
        return FadeInUpBig(
          duration: const Duration(milliseconds: 1600),
          child: InkWell(
            onTap: () {
              // launchUrl(project.url);
            },
            onHover: (value) {
              setState(() {
                if (value) {
                  hoveredIndex = index;
                } else {
                  hoveredIndex = null;
                }
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(project.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Visibility(
                    visible: index == hoveredIndex,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      transform: index == hoveredIndex ? onHoverEffect : null,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            AppColors.themeColor.withOpacity(1),
                            AppColors.themeColor.withOpacity(0.9),
                            AppColors.themeColor.withOpacity(0.8),
                            AppColors.themeColor.withOpacity(0.6),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            project.type,
                            style: AppTextStyles.montserratStyle(
                              color: Colors.black87,
                              fontSize: 20,
                            ),
                          ),
                          Constants.sizedBox(height: 15),
                          Text(
                            project.description,
                            style: AppTextStyles.normalStyle(
                                color: Colors.black87),
                            textAlign: TextAlign.center,
                          ),
                          Constants.sizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () => launchUrl(project.url),
                            child: CircleAvatar(
                              maxRadius: 25,
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                AppAssets.share,
                                width: 25,
                                height: 25,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
