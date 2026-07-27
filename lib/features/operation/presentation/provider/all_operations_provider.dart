import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:palmx/data/local/models/activity_model.dart';
import 'package:palmx/data/local/models/operation_log_model.dart';
import 'package:palmx/features/operation/domain/usecase/stream_filtered_operations.dart';

@injectable
class AllOperationsProvider extends ChangeNotifier {
  final StreamFilteredOperations _streamFilteredOperations;
  AllOperationsProvider(this._streamFilteredOperations);

  ActivityModel? selectedActivity;
  DateTime? selectedMonth;

  bool get hasFilters => selectedActivity != null || selectedMonth != null;

  Stream<List<OperationLogModel>> get filteredStream =>
      _streamFilteredOperations.call(
        month: selectedMonth,
        activityType: selectedActivity?.name,
      );

  void setActivity(ActivityModel? activity) {
    selectedActivity = activity;
    notifyListeners();
  }

  void setMonth(DateTime? month) {
    selectedMonth = month;
    notifyListeners();
  }

  void clearFilters() {
    selectedActivity = null;
    selectedMonth = null;
    notifyListeners();
  }
}
