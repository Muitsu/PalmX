import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String? title;
  final Color? fillColor;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool hideErrorText;
  final IconData? prefixIcon;
  final Widget? prefixWidget;
  final IconData? suffixIcon;
  final Widget? suffixWidget;
  final TextCapitalization textCapitalization;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? titleStyle;
  final TextStyle? style;
  final String? Function(String? value)? validator;
  final void Function()? onTap;
  final void Function(String value)? onChanged;
  final AutovalidateMode autovalidateMode;
  final TextStyle errorStyle;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final bool readOnly;
  final int? maxLines;
  final bool? enabled;
  final bool addBorder;
  final bool isMandatory;
  final Color enabledBorderColor;
  final FocusNode? focusNode;
  final InputBorder? focusedBorder;
  final void Function(PointerDownEvent)? onTapOutside;
  final TextAlign textAlign;
  const CustomTextField({
    super.key,
    this.title,
    this.fillColor,
    this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.prefixWidget,
    this.style,
    this.suffixIcon,
    this.suffixWidget,
    this.textCapitalization = TextCapitalization.none,
    this.contentPadding,
    this.labelStyle,
    this.titleStyle,
    this.hintStyle,
    this.validator,
    this.onTap,
    this.onChanged,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.errorStyle = const TextStyle(height: 0.0),
    this.inputFormatters,
    this.initialValue,
    this.readOnly = false,
    this.maxLines = 1,
    this.enabled = true,
    this.addBorder = true,
    this.isMandatory = false,
    this.hideErrorText = false,
    this.focusNode,
    this.enabledBorderColor = const Color(0xFFDEDEDE),
    this.focusedBorder,
    this.onTapOutside,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null)
          Row(
            children: [
              Flexible(
                child: Text(
                  title!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style:
                      titleStyle ??
                      const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
              if (isMandatory)
                const Text("  *", style: TextStyle(color: Colors.red)),
            ],
          ),
        const SizedBox(height: 8),
        TextFormField(
          enabled: enabled,
          controller: controller,
          focusNode: focusNode,
          obscureText: obscureText,
          initialValue: initialValue,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          autovalidateMode: autovalidateMode,
          readOnly: readOnly,
          validator: validator,
          onTap: onTap,
          onTapOutside: onTapOutside,
          textAlign: textAlign,
          style: style,
          onChanged: onChanged,
          inputFormatters: inputFormatters,
          maxLines: maxLines,
          decoration: InputDecoration(
            filled: true,
            hintText: hintText,
            errorStyle: hideErrorText
                ? const TextStyle(color: Colors.transparent, fontSize: 0)
                : errorStyle,
            fillColor: (enabled ?? true) ? fillColor : Colors.white,
            enabledBorder: addBorder
                ? OutlineInputBorder(
                    borderSide: BorderSide(color: enabledBorderColor),
                    borderRadius: BorderRadius.circular(8),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
            focusedBorder:
                focusedBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
            contentPadding:
                contentPadding ??
                const EdgeInsets.only(left: 12.0, right: 12.0),
            labelStyle: labelStyle ?? const TextStyle(fontSize: 16),
            hintStyle:
                hintStyle ??
                const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
            prefixIcon:
                prefixWidget ??
                (prefixIcon != null
                    ? Icon(prefixIcon, color: Colors.grey)
                    : null),
            suffixIcon:
                suffixWidget ?? (suffixIcon != null ? Icon(suffixIcon) : null),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Color(0xFFDEDEDE),
              ), // border side config
            ),
          ),
        ),
      ],
    );
  }
}
