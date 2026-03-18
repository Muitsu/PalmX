import 'package:flutter/material.dart';

enum AlertBtnPosition { leftRignt, topDown }

class CustomAlertDialog extends StatefulWidget {
  final String title;
  final String subtitle;
  final String colorBtnLabel; // This is the "OK" action
  final String? dimmedBtnLabel; // This is the "CANCEL" action
  final AlertBtnPosition position;
  final void Function()? onColorBtn;
  final void Function()? onDimmedBtn;
  final bool barrierDismissible;

  const CustomAlertDialog({
    super.key,
    required this.title,
    this.onColorBtn,
    this.onDimmedBtn,
    required this.colorBtnLabel,
    this.dimmedBtnLabel,
    required this.subtitle,
    this.position = AlertBtnPosition.leftRignt,
    this.barrierDismissible = true,
  });

  Future<T?> show<T>(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) => this,
    );
  }

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  // Styles based on your image
  final Color bgColor = const Color.fromARGB(255, 255, 255, 255);
  final TextStyle titleStyle = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  final TextStyle subtitleStyle = const TextStyle(
    color: Colors.black54,
    fontSize: 16,
  );

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: ModalRoute.of(context)!.animation!,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeIn,
      ),
      child: AlertDialog(
        backgroundColor: bgColor,
        surfaceTintColor: Colors.transparent, // Prevents Material 3 tinting
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Text(widget.title, style: titleStyle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _subtitle(),
            const SizedBox(height: 16),
            _buildActionLayout(),
          ],
        ),
      ),
    );
  }

  Widget _subtitle() {
    return Text(widget.subtitle, style: subtitleStyle);
  }

  // Determines how buttons are laid out
  Widget _buildActionLayout() {
    if (widget.position == AlertBtnPosition.topDown) {
      return Column(mainAxisSize: MainAxisSize.min, children: _listButton());
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end, // Align buttons to the right
        children: _listButton().reversed.toList(),
      );
    }
  }

  List<Widget> _listButton() {
    return [
      _button(
        onPressed: widget.onColorBtn,
        title: widget.colorBtnLabel,
        textColor: Colors.blue, // Primary action color
        isBold: true,
      ),
      if (widget.dimmedBtnLabel != null)
        _button(
          onPressed: widget.onDimmedBtn,
          title: widget.dimmedBtnLabel!,
          textColor: Colors.black, // Secondary action color
          isBold: false,
        ),
    ];
  }

  Widget _button({
    required String title,
    required void Function()? onPressed,
    required Color textColor,
    bool isBold = false,
  }) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16),
      ),
      onPressed: () {
        if (onPressed != null) onPressed();
      },
      child: Text(
        title.toUpperCase(), // Dialog buttons are usually uppercase
        style: TextStyle(
          color: textColor,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          fontSize: 15,
        ),
      ),
    );
  }
}
