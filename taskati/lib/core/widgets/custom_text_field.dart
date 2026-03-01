import 'package:flutter/material.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.keyboardType,
    this.enabled = true,
    this.onTap,
    this.onChange,
    this.focusNode,
    this.maxLines = 1,
    this.minLines,
    this.readOnly = false,
    this.contentPadding,
    this.textStyle,
    this.label,
  });
  final TextEditingController? controller;
  final String hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool enabled;
  final Function()? onTap;
  final Function(String)? onChange;
  final FocusNode? focusNode;
  final int maxLines;
  final int? minLines;
  final bool readOnly;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? textStyle;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: TextStyles.caption1.copyWith(
              color: AppColors.secondaryColor,
            ),
          ),
          const SizedBox(height: 10),
        ],
        TextFormField(
          controller: controller,
          enabled: enabled,
          readOnly: readOnly,
          focusNode: focusNode,
          keyboardType: keyboardType,
          maxLines: maxLines,
          minLines: minLines,
          style: TextStyles.body,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hint,
            contentPadding:
                contentPadding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
          validator: validator,
          onTap: onTap,
          onChanged: onChange,
        ),
      ],
    );
  }
}
