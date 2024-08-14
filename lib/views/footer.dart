import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_colors.dart';
import 'package:my_portfolio/globals/app_text_styles.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      color: AppColors.bgColor,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    'Build using ',
                    style: AppTextStyles.normalStyle(
                      color: Colors.white,
                    ),
                  ),
                  Image.asset(
                    'assets/images/flutter.png',
                    height: 20,
                    width: 20,
                  ),
                  Text(
                    ' with ',
                    style: AppTextStyles.normalStyle(
                      color: Colors.white,
                    ),
                  ),
                  const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ],
              ),
              Text(
                '© Sayed Mostafa Attia',
                style: AppTextStyles.normalStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          // InkWell(
          //   onTap: () {},
          //   child: Container(
          //     height: 40,
          //     width: 40,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10),
          //       color: AppColors.themeColor,
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.black.withOpacity(0.2),
          //           spreadRadius: 2,
          //           blurRadius: 5,
          //           offset: const Offset(0, 3),
          //         )
          //       ],
          //     ),
          //     // child: const Icon(
          //     //   Icons.arrow_upward,
          //     //   size: 25,
          //     //   color: Colors.black,
          //     // ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
