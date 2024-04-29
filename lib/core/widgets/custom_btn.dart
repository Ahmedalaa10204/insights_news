import 'package:flutter/material.dart';
import 'package:insights_news/core/utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.bgColor,
    this.fgColor,
  });
  final String text;
  final Function() onPressed;
  final double? width;
  final double? height;
  final Color? bgColor;
  final Color? fgColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? 45,
        width: width ?? 250,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: bgColor ?? AppColors.cardColor,
                foregroundColor: fgColor ?? AppColors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: onPressed,
            child: Text(text)));
  }
}