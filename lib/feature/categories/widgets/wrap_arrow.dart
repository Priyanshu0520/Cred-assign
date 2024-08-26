import 'package:cred_assign/utils/colors.dart';
import 'package:flutter/material.dart';

class GreyBlackContainer extends StatelessWidget {
  const GreyBlackContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          color: AppColor.black,
          border: Border.all(color: AppColor.textSecondary, width: 2),
        ),
        child: Center(
          child: Transform.rotate(
            angle: -1.57,
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.grey,
              size: 15,
            ),
          ),
        ),
      ),
    );
  }
}
