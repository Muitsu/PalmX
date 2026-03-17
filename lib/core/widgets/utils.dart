import 'package:flutter/material.dart';
import 'package:palmx/core/service/app_navigator.dart';
import '../service/app_snackbar.dart';
import 'input/custom_textfield.dart';

Widget groupContainer({required Widget child, Color? color}) {
  return Container(
    decoration: BoxDecoration(
      color: color ?? Colors.black38,
      borderRadius: BorderRadius.circular(16),
    ),
    child: child,
  );
}

Widget listTile({
  required String title,
  required IconData icon,
  void Function()? onTap,
  bool showDivider = true,
  Color? forgroundColor,
}) {
  return Column(
    children: [
      ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        leading: Icon(icon, color: forgroundColor ?? Colors.white70),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, color: forgroundColor ?? Colors.white),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.white54),
        onTap: onTap,
      ),
      if (showDivider)
        Divider(color: Colors.white.withValues(alpha: 0.05), height: 1),
    ],
  );
}

Widget buildTextField({
  required String label,
  required String hint,
  int maxLines = 1,
  TextEditingController? ctrl,
  Widget? prefixWidget,
  bool readOnly = false,
  TextInputType keyboardType = TextInputType.text,
  void Function()? onTap,
  String? Function(String?)? validator,
  bool? isDropdown,
}) {
  return CustomTextField(
    title: label,
    hintText: hint,
    controller: ctrl,
    readOnly: (isDropdown == null) ? readOnly : true,
    onTap: onTap,
    keyboardType: keyboardType,
    validator: validator,
    contentPadding: EdgeInsets.all(12),
    hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
    titleStyle: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
    fillColor: Colors.black.withValues(alpha: 0.05),
    style: const TextStyle(color: Colors.white),
    prefixWidget: prefixWidget,
    suffixWidget: (isDropdown ?? false) ? Icon(Icons.arrow_drop_down) : null,
    addBorder: true,
    maxLines: maxLines,
    onTapOutside: (PointerDownEvent event) {
      FocusManager.instance.primaryFocus?.unfocus();
    },
  );
}

Future<void> showSuccess(
  BuildContext context, {
  required String message,
}) async {
  final ctx = AppNavigator.context;
  AppSnackbar.showSuccess(ctx, message);
}

Future<void> showInfo(BuildContext context, {required String message}) async {
  final ctx = AppNavigator.context;
  AppSnackbar.showInfo(ctx, message);
}

Future<void> showError(BuildContext context, {required String message}) async {
  final ctx = AppNavigator.context;
  AppSnackbar.showError(ctx, message);
}
