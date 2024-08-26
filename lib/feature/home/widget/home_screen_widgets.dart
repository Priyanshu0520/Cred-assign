import 'package:cred_assign/provider/category_provider.dart';
import 'package:cred_assign/utils/colors.dart';
import 'package:cred_assign/utils/font_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeWidgets extends StatelessWidget {
  const HomeWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final selectedItem = Provider.of<CategoryProvider>(context).selectedItem;

    if (selectedItem == null) {
      return const Center(child: SizedBox());
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: screenHeight * 0.23,
            width: screenWidth * 0.23,
            child: Image.network(selectedItem.imageUrl, fit: BoxFit.contain)),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'CRED ',
                style: TextStyle(
                 fontSize: AppFontSize.h1.fontSize,
                  fontWeight: FontWeight.bold,
                  color: AppColor.textPrimary,
                ),
              ),
              TextSpan(
                text: selectedItem.name,
                style: TextStyle(
                fontSize: AppFontSize.h2.fontSize,
                  fontWeight: FontWeight.w600,
                  color: AppColor.textPrimary,
                ),
              ),
            ],
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SizedBox(
              height: screenHeight * 0.07,
              width: screenWidth * 0.35,
            child: Text(
              selectedItem.description,
              style: TextStyle(
             fontSize: AppFontSize.body3.fontSize,
                fontWeight: FontWeight.w500,
                color: AppColor.textPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
