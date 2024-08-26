import 'package:cred_assign/feature/home/widget/custom_button.dart';
import 'package:cred_assign/feature/home/widget/home_screen_widgets.dart';
import 'package:cred_assign/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Spacer(),
              Padding(
                padding:  EdgeInsets.only(
                  left: screenWidth*0.1,
                  bottom: screenWidth*0.07
                ),
                child: const HomeWidgets(),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.1),
                child: Custom3DButton(
                  text: "Go to Category",
                  onTap: () => Navigator.pushNamed(context, '/categories'),
                ),
              ),
              const SizedBox(height: 40), 
            ],
          ),
        ],
      ),
    );
  }
}
