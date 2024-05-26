import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? isObscureText;
  final String? obscureCharacter;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomTextField({
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isObscureText = false,
    this.obscureCharacter = '*',
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon, TextStyle? textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isObscureText!,
      obscuringCharacter: obscureCharacter!,
      style: TextStyle(color: isDark ? Colors.white : Colors.black), // Text color based on theme brightness
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 12.0),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(color: isDark ? Colors.black54 : Colors.black54), // Hint text color based on theme brightness
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
