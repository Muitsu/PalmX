import 'package:palmx/features/calendar/provider/calendar_provider.dart';
import 'package:palmx/features/home/presentations/provider/home_provider.dart';
import 'package:palmx/features/operation/presentation/provider/operation_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../di/injection.dart';

//REGISTER PROVIDERS HERE
class AppProviders {
  static List<SingleChildWidget> get providers => _providers;

  static final List<SingleChildWidget> _providers = [
    ChangeNotifierProvider(create: (_) => sl<OperationProvider>()),
    ChangeNotifierProvider(create: (_) => sl<CalendarProvider>()),
    ChangeNotifierProvider(create: (_) => sl<HomeProvider>()),
  ];
}

T sl<T extends Object>() => getIt<T>();
