import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:palmx/data/local/models/operation_log_model.dart';
import 'package:palmx/features/home/domain/usecase/stream_recent.dart';
import 'package:palmx/features/home/domain/usecase/stream_total_recent.dart';
import 'package:palmx/features/home/domain/usecase/stream_yearly_percentage.dart';
import 'package:palmx/features/home/domain/usecase/stream_yearly_total_cost.dart';

@injectable
class HomeProvider extends ChangeNotifier {
  final StreamRecent _streamRecent;
  final StreamYearlyTotalCost _streamYearlyTotalCost;
  final StreamTotalRecent _streamTotalRecent;
  final StreamYearlyPercentage _streamYearlyPercentage;
  HomeProvider(
    this._streamRecent,
    this._streamYearlyTotalCost,
    this._streamTotalRecent,
    this._streamYearlyPercentage,
  );

  Stream<List<OperationLogModel>> streamOperation() =>
      _streamRecent.call(limit: 4);

  Stream<double> streamYearlyCost() =>
      _streamYearlyTotalCost.call(date: DateTime.now());

  Stream<double> streamYearlyPercentage() =>
      _streamYearlyPercentage.call(date: DateTime.now());

  Stream<int> streamCount() => _streamTotalRecent.call();
}
