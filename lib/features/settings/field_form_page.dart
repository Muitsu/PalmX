import 'package:flutter/material.dart';
import 'package:palmx/data/local/datasource/fields_local_datasource.dart';
import 'package:palmx/data/local/models/field_model.dart';

class FieldFormPage extends StatefulWidget {
  final FieldModel? record;

  const FieldFormPage({super.key, this.record});

  @override
  State<FieldFormPage> createState() => _FieldFormPageState();
}

class _FieldFormPageState extends State<FieldFormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;

  @override
  void initState() {
    super.initState();
    // Initialize with existing data or defaults
    _titleController = TextEditingController(text: widget.record?.name ?? "");
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      // Logic to save to your database/provider
      final data = FieldModel.toInsert(
        id: widget.record?.id,
        name: _titleController.text,
      );
      FieldsLocalDatasource().upsert(data).then((_) {
        if (context.mounted) {
          setState(() {});
          // ignore: use_build_context_synchronously
          Navigator.pop(context, "saved");
        }
      });
    }
  }

  void _delete() {
    // Logic to delete from your database
    FieldsLocalDatasource().deleteById(widget.record!.id);
    Navigator.pop(context, "delete");
  }

  @override
  Widget build(BuildContext context) {
    bool isEdit = widget.record != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? "Edit Field" : "Add Field"),
        actions: [
          if (isEdit)
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: _delete,
            ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // Text Field
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: "Field Name",
                border: OutlineInputBorder(),
              ),
              validator: (value) => value!.isEmpty ? "Enter a name" : null,
            ),

            const SizedBox(height: 40),

            // Action Button
            ElevatedButton(
              onPressed: _save,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.black,
              ),
              child: Text(
                isEdit ? "Update" : "Create",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
