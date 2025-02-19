import 'package:flutter/material.dart';
import 'package:new_astro/utils/theme_color.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double borderRadius;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final bool isLoading;
  final IconData? icon;
  final double? borderWidth;
  final Color? borderColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 8.0,
    this.height = 50.0,
    this.width,
    this.textStyle,
    this.isLoading = false,
    this.icon,
    this.borderWidth = 1.0, // Default border width
    this.borderColor, // Default border color
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: Container(
        height: height,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: borderColor ?? ThemeColor.transparent, // Use the border color or transparent
            width: borderWidth!, // Apply the border width
          ),
        ),
        alignment: Alignment.center,
        child: isLoading
            ? const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(ThemeColor.textWhiteColor),
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, color: textColor ?? ThemeColor.textWhiteColor),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: textStyle ??
                  TextStyle(
                    color: textColor ?? ThemeColor.textWhiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

