import 'package:cred_assign/utils/colors.dart';
import 'package:cred_assign/utils/font_config.dart';
import 'package:flutter/material.dart';

class Custom3DButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const Custom3DButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final buttonWidth = screenWidth * 0.8;
    final buttonHeight = screenHeight * 0.07;
    final offset = screenHeight * 0.004;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: buttonWidth,
            height: buttonHeight,
            decoration: BoxDecoration(
              color: AppColor.textSecondary,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Positioned(
            bottom: offset,
            right: offset,
            child: Container(
              width: buttonWidth,
              height: buttonHeight,
              decoration: BoxDecoration(
                color: AppColor.textPrimary,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: AppFontSize.body1.fontSize,
                        fontWeight: FontWeight.bold,
                        color: AppColor.black,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
