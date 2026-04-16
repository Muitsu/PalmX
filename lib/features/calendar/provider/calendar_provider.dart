import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:palmx/core/widgets/calendar/calendar_utils.dart';
import 'package:palmx/data/local/models/operation_log_model.dart';
import 'package:palmx/features/operation/domain/usecase/get_operation_by_month.dart';
import 'package:palmx/features/operation/presentation/operation_log/operation_log_summary_page.dart';

@injectable
class CalendarProvider extends ChangeNotifier {
  final GetOperationByMonth getOperationByMonth;
  CalendarProvider(this.getOperationByMonth);

  late ValueNotifier<DateTime> focusedDay;
  late ValueNotifier<List<OperationLogModel>> operationsForSelectedDay;
  List<OperationLogModel> monthLogs = [];
  bool isLoading = false;
  String? error;
  void init() async {
    focusedDay = ValueNotifier(DateTime.now());
    operationsForSelectedDay = ValueNotifier([]);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _fetchMonthlyLogs(focusedDay.value);
      _reFetchEvents();
    });
  }

  Future<void> _fetchMonthlyLogs(DateTime monthDate) async {
    setLoading(true);

    final result = await getOperationByMonth.call(monthDate);
    result.fold(
      (l) => error = l.message,
      (r) => monthLogs = r.map((e) => OperationLogModel.fromDrift(e)).toList(),
    );
    setLoading(false);
  }

  Future<void> refresh() async {
    await _fetchMonthlyLogs(focusedDay.value);
    _reFetchEvents();
    notifyListeners();
  }

  void _reFetchEvents() {
    final selectedDate = focusedDay.value;
    final linkHashMap = CalendarUtils.groupEventDates(
      eventList: monthLogs,
      dateNormalizer: (val) => val.operationDate,
    );
    final operations = linkHashMap[selectedDate] ?? [];
    operationsForSelectedDay.value = operations;
  }

  void onPageChanged(DateTime newMonthDate) {
    focusedDay.value = newMonthDate;
    _fetchMonthlyLogs(newMonthDate);
  }

  void onDaySelected(List<OperationLogModel> operations, DateTime selectedDay) {
    focusedDay.value = selectedDay;
    operationsForSelectedDay.value = operations;
  }

  void setLoading(bool val) {
    isLoading = val;
    notifyListeners();
  }

  OperationLogModel? viewData;
  void viewDetails(BuildContext context, {required OperationLogModel data}) {
    viewData = data;
    notifyListeners();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => OperationLogSummaryPage()),
    );
  }

  void setViewData({required OperationLogModel data}) {
    viewData = data;
    notifyListeners();
  }
}
