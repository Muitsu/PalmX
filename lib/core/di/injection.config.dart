// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:palmx/core/local/database.dart' as _i516;
import 'package:palmx/core/local/di/database_module.dart' as _i567;
import 'package:palmx/data/local/services/database_backup_service.dart'
    as _i954;
import 'package:palmx/features/calendar/provider/calendar_provider.dart'
    as _i209;
import 'package:palmx/features/home/domain/usecase/stream_monthly_percentage.dart'
    as _i869;
import 'package:palmx/features/home/domain/usecase/stream_monthly_total_cost.dart'
    as _i365;
import 'package:palmx/features/home/domain/usecase/stream_recent.dart' as _i6;
import 'package:palmx/features/home/domain/usecase/stream_total_recent.dart'
    as _i748;
import 'package:palmx/features/home/presentations/provider/home_provider.dart'
    as _i256;
import 'package:palmx/features/operation/data/datasource/operation_log_local_datasource.dart'
    as _i982;
import 'package:palmx/features/operation/data/repository/operation_local_repository_impl.dart'
    as _i334;
import 'package:palmx/features/operation/domain/repository/operation_repository.dart'
    as _i649;
import 'package:palmx/features/operation/domain/usecase/get_operation_by_month.dart'
    as _i160;
import 'package:palmx/features/operation/domain/usecase/save_operation.dart'
    as _i911;
import 'package:palmx/features/operation/presentation/provider/operation_provider.dart'
    as _i233;
import 'package:palmx/features/settings/provider/setting_provider.dart'
    as _i308;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final databaseModule = _$DatabaseModule();
    gh.lazySingleton<_i516.AppDatabase>(() => databaseModule.appDatabase);
    gh.lazySingleton<_i954.DatabaseBackupService>(
      () => _i954.DatabaseBackupService(gh<_i516.AppDatabase>()),
    );
    gh.lazySingleton<_i982.OperationLogsLocalDatasource>(
      () => _i982.OperationLogsLocalDatasource(gh<_i516.AppDatabase>()),
    );
    gh.lazySingleton<_i649.OperationRepository>(
      () => _i334.OperationLocalRepositoryImpl(
        gh<_i982.OperationLogsLocalDatasource>(),
      ),
    );
    gh.factory<_i308.SettingProvider>(
      () => _i308.SettingProvider(gh<_i954.DatabaseBackupService>()),
    );
    gh.lazySingleton<_i869.StreamMonthlyPercentage>(
      () => _i869.StreamMonthlyPercentage(gh<_i649.OperationRepository>()),
    );
    gh.lazySingleton<_i365.StreamMonthlyTotalCost>(
      () => _i365.StreamMonthlyTotalCost(gh<_i649.OperationRepository>()),
    );
    gh.lazySingleton<_i6.StreamRecent>(
      () => _i6.StreamRecent(gh<_i649.OperationRepository>()),
    );
    gh.lazySingleton<_i748.StreamTotalRecent>(
      () => _i748.StreamTotalRecent(gh<_i649.OperationRepository>()),
    );
    gh.lazySingleton<_i160.GetOperationByMonth>(
      () => _i160.GetOperationByMonth(gh<_i649.OperationRepository>()),
    );
    gh.lazySingleton<_i911.SaveOperation>(
      () => _i911.SaveOperation(gh<_i649.OperationRepository>()),
    );
    gh.factory<_i233.OperationProvider>(
      () => _i233.OperationProvider(gh<_i911.SaveOperation>()),
    );
    gh.factory<_i209.CalendarProvider>(
      () => _i209.CalendarProvider(gh<_i160.GetOperationByMonth>()),
    );
    gh.factory<_i256.HomeProvider>(
      () => _i256.HomeProvider(
        gh<_i6.StreamRecent>(),
        gh<_i365.StreamMonthlyTotalCost>(),
        gh<_i748.StreamTotalRecent>(),
        gh<_i869.StreamMonthlyPercentage>(),
      ),
    );
    return this;
  }
}

class _$DatabaseModule extends _i567.DatabaseModule {}
