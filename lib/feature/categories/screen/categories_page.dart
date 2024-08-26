// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cred_assign/feature/categories/widgets/category_section.dart';
import 'package:cred_assign/feature/categories/widgets/wrap_arrow.dart';
import 'package:cred_assign/provider/category_provider.dart';
import 'package:cred_assign/utils/colors.dart';
import 'package:cred_assign/utils/font_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/toggle.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColor.black,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
          backgroundColor: AppColor.black,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'explore',
                  style: TextStyle(
                    fontSize: AppFontSize.h3.fontSize,
                    fontWeight: FontWeight.bold,
                    color: AppColor.textSecondary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top : 3, bottom: 15),
                  child: titleBar(context, provider),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.sections.length,
                    itemBuilder: (context, index) {
                      return CategorySectionWidget(
                          section: provider.sections[index]);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget titleBar(BuildContext context, CategoryProvider provider) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Text(
          'CRED',
          style: TextStyle(
            fontSize: AppFontSize.h1.fontSize,
            fontWeight: FontWeight.w600,
            color: AppColor.textPrimary,
          ),
        ),
       
        Padding(
          padding:  EdgeInsets.only( left: screenWidth* 0.55),
          child: CustomRectangularToggle(
            initialValue: provider.isGridView,
            onChanged: (value) {
              provider.toggleView(value);
            },
          ),
        ),
        SizedBox(width: screenWidth * 0.05),
        const GreyBlackContainer(),
      ],
    );
  }
}
