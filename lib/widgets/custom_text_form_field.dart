import 'package:flutter/material.dart';


import 'package:flutter/material.dart';
import 'package:new_astro/utils/theme_color.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final TextStyle? labelStyle; // New property for label text style
  final String? hintText;
  final TextStyle? hintStyle; // Property for hint text style
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool? enabled;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final void Function()? suffixIconOnPressed;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final InputBorder? border;

  const CustomTextFormField({
    super.key,
    this.labelText,
    this.labelStyle, // Accept label style as input
    this.hintText,
    this.hintStyle, // Accept hint style as input
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.enabled,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconOnPressed,
    this.maxLength,
    this.textInputAction,
    this.border, // Optional border
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      enabled: enabled,
      maxLength: maxLength,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: labelStyle ?? const TextStyle(color: ThemeColor.blackColor), // Default label style
        hintText: hintText,
        hintStyle: hintStyle ?? const TextStyle(color: ThemeColor.greyColor), // Default hint style
        border: border ?? const OutlineInputBorder(), // Default border
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null
            ? IconButton(
          icon: Icon(suffixIcon),
          onPressed: suffixIconOnPressed,
        )
            : null,
      ),
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
    );
  }
}


