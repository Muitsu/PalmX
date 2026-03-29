// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $OperationLogsTableTable extends OperationLogsTable
    with TableInfo<$OperationLogsTableTable, OperationLogsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OperationLogsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _operationDateMeta = const VerificationMeta(
    'operationDate',
  );
  @override
  late final GeneratedColumn<DateTime> operationDate =
      GeneratedColumn<DateTime>(
        'operation_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _activityTypeMeta = const VerificationMeta(
    'activityType',
  );
  @override
  late final GeneratedColumn<String> activityType = GeneratedColumn<String>(
    'activity_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fieldMeta = const VerificationMeta('field');
  @override
  late final GeneratedColumn<String> field = GeneratedColumn<String>(
    'field',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hectarMeta = const VerificationMeta('hectar');
  @override
  late final GeneratedColumn<double> hectar = GeneratedColumn<double>(
    'hectar',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hectarToDateMeta = const VerificationMeta(
    'hectarToDate',
  );
  @override
  late final GeneratedColumn<double> hectarToDate = GeneratedColumn<double>(
    'hectar_to_date',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mandaysMeta = const VerificationMeta(
    'mandays',
  );
  @override
  late final GeneratedColumn<double> mandays = GeneratedColumn<double>(
    'mandays',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _remarksMeta = const VerificationMeta(
    'remarks',
  );
  @override
  late final GeneratedColumn<String> remarks = GeneratedColumn<String>(
    'remarks',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _labourRateMeta = const VerificationMeta(
    'labourRate',
  );
  @override
  late final GeneratedColumn<double> labourRate = GeneratedColumn<double>(
    'labour_rate',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.00),
  );
  static const VerificationMeta _labourQtyMeta = const VerificationMeta(
    'labourQty',
  );
  @override
  late final GeneratedColumn<double> labourQty = GeneratedColumn<double>(
    'labour_qty',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.00),
  );
  static const VerificationMeta _labourOtHourMeta = const VerificationMeta(
    'labourOtHour',
  );
  @override
  late final GeneratedColumn<double> labourOtHour = GeneratedColumn<double>(
    'labour_ot_hour',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.00),
  );
  static const VerificationMeta _labourOtRateMeta = const VerificationMeta(
    'labourOtRate',
  );
  @override
  late final GeneratedColumn<double> labourOtRate = GeneratedColumn<double>(
    'labour_ot_rate',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.00),
  );
  static const VerificationMeta _supervisionRateMeta = const VerificationMeta(
    'supervisionRate',
  );
  @override
  late final GeneratedColumn<double> supervisionRate = GeneratedColumn<double>(
    'supervision_rate',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(70.38),
  );
  static const VerificationMeta _supervisionMandaysMeta =
      const VerificationMeta('supervisionMandays');
  @override
  late final GeneratedColumn<double> supervisionMandays =
      GeneratedColumn<double>(
        'supervision_mandays',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
        defaultValue: const Constant(0.00),
      );
  static const VerificationMeta _driverRateMeta = const VerificationMeta(
    'driverRate',
  );
  @override
  late final GeneratedColumn<double> driverRate = GeneratedColumn<double>(
    'driver_rate',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(70.38),
  );
  static const VerificationMeta _driverTotalMeta = const VerificationMeta(
    'driverTotal',
  );
  @override
  late final GeneratedColumn<double> driverTotal = GeneratedColumn<double>(
    'driver_total',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.00),
  );
  static const VerificationMeta _materialTypeMeta = const VerificationMeta(
    'materialType',
  );
  @override
  late final GeneratedColumn<String> materialType = GeneratedColumn<String>(
    'material_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _materialQtyMeta = const VerificationMeta(
    'materialQty',
  );
  @override
  late final GeneratedColumn<int> materialQty = GeneratedColumn<int>(
    'material_qty',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _materialLitreRateMeta = const VerificationMeta(
    'materialLitreRate',
  );
  @override
  late final GeneratedColumn<double> materialLitreRate =
      GeneratedColumn<double>(
        'material_litre_rate',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _evitTimeMeta = const VerificationMeta(
    'evitTime',
  );
  @override
  late final GeneratedColumn<double> evitTime = GeneratedColumn<double>(
    'evit_time',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.00),
  );
  static const VerificationMeta _evitRateMeta = const VerificationMeta(
    'evitRate',
  );
  @override
  late final GeneratedColumn<double> evitRate = GeneratedColumn<double>(
    'evit_rate',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.00),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    operationDate,
    activityType,
    field,
    hectar,
    hectarToDate,
    mandays,
    remarks,
    labourRate,
    labourQty,
    labourOtHour,
    labourOtRate,
    supervisionRate,
    supervisionMandays,
    driverRate,
    driverTotal,
    materialType,
    materialQty,
    materialLitreRate,
    evitTime,
    evitRate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'operation_logs_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<OperationLogsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('operation_date')) {
      context.handle(
        _operationDateMeta,
        operationDate.isAcceptableOrUnknown(
          data['operation_date']!,
          _operationDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_operationDateMeta);
    }
    if (data.containsKey('activity_type')) {
      context.handle(
        _activityTypeMeta,
        activityType.isAcceptableOrUnknown(
          data['activity_type']!,
          _activityTypeMeta,
        ),
      );
    }
    if (data.containsKey('field')) {
      context.handle(
        _fieldMeta,
        field.isAcceptableOrUnknown(data['field']!, _fieldMeta),
      );
    }
    if (data.containsKey('hectar')) {
      context.handle(
        _hectarMeta,
        hectar.isAcceptableOrUnknown(data['hectar']!, _hectarMeta),
      );
    }
    if (data.containsKey('hectar_to_date')) {
      context.handle(
        _hectarToDateMeta,
        hectarToDate.isAcceptableOrUnknown(
          data['hectar_to_date']!,
          _hectarToDateMeta,
        ),
      );
    }
    if (data.containsKey('mandays')) {
      context.handle(
        _mandaysMeta,
        mandays.isAcceptableOrUnknown(data['mandays']!, _mandaysMeta),
      );
    }
    if (data.containsKey('remarks')) {
      context.handle(
        _remarksMeta,
        remarks.isAcceptableOrUnknown(data['remarks']!, _remarksMeta),
      );
    }
    if (data.containsKey('labour_rate')) {
      context.handle(
        _labourRateMeta,
        labourRate.isAcceptableOrUnknown(data['labour_rate']!, _labourRateMeta),
      );
    }
    if (data.containsKey('labour_qty')) {
      context.handle(
        _labourQtyMeta,
        labourQty.isAcceptableOrUnknown(data['labour_qty']!, _labourQtyMeta),
      );
    }
    if (data.containsKey('labour_ot_hour')) {
      context.handle(
        _labourOtHourMeta,
        labourOtHour.isAcceptableOrUnknown(
          data['labour_ot_hour']!,
          _labourOtHourMeta,
        ),
      );
    }
    if (data.containsKey('labour_ot_rate')) {
      context.handle(
        _labourOtRateMeta,
        labourOtRate.isAcceptableOrUnknown(
          data['labour_ot_rate']!,
          _labourOtRateMeta,
        ),
      );
    }
    if (data.containsKey('supervision_rate')) {
      context.handle(
        _supervisionRateMeta,
        supervisionRate.isAcceptableOrUnknown(
          data['supervision_rate']!,
          _supervisionRateMeta,
        ),
      );
    }
    if (data.containsKey('supervision_mandays')) {
      context.handle(
        _supervisionMandaysMeta,
        supervisionMandays.isAcceptableOrUnknown(
          data['supervision_mandays']!,
          _supervisionMandaysMeta,
        ),
      );
    }
    if (data.containsKey('driver_rate')) {
      context.handle(
        _driverRateMeta,
        driverRate.isAcceptableOrUnknown(data['driver_rate']!, _driverRateMeta),
      );
    }
    if (data.containsKey('driver_total')) {
      context.handle(
        _driverTotalMeta,
        driverTotal.isAcceptableOrUnknown(
          data['driver_total']!,
          _driverTotalMeta,
        ),
      );
    }
    if (data.containsKey('material_type')) {
      context.handle(
        _materialTypeMeta,
        materialType.isAcceptableOrUnknown(
          data['material_type']!,
          _materialTypeMeta,
        ),
      );
    }
    if (data.containsKey('material_qty')) {
      context.handle(
        _materialQtyMeta,
        materialQty.isAcceptableOrUnknown(
          data['material_qty']!,
          _materialQtyMeta,
        ),
      );
    }
    if (data.containsKey('material_litre_rate')) {
      context.handle(
        _materialLitreRateMeta,
        materialLitreRate.isAcceptableOrUnknown(
          data['material_litre_rate']!,
          _materialLitreRateMeta,
        ),
      );
    }
    if (data.containsKey('evit_time')) {
      context.handle(
        _evitTimeMeta,
        evitTime.isAcceptableOrUnknown(data['evit_time']!, _evitTimeMeta),
      );
    }
    if (data.containsKey('evit_rate')) {
      context.handle(
        _evitRateMeta,
        evitRate.isAcceptableOrUnknown(data['evit_rate']!, _evitRateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OperationLogsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OperationLogsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      operationDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}operation_date'],
      )!,
      activityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}activity_type'],
      ),
      field: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}field'],
      ),
      hectar: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}hectar'],
      ),
      hectarToDate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}hectar_to_date'],
      ),
      mandays: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}mandays'],
      ),
      remarks: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remarks'],
      ),
      labourRate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}labour_rate'],
      )!,
      labourQty: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}labour_qty'],
      )!,
      labourOtHour: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}labour_ot_hour'],
      )!,
      labourOtRate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}labour_ot_rate'],
      )!,
      supervisionRate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}supervision_rate'],
      )!,
      supervisionMandays: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}supervision_mandays'],
      )!,
      driverRate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}driver_rate'],
      )!,
      driverTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}driver_total'],
      )!,
      materialType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}material_type'],
      ),
      materialQty: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}material_qty'],
      ),
      materialLitreRate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}material_litre_rate'],
      ),
      evitTime: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}evit_time'],
      ),
      evitRate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}evit_rate'],
      ),
    );
  }

  @override
  $OperationLogsTableTable createAlias(String alias) {
    return $OperationLogsTableTable(attachedDatabase, alias);
  }
}

class OperationLogsTableData extends DataClass
    implements Insertable<OperationLogsTableData> {
  final int id;
  final DateTime operationDate;
  final String? activityType;
  final String? field;
  final double? hectar;
  final double? hectarToDate;
  final double? mandays;
  final String? remarks;
  final double labourRate;
  final double labourQty;
  final double labourOtHour;
  final double labourOtRate;
  final double supervisionRate;
  final double supervisionMandays;
  final double driverRate;
  final double driverTotal;
  final String? materialType;
  final int? materialQty;
  final double? materialLitreRate;
  final double? evitTime;
  final double? evitRate;
  const OperationLogsTableData({
    required this.id,
    required this.operationDate,
    this.activityType,
    this.field,
    this.hectar,
    this.hectarToDate,
    this.mandays,
    this.remarks,
    required this.labourRate,
    required this.labourQty,
    required this.labourOtHour,
    required this.labourOtRate,
    required this.supervisionRate,
    required this.supervisionMandays,
    required this.driverRate,
    required this.driverTotal,
    this.materialType,
    this.materialQty,
    this.materialLitreRate,
    this.evitTime,
    this.evitRate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['operation_date'] = Variable<DateTime>(operationDate);
    if (!nullToAbsent || activityType != null) {
      map['activity_type'] = Variable<String>(activityType);
    }
    if (!nullToAbsent || field != null) {
      map['field'] = Variable<String>(field);
    }
    if (!nullToAbsent || hectar != null) {
      map['hectar'] = Variable<double>(hectar);
    }
    if (!nullToAbsent || hectarToDate != null) {
      map['hectar_to_date'] = Variable<double>(hectarToDate);
    }
    if (!nullToAbsent || mandays != null) {
      map['mandays'] = Variable<double>(mandays);
    }
    if (!nullToAbsent || remarks != null) {
      map['remarks'] = Variable<String>(remarks);
    }
    map['labour_rate'] = Variable<double>(labourRate);
    map['labour_qty'] = Variable<double>(labourQty);
    map['labour_ot_hour'] = Variable<double>(labourOtHour);
    map['labour_ot_rate'] = Variable<double>(labourOtRate);
    map['supervision_rate'] = Variable<double>(supervisionRate);
    map['supervision_mandays'] = Variable<double>(supervisionMandays);
    map['driver_rate'] = Variable<double>(driverRate);
    map['driver_total'] = Variable<double>(driverTotal);
    if (!nullToAbsent || materialType != null) {
      map['material_type'] = Variable<String>(materialType);
    }
    if (!nullToAbsent || materialQty != null) {
      map['material_qty'] = Variable<int>(materialQty);
    }
    if (!nullToAbsent || materialLitreRate != null) {
      map['material_litre_rate'] = Variable<double>(materialLitreRate);
    }
    if (!nullToAbsent || evitTime != null) {
      map['evit_time'] = Variable<double>(evitTime);
    }
    if (!nullToAbsent || evitRate != null) {
      map['evit_rate'] = Variable<double>(evitRate);
    }
    return map;
  }

  OperationLogsTableCompanion toCompanion(bool nullToAbsent) {
    return OperationLogsTableCompanion(
      id: Value(id),
      operationDate: Value(operationDate),
      activityType: activityType == null && nullToAbsent
          ? const Value.absent()
          : Value(activityType),
      field: field == null && nullToAbsent
          ? const Value.absent()
          : Value(field),
      hectar: hectar == null && nullToAbsent
          ? const Value.absent()
          : Value(hectar),
      hectarToDate: hectarToDate == null && nullToAbsent
          ? const Value.absent()
          : Value(hectarToDate),
      mandays: mandays == null && nullToAbsent
          ? const Value.absent()
          : Value(mandays),
      remarks: remarks == null && nullToAbsent
          ? const Value.absent()
          : Value(remarks),
      labourRate: Value(labourRate),
      labourQty: Value(labourQty),
      labourOtHour: Value(labourOtHour),
      labourOtRate: Value(labourOtRate),
      supervisionRate: Value(supervisionRate),
      supervisionMandays: Value(supervisionMandays),
      driverRate: Value(driverRate),
      driverTotal: Value(driverTotal),
      materialType: materialType == null && nullToAbsent
          ? const Value.absent()
          : Value(materialType),
      materialQty: materialQty == null && nullToAbsent
          ? const Value.absent()
          : Value(materialQty),
      materialLitreRate: materialLitreRate == null && nullToAbsent
          ? const Value.absent()
          : Value(materialLitreRate),
      evitTime: evitTime == null && nullToAbsent
          ? const Value.absent()
          : Value(evitTime),
      evitRate: evitRate == null && nullToAbsent
          ? const Value.absent()
          : Value(evitRate),
    );
  }

  factory OperationLogsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OperationLogsTableData(
      id: serializer.fromJson<int>(json['id']),
      operationDate: serializer.fromJson<DateTime>(json['operationDate']),
      activityType: serializer.fromJson<String?>(json['activityType']),
      field: serializer.fromJson<String?>(json['field']),
      hectar: serializer.fromJson<double?>(json['hectar']),
      hectarToDate: serializer.fromJson<double?>(json['hectarToDate']),
      mandays: serializer.fromJson<double?>(json['mandays']),
      remarks: serializer.fromJson<String?>(json['remarks']),
      labourRate: serializer.fromJson<double>(json['labourRate']),
      labourQty: serializer.fromJson<double>(json['labourQty']),
      labourOtHour: serializer.fromJson<double>(json['labourOtHour']),
      labourOtRate: serializer.fromJson<double>(json['labourOtRate']),
      supervisionRate: serializer.fromJson<double>(json['supervisionRate']),
      supervisionMandays: serializer.fromJson<double>(
        json['supervisionMandays'],
      ),
      driverRate: serializer.fromJson<double>(json['driverRate']),
      driverTotal: serializer.fromJson<double>(json['driverTotal']),
      materialType: serializer.fromJson<String?>(json['materialType']),
      materialQty: serializer.fromJson<int?>(json['materialQty']),
      materialLitreRate: serializer.fromJson<double?>(
        json['materialLitreRate'],
      ),
      evitTime: serializer.fromJson<double?>(json['evitTime']),
      evitRate: serializer.fromJson<double?>(json['evitRate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'operationDate': serializer.toJson<DateTime>(operationDate),
      'activityType': serializer.toJson<String?>(activityType),
      'field': serializer.toJson<String?>(field),
      'hectar': serializer.toJson<double?>(hectar),
      'hectarToDate': serializer.toJson<double?>(hectarToDate),
      'mandays': serializer.toJson<double?>(mandays),
      'remarks': serializer.toJson<String?>(remarks),
      'labourRate': serializer.toJson<double>(labourRate),
      'labourQty': serializer.toJson<double>(labourQty),
      'labourOtHour': serializer.toJson<double>(labourOtHour),
      'labourOtRate': serializer.toJson<double>(labourOtRate),
      'supervisionRate': serializer.toJson<double>(supervisionRate),
      'supervisionMandays': serializer.toJson<double>(supervisionMandays),
      'driverRate': serializer.toJson<double>(driverRate),
      'driverTotal': serializer.toJson<double>(driverTotal),
      'materialType': serializer.toJson<String?>(materialType),
      'materialQty': serializer.toJson<int?>(materialQty),
      'materialLitreRate': serializer.toJson<double?>(materialLitreRate),
      'evitTime': serializer.toJson<double?>(evitTime),
      'evitRate': serializer.toJson<double?>(evitRate),
    };
  }

  OperationLogsTableData copyWith({
    int? id,
    DateTime? operationDate,
    Value<String?> activityType = const Value.absent(),
    Value<String?> field = const Value.absent(),
    Value<double?> hectar = const Value.absent(),
    Value<double?> hectarToDate = const Value.absent(),
    Value<double?> mandays = const Value.absent(),
    Value<String?> remarks = const Value.absent(),
    double? labourRate,
    double? labourQty,
    double? labourOtHour,
    double? labourOtRate,
    double? supervisionRate,
    double? supervisionMandays,
    double? driverRate,
    double? driverTotal,
    Value<String?> materialType = const Value.absent(),
    Value<int?> materialQty = const Value.absent(),
    Value<double?> materialLitreRate = const Value.absent(),
    Value<double?> evitTime = const Value.absent(),
    Value<double?> evitRate = const Value.absent(),
  }) => OperationLogsTableData(
    id: id ?? this.id,
    operationDate: operationDate ?? this.operationDate,
    activityType: activityType.present ? activityType.value : this.activityType,
    field: field.present ? field.value : this.field,
    hectar: hectar.present ? hectar.value : this.hectar,
    hectarToDate: hectarToDate.present ? hectarToDate.value : this.hectarToDate,
    mandays: mandays.present ? mandays.value : this.mandays,
    remarks: remarks.present ? remarks.value : this.remarks,
    labourRate: labourRate ?? this.labourRate,
    labourQty: labourQty ?? this.labourQty,
    labourOtHour: labourOtHour ?? this.labourOtHour,
    labourOtRate: labourOtRate ?? this.labourOtRate,
    supervisionRate: supervisionRate ?? this.supervisionRate,
    supervisionMandays: supervisionMandays ?? this.supervisionMandays,
    driverRate: driverRate ?? this.driverRate,
    driverTotal: driverTotal ?? this.driverTotal,
    materialType: materialType.present ? materialType.value : this.materialType,
    materialQty: materialQty.present ? materialQty.value : this.materialQty,
    materialLitreRate: materialLitreRate.present
        ? materialLitreRate.value
        : this.materialLitreRate,
    evitTime: evitTime.present ? evitTime.value : this.evitTime,
    evitRate: evitRate.present ? evitRate.value : this.evitRate,
  );
  OperationLogsTableData copyWithCompanion(OperationLogsTableCompanion data) {
    return OperationLogsTableData(
      id: data.id.present ? data.id.value : this.id,
      operationDate: data.operationDate.present
          ? data.operationDate.value
          : this.operationDate,
      activityType: data.activityType.present
          ? data.activityType.value
          : this.activityType,
      field: data.field.present ? data.field.value : this.field,
      hectar: data.hectar.present ? data.hectar.value : this.hectar,
      hectarToDate: data.hectarToDate.present
          ? data.hectarToDate.value
          : this.hectarToDate,
      mandays: data.mandays.present ? data.mandays.value : this.mandays,
      remarks: data.remarks.present ? data.remarks.value : this.remarks,
      labourRate: data.labourRate.present
          ? data.labourRate.value
          : this.labourRate,
      labourQty: data.labourQty.present ? data.labourQty.value : this.labourQty,
      labourOtHour: data.labourOtHour.present
          ? data.labourOtHour.value
          : this.labourOtHour,
      labourOtRate: data.labourOtRate.present
          ? data.labourOtRate.value
          : this.labourOtRate,
      supervisionRate: data.supervisionRate.present
          ? data.supervisionRate.value
          : this.supervisionRate,
      supervisionMandays: data.supervisionMandays.present
          ? data.supervisionMandays.value
          : this.supervisionMandays,
      driverRate: data.driverRate.present
          ? data.driverRate.value
          : this.driverRate,
      driverTotal: data.driverTotal.present
          ? data.driverTotal.value
          : this.driverTotal,
      materialType: data.materialType.present
          ? data.materialType.value
          : this.materialType,
      materialQty: data.materialQty.present
          ? data.materialQty.value
          : this.materialQty,
      materialLitreRate: data.materialLitreRate.present
          ? data.materialLitreRate.value
          : this.materialLitreRate,
      evitTime: data.evitTime.present ? data.evitTime.value : this.evitTime,
      evitRate: data.evitRate.present ? data.evitRate.value : this.evitRate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OperationLogsTableData(')
          ..write('id: $id, ')
          ..write('operationDate: $operationDate, ')
          ..write('activityType: $activityType, ')
          ..write('field: $field, ')
          ..write('hectar: $hectar, ')
          ..write('hectarToDate: $hectarToDate, ')
          ..write('mandays: $mandays, ')
          ..write('remarks: $remarks, ')
          ..write('labourRate: $labourRate, ')
          ..write('labourQty: $labourQty, ')
          ..write('labourOtHour: $labourOtHour, ')
          ..write('labourOtRate: $labourOtRate, ')
          ..write('supervisionRate: $supervisionRate, ')
          ..write('supervisionMandays: $supervisionMandays, ')
          ..write('driverRate: $driverRate, ')
          ..write('driverTotal: $driverTotal, ')
          ..write('materialType: $materialType, ')
          ..write('materialQty: $materialQty, ')
          ..write('materialLitreRate: $materialLitreRate, ')
          ..write('evitTime: $evitTime, ')
          ..write('evitRate: $evitRate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    operationDate,
    activityType,
    field,
    hectar,
    hectarToDate,
    mandays,
    remarks,
    labourRate,
    labourQty,
    labourOtHour,
    labourOtRate,
    supervisionRate,
    supervisionMandays,
    driverRate,
    driverTotal,
    materialType,
    materialQty,
    materialLitreRate,
    evitTime,
    evitRate,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OperationLogsTableData &&
          other.id == this.id &&
          other.operationDate == this.operationDate &&
          other.activityType == this.activityType &&
          other.field == this.field &&
          other.hectar == this.hectar &&
          other.hectarToDate == this.hectarToDate &&
          other.mandays == this.mandays &&
          other.remarks == this.remarks &&
          other.labourRate == this.labourRate &&
          other.labourQty == this.labourQty &&
          other.labourOtHour == this.labourOtHour &&
          other.labourOtRate == this.labourOtRate &&
          other.supervisionRate == this.supervisionRate &&
          other.supervisionMandays == this.supervisionMandays &&
          other.driverRate == this.driverRate &&
          other.driverTotal == this.driverTotal &&
          other.materialType == this.materialType &&
          other.materialQty == this.materialQty &&
          other.materialLitreRate == this.materialLitreRate &&
          other.evitTime == this.evitTime &&
          other.evitRate == this.evitRate);
}

class OperationLogsTableCompanion
    extends UpdateCompanion<OperationLogsTableData> {
  final Value<int> id;
  final Value<DateTime> operationDate;
  final Value<String?> activityType;
  final Value<String?> field;
  final Value<double?> hectar;
  final Value<double?> hectarToDate;
  final Value<double?> mandays;
  final Value<String?> remarks;
  final Value<double> labourRate;
  final Value<double> labourQty;
  final Value<double> labourOtHour;
  final Value<double> labourOtRate;
  final Value<double> supervisionRate;
  final Value<double> supervisionMandays;
  final Value<double> driverRate;
  final Value<double> driverTotal;
  final Value<String?> materialType;
  final Value<int?> materialQty;
  final Value<double?> materialLitreRate;
  final Value<double?> evitTime;
  final Value<double?> evitRate;
  const OperationLogsTableCompanion({
    this.id = const Value.absent(),
    this.operationDate = const Value.absent(),
    this.activityType = const Value.absent(),
    this.field = const Value.absent(),
    this.hectar = const Value.absent(),
    this.hectarToDate = const Value.absent(),
    this.mandays = const Value.absent(),
    this.remarks = const Value.absent(),
    this.labourRate = const Value.absent(),
    this.labourQty = const Value.absent(),
    this.labourOtHour = const Value.absent(),
    this.labourOtRate = const Value.absent(),
    this.supervisionRate = const Value.absent(),
    this.supervisionMandays = const Value.absent(),
    this.driverRate = const Value.absent(),
    this.driverTotal = const Value.absent(),
    this.materialType = const Value.absent(),
    this.materialQty = const Value.absent(),
    this.materialLitreRate = const Value.absent(),
    this.evitTime = const Value.absent(),
    this.evitRate = const Value.absent(),
  });
  OperationLogsTableCompanion.insert({
    this.id = const Value.absent(),
    required DateTime operationDate,
    this.activityType = const Value.absent(),
    this.field = const Value.absent(),
    this.hectar = const Value.absent(),
    this.hectarToDate = const Value.absent(),
    this.mandays = const Value.absent(),
    this.remarks = const Value.absent(),
    this.labourRate = const Value.absent(),
    this.labourQty = const Value.absent(),
    this.labourOtHour = const Value.absent(),
    this.labourOtRate = const Value.absent(),
    this.supervisionRate = const Value.absent(),
    this.supervisionMandays = const Value.absent(),
    this.driverRate = const Value.absent(),
    this.driverTotal = const Value.absent(),
    this.materialType = const Value.absent(),
    this.materialQty = const Value.absent(),
    this.materialLitreRate = const Value.absent(),
    this.evitTime = const Value.absent(),
    this.evitRate = const Value.absent(),
  }) : operationDate = Value(operationDate);
  static Insertable<OperationLogsTableData> custom({
    Expression<int>? id,
    Expression<DateTime>? operationDate,
    Expression<String>? activityType,
    Expression<String>? field,
    Expression<double>? hectar,
    Expression<double>? hectarToDate,
    Expression<double>? mandays,
    Expression<String>? remarks,
    Expression<double>? labourRate,
    Expression<double>? labourQty,
    Expression<double>? labourOtHour,
    Expression<double>? labourOtRate,
    Expression<double>? supervisionRate,
    Expression<double>? supervisionMandays,
    Expression<double>? driverRate,
    Expression<double>? driverTotal,
    Expression<String>? materialType,
    Expression<int>? materialQty,
    Expression<double>? materialLitreRate,
    Expression<double>? evitTime,
    Expression<double>? evitRate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (operationDate != null) 'operation_date': operationDate,
      if (activityType != null) 'activity_type': activityType,
      if (field != null) 'field': field,
      if (hectar != null) 'hectar': hectar,
      if (hectarToDate != null) 'hectar_to_date': hectarToDate,
      if (mandays != null) 'mandays': mandays,
      if (remarks != null) 'remarks': remarks,
      if (labourRate != null) 'labour_rate': labourRate,
      if (labourQty != null) 'labour_qty': labourQty,
      if (labourOtHour != null) 'labour_ot_hour': labourOtHour,
      if (labourOtRate != null) 'labour_ot_rate': labourOtRate,
      if (supervisionRate != null) 'supervision_rate': supervisionRate,
      if (supervisionMandays != null) 'supervision_mandays': supervisionMandays,
      if (driverRate != null) 'driver_rate': driverRate,
      if (driverTotal != null) 'driver_total': driverTotal,
      if (materialType != null) 'material_type': materialType,
      if (materialQty != null) 'material_qty': materialQty,
      if (materialLitreRate != null) 'material_litre_rate': materialLitreRate,
      if (evitTime != null) 'evit_time': evitTime,
      if (evitRate != null) 'evit_rate': evitRate,
    });
  }

  OperationLogsTableCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? operationDate,
    Value<String?>? activityType,
    Value<String?>? field,
    Value<double?>? hectar,
    Value<double?>? hectarToDate,
    Value<double?>? mandays,
    Value<String?>? remarks,
    Value<double>? labourRate,
    Value<double>? labourQty,
    Value<double>? labourOtHour,
    Value<double>? labourOtRate,
    Value<double>? supervisionRate,
    Value<double>? supervisionMandays,
    Value<double>? driverRate,
    Value<double>? driverTotal,
    Value<String?>? materialType,
    Value<int?>? materialQty,
    Value<double?>? materialLitreRate,
    Value<double?>? evitTime,
    Value<double?>? evitRate,
  }) {
    return OperationLogsTableCompanion(
      id: id ?? this.id,
      operationDate: operationDate ?? this.operationDate,
      activityType: activityType ?? this.activityType,
      field: field ?? this.field,
      hectar: hectar ?? this.hectar,
      hectarToDate: hectarToDate ?? this.hectarToDate,
      mandays: mandays ?? this.mandays,
      remarks: remarks ?? this.remarks,
      labourRate: labourRate ?? this.labourRate,
      labourQty: labourQty ?? this.labourQty,
      labourOtHour: labourOtHour ?? this.labourOtHour,
      labourOtRate: labourOtRate ?? this.labourOtRate,
      supervisionRate: supervisionRate ?? this.supervisionRate,
      supervisionMandays: supervisionMandays ?? this.supervisionMandays,
      driverRate: driverRate ?? this.driverRate,
      driverTotal: driverTotal ?? this.driverTotal,
      materialType: materialType ?? this.materialType,
      materialQty: materialQty ?? this.materialQty,
      materialLitreRate: materialLitreRate ?? this.materialLitreRate,
      evitTime: evitTime ?? this.evitTime,
      evitRate: evitRate ?? this.evitRate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (operationDate.present) {
      map['operation_date'] = Variable<DateTime>(operationDate.value);
    }
    if (activityType.present) {
      map['activity_type'] = Variable<String>(activityType.value);
    }
    if (field.present) {
      map['field'] = Variable<String>(field.value);
    }
    if (hectar.present) {
      map['hectar'] = Variable<double>(hectar.value);
    }
    if (hectarToDate.present) {
      map['hectar_to_date'] = Variable<double>(hectarToDate.value);
    }
    if (mandays.present) {
      map['mandays'] = Variable<double>(mandays.value);
    }
    if (remarks.present) {
      map['remarks'] = Variable<String>(remarks.value);
    }
    if (labourRate.present) {
      map['labour_rate'] = Variable<double>(labourRate.value);
    }
    if (labourQty.present) {
      map['labour_qty'] = Variable<double>(labourQty.value);
    }
    if (labourOtHour.present) {
      map['labour_ot_hour'] = Variable<double>(labourOtHour.value);
    }
    if (labourOtRate.present) {
      map['labour_ot_rate'] = Variable<double>(labourOtRate.value);
    }
    if (supervisionRate.present) {
      map['supervision_rate'] = Variable<double>(supervisionRate.value);
    }
    if (supervisionMandays.present) {
      map['supervision_mandays'] = Variable<double>(supervisionMandays.value);
    }
    if (driverRate.present) {
      map['driver_rate'] = Variable<double>(driverRate.value);
    }
    if (driverTotal.present) {
      map['driver_total'] = Variable<double>(driverTotal.value);
    }
    if (materialType.present) {
      map['material_type'] = Variable<String>(materialType.value);
    }
    if (materialQty.present) {
      map['material_qty'] = Variable<int>(materialQty.value);
    }
    if (materialLitreRate.present) {
      map['material_litre_rate'] = Variable<double>(materialLitreRate.value);
    }
    if (evitTime.present) {
      map['evit_time'] = Variable<double>(evitTime.value);
    }
    if (evitRate.present) {
      map['evit_rate'] = Variable<double>(evitRate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OperationLogsTableCompanion(')
          ..write('id: $id, ')
          ..write('operationDate: $operationDate, ')
          ..write('activityType: $activityType, ')
          ..write('field: $field, ')
          ..write('hectar: $hectar, ')
          ..write('hectarToDate: $hectarToDate, ')
          ..write('mandays: $mandays, ')
          ..write('remarks: $remarks, ')
          ..write('labourRate: $labourRate, ')
          ..write('labourQty: $labourQty, ')
          ..write('labourOtHour: $labourOtHour, ')
          ..write('labourOtRate: $labourOtRate, ')
          ..write('supervisionRate: $supervisionRate, ')
          ..write('supervisionMandays: $supervisionMandays, ')
          ..write('driverRate: $driverRate, ')
          ..write('driverTotal: $driverTotal, ')
          ..write('materialType: $materialType, ')
          ..write('materialQty: $materialQty, ')
          ..write('materialLitreRate: $materialLitreRate, ')
          ..write('evitTime: $evitTime, ')
          ..write('evitRate: $evitRate')
          ..write(')'))
        .toString();
  }
}

class $ActivityTableTable extends ActivityTable
    with TableInfo<$ActivityTableTable, ActivityTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActivityTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<ActivityCost, String>
  activityCost = GeneratedColumn<String>(
    'activity_cost',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<ActivityCost>($ActivityTableTable.$converteractivityCost);
  @override
  List<GeneratedColumn> get $columns => [id, name, activityCost];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'activity_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ActivityTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActivityTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActivityTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      activityCost: $ActivityTableTable.$converteractivityCost.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}activity_cost'],
        )!,
      ),
    );
  }

  @override
  $ActivityTableTable createAlias(String alias) {
    return $ActivityTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ActivityCost, String, String>
  $converteractivityCost = const EnumNameConverter<ActivityCost>(
    ActivityCost.values,
  );
}

class ActivityTableData extends DataClass
    implements Insertable<ActivityTableData> {
  final int id;
  final String name;
  final ActivityCost activityCost;
  const ActivityTableData({
    required this.id,
    required this.name,
    required this.activityCost,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    {
      map['activity_cost'] = Variable<String>(
        $ActivityTableTable.$converteractivityCost.toSql(activityCost),
      );
    }
    return map;
  }

  ActivityTableCompanion toCompanion(bool nullToAbsent) {
    return ActivityTableCompanion(
      id: Value(id),
      name: Value(name),
      activityCost: Value(activityCost),
    );
  }

  factory ActivityTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActivityTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      activityCost: $ActivityTableTable.$converteractivityCost.fromJson(
        serializer.fromJson<String>(json['activityCost']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'activityCost': serializer.toJson<String>(
        $ActivityTableTable.$converteractivityCost.toJson(activityCost),
      ),
    };
  }

  ActivityTableData copyWith({
    int? id,
    String? name,
    ActivityCost? activityCost,
  }) => ActivityTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    activityCost: activityCost ?? this.activityCost,
  );
  ActivityTableData copyWithCompanion(ActivityTableCompanion data) {
    return ActivityTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      activityCost: data.activityCost.present
          ? data.activityCost.value
          : this.activityCost,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActivityTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('activityCost: $activityCost')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, activityCost);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActivityTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.activityCost == this.activityCost);
}

class ActivityTableCompanion extends UpdateCompanion<ActivityTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<ActivityCost> activityCost;
  const ActivityTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.activityCost = const Value.absent(),
  });
  ActivityTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required ActivityCost activityCost,
  }) : name = Value(name),
       activityCost = Value(activityCost);
  static Insertable<ActivityTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? activityCost,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (activityCost != null) 'activity_cost': activityCost,
    });
  }

  ActivityTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<ActivityCost>? activityCost,
  }) {
    return ActivityTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      activityCost: activityCost ?? this.activityCost,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (activityCost.present) {
      map['activity_cost'] = Variable<String>(
        $ActivityTableTable.$converteractivityCost.toSql(activityCost.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivityTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('activityCost: $activityCost')
          ..write(')'))
        .toString();
  }
}

class $FieldTableTable extends FieldTable
    with TableInfo<$FieldTableTable, FieldTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FieldTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'field_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<FieldTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FieldTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FieldTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $FieldTableTable createAlias(String alias) {
    return $FieldTableTable(attachedDatabase, alias);
  }
}

class FieldTableData extends DataClass implements Insertable<FieldTableData> {
  final int id;
  final String name;
  const FieldTableData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  FieldTableCompanion toCompanion(bool nullToAbsent) {
    return FieldTableCompanion(id: Value(id), name: Value(name));
  }

  factory FieldTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FieldTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  FieldTableData copyWith({int? id, String? name}) =>
      FieldTableData(id: id ?? this.id, name: name ?? this.name);
  FieldTableData copyWithCompanion(FieldTableCompanion data) {
    return FieldTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FieldTableData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FieldTableData &&
          other.id == this.id &&
          other.name == this.name);
}

class FieldTableCompanion extends UpdateCompanion<FieldTableData> {
  final Value<int> id;
  final Value<String> name;
  const FieldTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  FieldTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<FieldTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  FieldTableCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return FieldTableCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FieldTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $MaterialTableTable extends MaterialTable
    with TableInfo<$MaterialTableTable, MaterialTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MaterialTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: Constant(0.00),
  );
  @override
  late final GeneratedColumnWithTypeConverter<MaterialFormat, String>
  materialFormat = GeneratedColumn<String>(
    'material_format',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<MaterialFormat>($MaterialTableTable.$convertermaterialFormat);
  @override
  List<GeneratedColumn> get $columns => [id, name, price, materialFormat];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'material_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<MaterialTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MaterialTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MaterialTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      materialFormat: $MaterialTableTable.$convertermaterialFormat.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}material_format'],
        )!,
      ),
    );
  }

  @override
  $MaterialTableTable createAlias(String alias) {
    return $MaterialTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<MaterialFormat, String, String>
  $convertermaterialFormat = const EnumNameConverter<MaterialFormat>(
    MaterialFormat.values,
  );
}

class MaterialTableData extends DataClass
    implements Insertable<MaterialTableData> {
  final int id;
  final String name;
  final double price;
  final MaterialFormat materialFormat;
  const MaterialTableData({
    required this.id,
    required this.name,
    required this.price,
    required this.materialFormat,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['price'] = Variable<double>(price);
    {
      map['material_format'] = Variable<String>(
        $MaterialTableTable.$convertermaterialFormat.toSql(materialFormat),
      );
    }
    return map;
  }

  MaterialTableCompanion toCompanion(bool nullToAbsent) {
    return MaterialTableCompanion(
      id: Value(id),
      name: Value(name),
      price: Value(price),
      materialFormat: Value(materialFormat),
    );
  }

  factory MaterialTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MaterialTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<double>(json['price']),
      materialFormat: $MaterialTableTable.$convertermaterialFormat.fromJson(
        serializer.fromJson<String>(json['materialFormat']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<double>(price),
      'materialFormat': serializer.toJson<String>(
        $MaterialTableTable.$convertermaterialFormat.toJson(materialFormat),
      ),
    };
  }

  MaterialTableData copyWith({
    int? id,
    String? name,
    double? price,
    MaterialFormat? materialFormat,
  }) => MaterialTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    price: price ?? this.price,
    materialFormat: materialFormat ?? this.materialFormat,
  );
  MaterialTableData copyWithCompanion(MaterialTableCompanion data) {
    return MaterialTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      price: data.price.present ? data.price.value : this.price,
      materialFormat: data.materialFormat.present
          ? data.materialFormat.value
          : this.materialFormat,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MaterialTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('materialFormat: $materialFormat')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, price, materialFormat);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MaterialTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.price == this.price &&
          other.materialFormat == this.materialFormat);
}

class MaterialTableCompanion extends UpdateCompanion<MaterialTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> price;
  final Value<MaterialFormat> materialFormat;
  const MaterialTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.materialFormat = const Value.absent(),
  });
  MaterialTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.price = const Value.absent(),
    required MaterialFormat materialFormat,
  }) : name = Value(name),
       materialFormat = Value(materialFormat);
  static Insertable<MaterialTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? price,
    Expression<String>? materialFormat,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (materialFormat != null) 'material_format': materialFormat,
    });
  }

  MaterialTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<double>? price,
    Value<MaterialFormat>? materialFormat,
  }) {
    return MaterialTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      materialFormat: materialFormat ?? this.materialFormat,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (materialFormat.present) {
      map['material_format'] = Variable<String>(
        $MaterialTableTable.$convertermaterialFormat.toSql(
          materialFormat.value,
        ),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MaterialTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('materialFormat: $materialFormat')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $OperationLogsTableTable operationLogsTable =
      $OperationLogsTableTable(this);
  late final $ActivityTableTable activityTable = $ActivityTableTable(this);
  late final $FieldTableTable fieldTable = $FieldTableTable(this);
  late final $MaterialTableTable materialTable = $MaterialTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    operationLogsTable,
    activityTable,
    fieldTable,
    materialTable,
  ];
}

typedef $$OperationLogsTableTableCreateCompanionBuilder =
    OperationLogsTableCompanion Function({
      Value<int> id,
      required DateTime operationDate,
      Value<String?> activityType,
      Value<String?> field,
      Value<double?> hectar,
      Value<double?> hectarToDate,
      Value<double?> mandays,
      Value<String?> remarks,
      Value<double> labourRate,
      Value<double> labourQty,
      Value<double> labourOtHour,
      Value<double> labourOtRate,
      Value<double> supervisionRate,
      Value<double> supervisionMandays,
      Value<double> driverRate,
      Value<double> driverTotal,
      Value<String?> materialType,
      Value<int?> materialQty,
      Value<double?> materialLitreRate,
      Value<double?> evitTime,
      Value<double?> evitRate,
    });
typedef $$OperationLogsTableTableUpdateCompanionBuilder =
    OperationLogsTableCompanion Function({
      Value<int> id,
      Value<DateTime> operationDate,
      Value<String?> activityType,
      Value<String?> field,
      Value<double?> hectar,
      Value<double?> hectarToDate,
      Value<double?> mandays,
      Value<String?> remarks,
      Value<double> labourRate,
      Value<double> labourQty,
      Value<double> labourOtHour,
      Value<double> labourOtRate,
      Value<double> supervisionRate,
      Value<double> supervisionMandays,
      Value<double> driverRate,
      Value<double> driverTotal,
      Value<String?> materialType,
      Value<int?> materialQty,
      Value<double?> materialLitreRate,
      Value<double?> evitTime,
      Value<double?> evitRate,
    });

class $$OperationLogsTableTableFilterComposer
    extends Composer<_$AppDatabase, $OperationLogsTableTable> {
  $$OperationLogsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get operationDate => $composableBuilder(
    column: $table.operationDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get activityType => $composableBuilder(
    column: $table.activityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get field => $composableBuilder(
    column: $table.field,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get hectar => $composableBuilder(
    column: $table.hectar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get hectarToDate => $composableBuilder(
    column: $table.hectarToDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get mandays => $composableBuilder(
    column: $table.mandays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remarks => $composableBuilder(
    column: $table.remarks,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get labourRate => $composableBuilder(
    column: $table.labourRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get labourQty => $composableBuilder(
    column: $table.labourQty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get labourOtHour => $composableBuilder(
    column: $table.labourOtHour,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get labourOtRate => $composableBuilder(
    column: $table.labourOtRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get supervisionRate => $composableBuilder(
    column: $table.supervisionRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get supervisionMandays => $composableBuilder(
    column: $table.supervisionMandays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get driverRate => $composableBuilder(
    column: $table.driverRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get driverTotal => $composableBuilder(
    column: $table.driverTotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get materialType => $composableBuilder(
    column: $table.materialType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get materialQty => $composableBuilder(
    column: $table.materialQty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get materialLitreRate => $composableBuilder(
    column: $table.materialLitreRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get evitTime => $composableBuilder(
    column: $table.evitTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get evitRate => $composableBuilder(
    column: $table.evitRate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OperationLogsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $OperationLogsTableTable> {
  $$OperationLogsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get operationDate => $composableBuilder(
    column: $table.operationDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get activityType => $composableBuilder(
    column: $table.activityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get field => $composableBuilder(
    column: $table.field,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get hectar => $composableBuilder(
    column: $table.hectar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get hectarToDate => $composableBuilder(
    column: $table.hectarToDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get mandays => $composableBuilder(
    column: $table.mandays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remarks => $composableBuilder(
    column: $table.remarks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get labourRate => $composableBuilder(
    column: $table.labourRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get labourQty => $composableBuilder(
    column: $table.labourQty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get labourOtHour => $composableBuilder(
    column: $table.labourOtHour,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get labourOtRate => $composableBuilder(
    column: $table.labourOtRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get supervisionRate => $composableBuilder(
    column: $table.supervisionRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get supervisionMandays => $composableBuilder(
    column: $table.supervisionMandays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get driverRate => $composableBuilder(
    column: $table.driverRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get driverTotal => $composableBuilder(
    column: $table.driverTotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get materialType => $composableBuilder(
    column: $table.materialType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get materialQty => $composableBuilder(
    column: $table.materialQty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get materialLitreRate => $composableBuilder(
    column: $table.materialLitreRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get evitTime => $composableBuilder(
    column: $table.evitTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get evitRate => $composableBuilder(
    column: $table.evitRate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OperationLogsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $OperationLogsTableTable> {
  $$OperationLogsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get operationDate => $composableBuilder(
    column: $table.operationDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get activityType => $composableBuilder(
    column: $table.activityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get field =>
      $composableBuilder(column: $table.field, builder: (column) => column);

  GeneratedColumn<double> get hectar =>
      $composableBuilder(column: $table.hectar, builder: (column) => column);

  GeneratedColumn<double> get hectarToDate => $composableBuilder(
    column: $table.hectarToDate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get mandays =>
      $composableBuilder(column: $table.mandays, builder: (column) => column);

  GeneratedColumn<String> get remarks =>
      $composableBuilder(column: $table.remarks, builder: (column) => column);

  GeneratedColumn<double> get labourRate => $composableBuilder(
    column: $table.labourRate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get labourQty =>
      $composableBuilder(column: $table.labourQty, builder: (column) => column);

  GeneratedColumn<double> get labourOtHour => $composableBuilder(
    column: $table.labourOtHour,
    builder: (column) => column,
  );

  GeneratedColumn<double> get labourOtRate => $composableBuilder(
    column: $table.labourOtRate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get supervisionRate => $composableBuilder(
    column: $table.supervisionRate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get supervisionMandays => $composableBuilder(
    column: $table.supervisionMandays,
    builder: (column) => column,
  );

  GeneratedColumn<double> get driverRate => $composableBuilder(
    column: $table.driverRate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get driverTotal => $composableBuilder(
    column: $table.driverTotal,
    builder: (column) => column,
  );

  GeneratedColumn<String> get materialType => $composableBuilder(
    column: $table.materialType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get materialQty => $composableBuilder(
    column: $table.materialQty,
    builder: (column) => column,
  );

  GeneratedColumn<double> get materialLitreRate => $composableBuilder(
    column: $table.materialLitreRate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get evitTime =>
      $composableBuilder(column: $table.evitTime, builder: (column) => column);

  GeneratedColumn<double> get evitRate =>
      $composableBuilder(column: $table.evitRate, builder: (column) => column);
}

class $$OperationLogsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OperationLogsTableTable,
          OperationLogsTableData,
          $$OperationLogsTableTableFilterComposer,
          $$OperationLogsTableTableOrderingComposer,
          $$OperationLogsTableTableAnnotationComposer,
          $$OperationLogsTableTableCreateCompanionBuilder,
          $$OperationLogsTableTableUpdateCompanionBuilder,
          (
            OperationLogsTableData,
            BaseReferences<
              _$AppDatabase,
              $OperationLogsTableTable,
              OperationLogsTableData
            >,
          ),
          OperationLogsTableData,
          PrefetchHooks Function()
        > {
  $$OperationLogsTableTableTableManager(
    _$AppDatabase db,
    $OperationLogsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OperationLogsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OperationLogsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OperationLogsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> operationDate = const Value.absent(),
                Value<String?> activityType = const Value.absent(),
                Value<String?> field = const Value.absent(),
                Value<double?> hectar = const Value.absent(),
                Value<double?> hectarToDate = const Value.absent(),
                Value<double?> mandays = const Value.absent(),
                Value<String?> remarks = const Value.absent(),
                Value<double> labourRate = const Value.absent(),
                Value<double> labourQty = const Value.absent(),
                Value<double> labourOtHour = const Value.absent(),
                Value<double> labourOtRate = const Value.absent(),
                Value<double> supervisionRate = const Value.absent(),
                Value<double> supervisionMandays = const Value.absent(),
                Value<double> driverRate = const Value.absent(),
                Value<double> driverTotal = const Value.absent(),
                Value<String?> materialType = const Value.absent(),
                Value<int?> materialQty = const Value.absent(),
                Value<double?> materialLitreRate = const Value.absent(),
                Value<double?> evitTime = const Value.absent(),
                Value<double?> evitRate = const Value.absent(),
              }) => OperationLogsTableCompanion(
                id: id,
                operationDate: operationDate,
                activityType: activityType,
                field: field,
                hectar: hectar,
                hectarToDate: hectarToDate,
                mandays: mandays,
                remarks: remarks,
                labourRate: labourRate,
                labourQty: labourQty,
                labourOtHour: labourOtHour,
                labourOtRate: labourOtRate,
                supervisionRate: supervisionRate,
                supervisionMandays: supervisionMandays,
                driverRate: driverRate,
                driverTotal: driverTotal,
                materialType: materialType,
                materialQty: materialQty,
                materialLitreRate: materialLitreRate,
                evitTime: evitTime,
                evitRate: evitRate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime operationDate,
                Value<String?> activityType = const Value.absent(),
                Value<String?> field = const Value.absent(),
                Value<double?> hectar = const Value.absent(),
                Value<double?> hectarToDate = const Value.absent(),
                Value<double?> mandays = const Value.absent(),
                Value<String?> remarks = const Value.absent(),
                Value<double> labourRate = const Value.absent(),
                Value<double> labourQty = const Value.absent(),
                Value<double> labourOtHour = const Value.absent(),
                Value<double> labourOtRate = const Value.absent(),
                Value<double> supervisionRate = const Value.absent(),
                Value<double> supervisionMandays = const Value.absent(),
                Value<double> driverRate = const Value.absent(),
                Value<double> driverTotal = const Value.absent(),
                Value<String?> materialType = const Value.absent(),
                Value<int?> materialQty = const Value.absent(),
                Value<double?> materialLitreRate = const Value.absent(),
                Value<double?> evitTime = const Value.absent(),
                Value<double?> evitRate = const Value.absent(),
              }) => OperationLogsTableCompanion.insert(
                id: id,
                operationDate: operationDate,
                activityType: activityType,
                field: field,
                hectar: hectar,
                hectarToDate: hectarToDate,
                mandays: mandays,
                remarks: remarks,
                labourRate: labourRate,
                labourQty: labourQty,
                labourOtHour: labourOtHour,
                labourOtRate: labourOtRate,
                supervisionRate: supervisionRate,
                supervisionMandays: supervisionMandays,
                driverRate: driverRate,
                driverTotal: driverTotal,
                materialType: materialType,
                materialQty: materialQty,
                materialLitreRate: materialLitreRate,
                evitTime: evitTime,
                evitRate: evitRate,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OperationLogsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OperationLogsTableTable,
      OperationLogsTableData,
      $$OperationLogsTableTableFilterComposer,
      $$OperationLogsTableTableOrderingComposer,
      $$OperationLogsTableTableAnnotationComposer,
      $$OperationLogsTableTableCreateCompanionBuilder,
      $$OperationLogsTableTableUpdateCompanionBuilder,
      (
        OperationLogsTableData,
        BaseReferences<
          _$AppDatabase,
          $OperationLogsTableTable,
          OperationLogsTableData
        >,
      ),
      OperationLogsTableData,
      PrefetchHooks Function()
    >;
typedef $$ActivityTableTableCreateCompanionBuilder =
    ActivityTableCompanion Function({
      Value<int> id,
      required String name,
      required ActivityCost activityCost,
    });
typedef $$ActivityTableTableUpdateCompanionBuilder =
    ActivityTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<ActivityCost> activityCost,
    });

class $$ActivityTableTableFilterComposer
    extends Composer<_$AppDatabase, $ActivityTableTable> {
  $$ActivityTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ActivityCost, ActivityCost, String>
  get activityCost => $composableBuilder(
    column: $table.activityCost,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
}

class $$ActivityTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ActivityTableTable> {
  $$ActivityTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get activityCost => $composableBuilder(
    column: $table.activityCost,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ActivityTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActivityTableTable> {
  $$ActivityTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ActivityCost, String> get activityCost =>
      $composableBuilder(
        column: $table.activityCost,
        builder: (column) => column,
      );
}

class $$ActivityTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ActivityTableTable,
          ActivityTableData,
          $$ActivityTableTableFilterComposer,
          $$ActivityTableTableOrderingComposer,
          $$ActivityTableTableAnnotationComposer,
          $$ActivityTableTableCreateCompanionBuilder,
          $$ActivityTableTableUpdateCompanionBuilder,
          (
            ActivityTableData,
            BaseReferences<
              _$AppDatabase,
              $ActivityTableTable,
              ActivityTableData
            >,
          ),
          ActivityTableData,
          PrefetchHooks Function()
        > {
  $$ActivityTableTableTableManager(_$AppDatabase db, $ActivityTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActivityTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActivityTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActivityTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<ActivityCost> activityCost = const Value.absent(),
              }) => ActivityTableCompanion(
                id: id,
                name: name,
                activityCost: activityCost,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required ActivityCost activityCost,
              }) => ActivityTableCompanion.insert(
                id: id,
                name: name,
                activityCost: activityCost,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ActivityTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ActivityTableTable,
      ActivityTableData,
      $$ActivityTableTableFilterComposer,
      $$ActivityTableTableOrderingComposer,
      $$ActivityTableTableAnnotationComposer,
      $$ActivityTableTableCreateCompanionBuilder,
      $$ActivityTableTableUpdateCompanionBuilder,
      (
        ActivityTableData,
        BaseReferences<_$AppDatabase, $ActivityTableTable, ActivityTableData>,
      ),
      ActivityTableData,
      PrefetchHooks Function()
    >;
typedef $$FieldTableTableCreateCompanionBuilder =
    FieldTableCompanion Function({Value<int> id, required String name});
typedef $$FieldTableTableUpdateCompanionBuilder =
    FieldTableCompanion Function({Value<int> id, Value<String> name});

class $$FieldTableTableFilterComposer
    extends Composer<_$AppDatabase, $FieldTableTable> {
  $$FieldTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FieldTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FieldTableTable> {
  $$FieldTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FieldTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FieldTableTable> {
  $$FieldTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$FieldTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FieldTableTable,
          FieldTableData,
          $$FieldTableTableFilterComposer,
          $$FieldTableTableOrderingComposer,
          $$FieldTableTableAnnotationComposer,
          $$FieldTableTableCreateCompanionBuilder,
          $$FieldTableTableUpdateCompanionBuilder,
          (
            FieldTableData,
            BaseReferences<_$AppDatabase, $FieldTableTable, FieldTableData>,
          ),
          FieldTableData,
          PrefetchHooks Function()
        > {
  $$FieldTableTableTableManager(_$AppDatabase db, $FieldTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FieldTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FieldTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FieldTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => FieldTableCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  FieldTableCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FieldTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FieldTableTable,
      FieldTableData,
      $$FieldTableTableFilterComposer,
      $$FieldTableTableOrderingComposer,
      $$FieldTableTableAnnotationComposer,
      $$FieldTableTableCreateCompanionBuilder,
      $$FieldTableTableUpdateCompanionBuilder,
      (
        FieldTableData,
        BaseReferences<_$AppDatabase, $FieldTableTable, FieldTableData>,
      ),
      FieldTableData,
      PrefetchHooks Function()
    >;
typedef $$MaterialTableTableCreateCompanionBuilder =
    MaterialTableCompanion Function({
      Value<int> id,
      required String name,
      Value<double> price,
      required MaterialFormat materialFormat,
    });
typedef $$MaterialTableTableUpdateCompanionBuilder =
    MaterialTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<double> price,
      Value<MaterialFormat> materialFormat,
    });

class $$MaterialTableTableFilterComposer
    extends Composer<_$AppDatabase, $MaterialTableTable> {
  $$MaterialTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<MaterialFormat, MaterialFormat, String>
  get materialFormat => $composableBuilder(
    column: $table.materialFormat,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
}

class $$MaterialTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MaterialTableTable> {
  $$MaterialTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get materialFormat => $composableBuilder(
    column: $table.materialFormat,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MaterialTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MaterialTableTable> {
  $$MaterialTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MaterialFormat, String> get materialFormat =>
      $composableBuilder(
        column: $table.materialFormat,
        builder: (column) => column,
      );
}

class $$MaterialTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MaterialTableTable,
          MaterialTableData,
          $$MaterialTableTableFilterComposer,
          $$MaterialTableTableOrderingComposer,
          $$MaterialTableTableAnnotationComposer,
          $$MaterialTableTableCreateCompanionBuilder,
          $$MaterialTableTableUpdateCompanionBuilder,
          (
            MaterialTableData,
            BaseReferences<
              _$AppDatabase,
              $MaterialTableTable,
              MaterialTableData
            >,
          ),
          MaterialTableData,
          PrefetchHooks Function()
        > {
  $$MaterialTableTableTableManager(_$AppDatabase db, $MaterialTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MaterialTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MaterialTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MaterialTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<MaterialFormat> materialFormat = const Value.absent(),
              }) => MaterialTableCompanion(
                id: id,
                name: name,
                price: price,
                materialFormat: materialFormat,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<double> price = const Value.absent(),
                required MaterialFormat materialFormat,
              }) => MaterialTableCompanion.insert(
                id: id,
                name: name,
                price: price,
                materialFormat: materialFormat,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MaterialTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MaterialTableTable,
      MaterialTableData,
      $$MaterialTableTableFilterComposer,
      $$MaterialTableTableOrderingComposer,
      $$MaterialTableTableAnnotationComposer,
      $$MaterialTableTableCreateCompanionBuilder,
      $$MaterialTableTableUpdateCompanionBuilder,
      (
        MaterialTableData,
        BaseReferences<_$AppDatabase, $MaterialTableTable, MaterialTableData>,
      ),
      MaterialTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$OperationLogsTableTableTableManager get operationLogsTable =>
      $$OperationLogsTableTableTableManager(_db, _db.operationLogsTable);
  $$ActivityTableTableTableManager get activityTable =>
      $$ActivityTableTableTableManager(_db, _db.activityTable);
  $$FieldTableTableTableManager get fieldTable =>
      $$FieldTableTableTableManager(_db, _db.fieldTable);
  $$MaterialTableTableTableManager get materialTable =>
      $$MaterialTableTableTableManager(_db, _db.materialTable);
}
