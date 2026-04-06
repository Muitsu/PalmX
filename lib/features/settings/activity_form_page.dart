import 'package:flutter/material.dart';
import 'package:palmx/data/local/datasource/activity_local_datasource.dart';
import 'package:palmx/data/local/models/activity_model.dart';
import 'package:palmx/data/local/tables/activity_table.dart';

class ActivityFormPage extends StatefulWidget {
  final ActivityModel? record;

  const ActivityFormPage({super.key, this.record});

  @override
  State<ActivityFormPage> createState() => _ActivityFormPageState();
}

class _ActivityFormPageState extends State<ActivityFormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late ActivityCost _selectedCost;

  @override
  void initState() {
    super.initState();
    // Initialize with existing data or defaults
    _titleController = TextEditingController(text: widget.record?.name ?? "");
    _selectedCost = widget.record?.activityCost ?? ActivityCost.costHA;
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      // Logic to save to your database/provider
      final data = ActivityModel.toInsert(
        id: widget.record?.id,
        name: _titleController.text,
        activityCost: _selectedCost,
      );
      ActivityLocalDatasource().upsert(data).then((_) {
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
    ActivityLocalDatasource().deleteById(widget.record!.id!);
    Navigator.pop(context, "delete");
  }

  @override
  Widget build(BuildContext context) {
    bool isEdit = widget.record != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? "Edit Activity" : "Add Activity"),
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
                labelText: "Activity Name",
                border: OutlineInputBorder(),
              ),
              validator: (value) => value!.isEmpty ? "Enter a name" : null,
            ),
            const SizedBox(height: 20),

            // Dropdown Field
            DropdownButtonFormField<ActivityCost>(
              initialValue: _selectedCost,
              decoration: const InputDecoration(
                labelText: "Cost Category",
                border: OutlineInputBorder(),
              ),
              items: ActivityCost.values.map((ActivityCost type) {
                return DropdownMenuItem<ActivityCost>(
                  value: type,
                  child: Text(type.name.toUpperCase()), // e.g., COSTHA
                );
              }).toList(),
              onChanged: (value) {
                setState(() => _selectedCost = value!);
              },
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
