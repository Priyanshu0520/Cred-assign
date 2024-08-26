import 'package:cred_assign/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomRectangularToggle extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const CustomRectangularToggle({
    super.key,
    this.initialValue = false,
    required this.onChanged,
  });

  @override
  _CustomRectangularToggleState createState() =>
      _CustomRectangularToggleState();
}

class _CustomRectangularToggleState extends State<CustomRectangularToggle> {
  late bool isToggled;

  @override
  void initState() {
    super.initState();
    isToggled = widget.initialValue;
  }

  void toggleSwitch() {
    setState(() {
      isToggled = !isToggled;
      widget.onChanged(isToggled);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleSwitch,
      child: Container(
        width: 48,
        height: 23,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: AppColor.textPrimary, width: 1.5),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              left: isToggled ? 23 : -1,
              child: Container(
                width: 22,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColor.textPrimary,
                  border: Border.all(color: AppColor.black, width: 1.5),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: isToggled
                      ? const Icon(Icons.line_weight_sharp,
                          size: 15,
                          color: AppColor.black,
                          key: ValueKey<bool>(true))
                      : const Icon(Icons.grid_view_sharp,
                          size: 15,
                          color: AppColor.black,
                          key: ValueKey<bool>(false)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
