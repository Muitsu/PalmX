import 'package:flutter/material.dart';

// Your existing reusable screen
class EditFieldPage extends StatefulWidget {
  final String title;
  final String initialValue;
  final Function(String) onSave;

  const EditFieldPage({
    super.key,
    required this.title,
    required this.initialValue,
    required this.onSave,
  });

  @override
  State<EditFieldPage> createState() => _EditFieldPageState();
}

class _EditFieldPageState extends State<EditFieldPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    // You can customize this screen's UI if needed, but its main purpose is functional.
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Edit ${widget.title}"),
        backgroundColor: Colors.white, // Match the main screen's look
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.check, color: Colors.black),
            onPressed: () {
              widget.onSave(_controller.text);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _controller,
          autofocus: true,
          decoration: InputDecoration(
            labelText: widget.title,
            border: const OutlineInputBorder(),
          ),
          // Add custom logic if needed based on title
          // e.g., if (widget.title == 'Phone') keyboardType = TextInputType.phone
        ),
      ),
    );
  }
}
