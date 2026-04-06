import 'package:flutter/material.dart';
import 'package:palmx/core/widgets/input/custom_dropdown_sheet.dart';
import 'package:palmx/data/local/datasource/activity_local_datasource.dart';
import 'package:palmx/data/local/datasource/fields_local_datasource.dart';
import 'package:palmx/data/local/datasource/material_local_datasource.dart';
import 'package:palmx/data/local/models/activity_model.dart';
import 'package:palmx/data/local/models/field_model.dart';
import 'package:palmx/data/local/models/material_model.dart';
import 'package:palmx/features/settings/activity_form_page.dart';
import 'package:palmx/features/settings/field_form_page.dart';
import 'package:palmx/features/settings/material_form_page.dart';

class DropdownService {
  // MARK: Activity Dropdown
  static void showActivity(
    BuildContext context, {
    ActivityModel? initialValue,
    required void Function(ActivityModel?) onSelected,
  }) {
    CustomDropdownSheet.show<ActivityModel>(
      context,
      label: "Activity",
      accentColor: Colors.deepOrange,
      itemsStream: ActivityLocalDatasource().watchAll().map(
        (rows) => rows.map((e) => ActivityModel.fromDrift(e)).toList(),
      ),
      groupValue: initialValue,
      getTitle: (item) => item.name ?? "-",
      onChange: onSelected,
      onLongPress: (item) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ActivityFormPage(record: item),
          ),
        );
      },
    );
  }

  // MARK: Field Dropdown
  static void showField(
    BuildContext context, {
    FieldModel? initialValue,
    required void Function(FieldModel?) onSelected,
  }) {
    CustomDropdownSheet.show<FieldModel>(
      context,
      label: "Field",
      accentColor: Colors.deepOrange,
      itemsStream: FieldsLocalDatasource().watchAll().map(
        (rows) => rows.map((e) => FieldModel.fromDrift(e)).toList(),
      ),
      groupValue: initialValue,
      getTitle: (item) => item.name,
      onChange: onSelected,
      onLongPress: (item) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FieldFormPage(record: item)),
        );
      },
    );
  }

  // MARK: Material Dropdown

  static void showMaterial(
    BuildContext context, {
    MaterialModel? initialValue,
    required void Function(MaterialModel?) onSelected,
  }) {
    CustomDropdownSheet.show<MaterialModel>(
      context,
      label: "Material",
      accentColor: Colors.deepOrange,
      itemsStream: MaterialsLocalDatasource().watchAll().map(
        (rows) => rows.map((e) => MaterialModel.fromDrift(e)).toList(),
      ),
      groupValue: initialValue,
      getTitle: (item) => item.name,
      onChange: onSelected,
      onLongPress: (item) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MaterialFormPage(record: item),
          ),
        );
      },
    );
  }
}
