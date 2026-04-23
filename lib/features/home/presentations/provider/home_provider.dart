import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:palmx/core/local/database.dart';
import 'package:palmx/features/home/domain/usecase/stream_monthly_percentage.dart';
import 'package:palmx/features/home/domain/usecase/stream_monthly_total_cost.dart';
import 'package:palmx/features/home/domain/usecase/stream_recent.dart';
import 'package:palmx/features/home/domain/usecase/stream_total_recent.dart';

@injectable
class HomeProvider extends ChangeNotifier {
  final StreamRecent _streamRecent;
  final StreamMonthlyTotalCost _streamMonthlyTotalCost;
  final StreamTotalRecent _streamTotalRecent;
  final StreamMonthlyPercentage _streamMonthlyPercentage;
  HomeProvider(
    this._streamRecent,
    this._streamMonthlyTotalCost,
    this._streamTotalRecent,
    this._streamMonthlyPercentage,
  );

  Stream<List<OperationLogsTableData>> streamOperation() =>
      _streamRecent.call(limit: 4);

  Stream<double> streamMonthlyCost() =>
      _streamMonthlyTotalCost.call(date: DateTime.now());

  Stream<double> streamMonthlyPercentage() =>
      _streamMonthlyPercentage.call(date: DateTime.now());

  Stream<int> streamCount() => _streamTotalRecent.call();
}
