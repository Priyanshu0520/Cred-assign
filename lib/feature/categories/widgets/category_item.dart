// ignore_for_file: use_super_parameters

import 'package:cred_assign/utils/colors.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final bool isGridView;
  final String identifier;
  final VoidCallback onTap;

  const CategoryItemWidget({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.isGridView,
    required this.identifier,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final itemImage = Container(
      width: isGridView ? screenWidth * 0.2 : screenWidth * 0.18,
      height: screenHeight * 0.08,
      decoration: BoxDecoration(
        color: AppColor.primary,
        shape: BoxShape.circle,
        border: Border.all(color: AppColor.primary, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Image.network(imageUrl),
      ),
    );

    if (isGridView) {
      return InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(tag: identifier, child: itemImage),
            Padding(
              padding:  EdgeInsets.only(top: 4.0),
              child: Text(
                name,
                textAlign: TextAlign.center,
                style:   const TextStyle(
                  fontSize: 14, 
                  fontWeight: FontWeight.bold,
                  color: AppColor.textPrimary,
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            children: [
              Hero(tag: identifier, child: itemImage),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14, 
                            fontWeight: FontWeight.bold,
                            color: AppColor.textPrimary,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          description,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColor.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
