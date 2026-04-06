import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:palmx/data/local/models/operation_log_model.dart';
import 'package:palmx/features/operation/domain/usecase/get_operation_by_month.dart';

@injectable
class CalendarProvider extends ChangeNotifier {
  final GetOperationByMonth getOperationByMonth;
  CalendarProvider(this.getOperationByMonth);

  late ValueNotifier<DateTime> focusedDay;
  late ValueNotifier<List<OperationLogModel>> operationsForSelectedDay;
  List<OperationLogModel> monthLogs = [];
  bool isLoading = false;
  String? error;
  void init() {
    focusedDay = ValueNotifier(DateTime.now());
    operationsForSelectedDay = ValueNotifier([]);
    fetchMonthlyLogs(focusedDay.value);
  }

  Future<void> fetchMonthlyLogs(DateTime monthDate) async {
    setLoading(true);

    final result = await getOperationByMonth.call(monthDate);
    result.fold(
      (l) => error = l.message,
      (r) => monthLogs = r.map((e) => OperationLogModel.fromDrift(e)).toList(),
    );
    setLoading(false);
  }

  void onPageChanged(DateTime newMonthDate) {
    focusedDay.value = newMonthDate;
    fetchMonthlyLogs(newMonthDate);
  }

  void onDaySelected(List<OperationLogModel> operations, DateTime selectedDay) {
    focusedDay.value = selectedDay;
    operationsForSelectedDay.value = operations;
  }

  void setLoading(bool val) {
    isLoading = val;
    WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());
  }
}
