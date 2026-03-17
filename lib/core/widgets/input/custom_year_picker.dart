import 'package:flutter/material.dart';

class CustomYearPicker extends StatefulWidget {
  final DateTime? initialYear;
  final void Function(DateTime? date) onSelectedDate;

  const CustomYearPicker({
    super.key,
    required this.onSelectedDate,
    this.initialYear,
  });

  @override
  State<CustomYearPicker> createState() => _CustomYearPickerState();

  static Future show(
    BuildContext context, {
    DateTime? initialYear,
    required void Function(DateTime? data) onSelectedDate,
  }) {
    return showDialog(
      context: context,
      builder: (_) => CustomYearPicker(
        initialYear: initialYear,
        onSelectedDate: onSelectedDate,
      ),
    );
  }
}

class _CustomYearPickerState extends State<CustomYearPicker> {
  late ValueNotifier<DateTime?> selectedYear;
  @override
  void initState() {
    super.initState();
    selectedYear = ValueNotifier(widget.initialYear);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Select Year",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: selectedYear,
              builder: (context, value, child) {
                return SizedBox(
                  height: size.height * .35,
                  child: YearPicker(
                    firstDate: DateTime.now().subtract(
                      const Duration(days: 365 * 4),
                    ),
                    lastDate: DateTime(DateTime.now().year + 10),
                    selectedDate: value,
                    onChanged: (dateTime) {
                      selectedYear.value = dateTime;
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: 54,
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ValueListenableBuilder(
                      valueListenable: selectedYear,
                      builder: (context, value, child) {
                        return ElevatedButton(
                          onPressed: () {
                            widget.onSelectedDate(value);
                          },
                          child: const Text("Apply"),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
