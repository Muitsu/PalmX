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
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fieldMeta = const VerificationMeta('field');
  @override
  late final GeneratedColumn<String> field = GeneratedColumn<String>(
    'field',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hectarMeta = const VerificationMeta('hectar');
  @override
  late final GeneratedColumn<double> hectar = GeneratedColumn<double>(
    'hectar',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mandaysMeta = const VerificationMeta(
    'mandays',
  );
  @override
  late final GeneratedColumn<int> mandays = GeneratedColumn<int>(
    'mandays',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
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
    defaultValue: const Constant(65.38),
  );
  static const VerificationMeta _labourOtHourMeta = const VerificationMeta(
    'labourOtHour',
  );
  @override
  late final GeneratedColumn<int> labourOtHour = GeneratedColumn<int>(
    'labour_ot_hour',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
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
    defaultValue: const Constant(13.17),
  );
  static const VerificationMeta _labourPieceQtyMeta = const VerificationMeta(
    'labourPieceQty',
  );
  @override
  late final GeneratedColumn<int> labourPieceQty = GeneratedColumn<int>(
    'labour_piece_qty',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labourPieceRateMeta = const VerificationMeta(
    'labourPieceRate',
  );
  @override
  late final GeneratedColumn<double> labourPieceRate = GeneratedColumn<double>(
    'labour_piece_rate',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
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
    defaultValue: const Constant(65.38),
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
    defaultValue: const Constant(65.38),
  );
  static const VerificationMeta _materialTypeMeta = const VerificationMeta(
    'materialType',
  );
  @override
  late final GeneratedColumn<String> materialType = GeneratedColumn<String>(
    'material_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _materialQtyMeta = const VerificationMeta(
    'materialQty',
  );
  @override
  late final GeneratedColumn<int> materialQty = GeneratedColumn<int>(
    'material_qty',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _materialLitreRateMeta = const VerificationMeta(
    'materialLitreRate',
  );
  @override
  late final GeneratedColumn<double> materialLitreRate =
      GeneratedColumn<double>(
        'material_litre_rate',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _evitTimeMeta = const VerificationMeta(
    'evitTime',
  );
  @override
  late final GeneratedColumn<double> evitTime = GeneratedColumn<double>(
    'evit_time',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _evitRateMeta = const VerificationMeta(
    'evitRate',
  );
  @override
  late final GeneratedColumn<double> evitRate = GeneratedColumn<double>(
    'evit_rate',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    operationDate,
    activityType,
    field,
    hectar,
    mandays,
    remarks,
    labourRate,
    labourOtHour,
    labourOtRate,
    labourPieceQty,
    labourPieceRate,
    supervisionRate,
    driverRate,
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
    } else if (isInserting) {
      context.missing(_activityTypeMeta);
    }
    if (data.containsKey('field')) {
      context.handle(
        _fieldMeta,
        field.isAcceptableOrUnknown(data['field']!, _fieldMeta),
      );
    } else if (isInserting) {
      context.missing(_fieldMeta);
    }
    if (data.containsKey('hectar')) {
      context.handle(
        _hectarMeta,
        hectar.isAcceptableOrUnknown(data['hectar']!, _hectarMeta),
      );
    } else if (isInserting) {
      context.missing(_hectarMeta);
    }
    if (data.containsKey('mandays')) {
      context.handle(
        _mandaysMeta,
        mandays.isAcceptableOrUnknown(data['mandays']!, _mandaysMeta),
      );
    } else if (isInserting) {
      context.missing(_mandaysMeta);
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
    if (data.containsKey('labour_ot_hour')) {
      context.handle(
        _labourOtHourMeta,
        labourOtHour.isAcceptableOrUnknown(
          data['labour_ot_hour']!,
          _labourOtHourMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_labourOtHourMeta);
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
    if (data.containsKey('labour_piece_qty')) {
      context.handle(
        _labourPieceQtyMeta,
        labourPieceQty.isAcceptableOrUnknown(
          data['labour_piece_qty']!,
          _labourPieceQtyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_labourPieceQtyMeta);
    }
    if (data.containsKey('labour_piece_rate')) {
      context.handle(
        _labourPieceRateMeta,
        labourPieceRate.isAcceptableOrUnknown(
          data['labour_piece_rate']!,
          _labourPieceRateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_labourPieceRateMeta);
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
    if (data.containsKey('driver_rate')) {
      context.handle(
        _driverRateMeta,
        driverRate.isAcceptableOrUnknown(data['driver_rate']!, _driverRateMeta),
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
    } else if (isInserting) {
      context.missing(_materialTypeMeta);
    }
    if (data.containsKey('material_qty')) {
      context.handle(
        _materialQtyMeta,
        materialQty.isAcceptableOrUnknown(
          data['material_qty']!,
          _materialQtyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_materialQtyMeta);
    }
    if (data.containsKey('material_litre_rate')) {
      context.handle(
        _materialLitreRateMeta,
        materialLitreRate.isAcceptableOrUnknown(
          data['material_litre_rate']!,
          _materialLitreRateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_materialLitreRateMeta);
    }
    if (data.containsKey('evit_time')) {
      context.handle(
        _evitTimeMeta,
        evitTime.isAcceptableOrUnknown(data['evit_time']!, _evitTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_evitTimeMeta);
    }
    if (data.containsKey('evit_rate')) {
      context.handle(
        _evitRateMeta,
        evitRate.isAcceptableOrUnknown(data['evit_rate']!, _evitRateMeta),
      );
    } else if (isInserting) {
      context.missing(_evitRateMeta);
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
      )!,
      field: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}field'],
      )!,
      hectar: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}hectar'],
      )!,
      mandays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mandays'],
      )!,
      remarks: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remarks'],
      ),
      labourRate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}labour_rate'],
      )!,
      labourOtHour: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}labour_ot_hour'],
      )!,
      labourOtRate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}labour_ot_rate'],
      )!,
      labourPieceQty: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}labour_piece_qty'],
      )!,
      labourPieceRate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}labour_piece_rate'],
      )!,
      supervisionRate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}supervision_rate'],
      )!,
      driverRate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}driver_rate'],
      )!,
      materialType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}material_type'],
      )!,
      materialQty: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}material_qty'],
      )!,
      materialLitreRate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}material_litre_rate'],
      )!,
      evitTime: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}evit_time'],
      )!,
      evitRate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}evit_rate'],
      )!,
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
  final String activityType;
  final String field;
  final double hectar;
  final int mandays;
  final String? remarks;
  final double labourRate;
  final int labourOtHour;
  final double labourOtRate;
  final int labourPieceQty;
  final double labourPieceRate;
  final double supervisionRate;
  final double driverRate;
  final String materialType;
  final int materialQty;
  final double materialLitreRate;
  final double evitTime;
  final double evitRate;
  const OperationLogsTableData({
    required this.id,
    required this.operationDate,
    required this.activityType,
    required this.field,
    required this.hectar,
    required this.mandays,
    this.remarks,
    required this.labourRate,
    required this.labourOtHour,
    required this.labourOtRate,
    required this.labourPieceQty,
    required this.labourPieceRate,
    required this.supervisionRate,
    required this.driverRate,
    required this.materialType,
    required this.materialQty,
    required this.materialLitreRate,
    required this.evitTime,
    required this.evitRate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['operation_date'] = Variable<DateTime>(operationDate);
    map['activity_type'] = Variable<String>(activityType);
    map['field'] = Variable<String>(field);
    map['hectar'] = Variable<double>(hectar);
    map['mandays'] = Variable<int>(mandays);
    if (!nullToAbsent || remarks != null) {
      map['remarks'] = Variable<String>(remarks);
    }
    map['labour_rate'] = Variable<double>(labourRate);
    map['labour_ot_hour'] = Variable<int>(labourOtHour);
    map['labour_ot_rate'] = Variable<double>(labourOtRate);
    map['labour_piece_qty'] = Variable<int>(labourPieceQty);
    map['labour_piece_rate'] = Variable<double>(labourPieceRate);
    map['supervision_rate'] = Variable<double>(supervisionRate);
    map['driver_rate'] = Variable<double>(driverRate);
    map['material_type'] = Variable<String>(materialType);
    map['material_qty'] = Variable<int>(materialQty);
    map['material_litre_rate'] = Variable<double>(materialLitreRate);
    map['evit_time'] = Variable<double>(evitTime);
    map['evit_rate'] = Variable<double>(evitRate);
    return map;
  }

  OperationLogsTableCompanion toCompanion(bool nullToAbsent) {
    return OperationLogsTableCompanion(
      id: Value(id),
      operationDate: Value(operationDate),
      activityType: Value(activityType),
      field: Value(field),
      hectar: Value(hectar),
      mandays: Value(mandays),
      remarks: remarks == null && nullToAbsent
          ? const Value.absent()
          : Value(remarks),
      labourRate: Value(labourRate),
      labourOtHour: Value(labourOtHour),
      labourOtRate: Value(labourOtRate),
      labourPieceQty: Value(labourPieceQty),
      labourPieceRate: Value(labourPieceRate),
      supervisionRate: Value(supervisionRate),
      driverRate: Value(driverRate),
      materialType: Value(materialType),
      materialQty: Value(materialQty),
      materialLitreRate: Value(materialLitreRate),
      evitTime: Value(evitTime),
      evitRate: Value(evitRate),
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
      activityType: serializer.fromJson<String>(json['activityType']),
      field: serializer.fromJson<String>(json['field']),
      hectar: serializer.fromJson<double>(json['hectar']),
      mandays: serializer.fromJson<int>(json['mandays']),
      remarks: serializer.fromJson<String?>(json['remarks']),
      labourRate: serializer.fromJson<double>(json['labourRate']),
      labourOtHour: serializer.fromJson<int>(json['labourOtHour']),
      labourOtRate: serializer.fromJson<double>(json['labourOtRate']),
      labourPieceQty: serializer.fromJson<int>(json['labourPieceQty']),
      labourPieceRate: serializer.fromJson<double>(json['labourPieceRate']),
      supervisionRate: serializer.fromJson<double>(json['supervisionRate']),
      driverRate: serializer.fromJson<double>(json['driverRate']),
      materialType: serializer.fromJson<String>(json['materialType']),
      materialQty: serializer.fromJson<int>(json['materialQty']),
      materialLitreRate: serializer.fromJson<double>(json['materialLitreRate']),
      evitTime: serializer.fromJson<double>(json['evitTime']),
      evitRate: serializer.fromJson<double>(json['evitRate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'operationDate': serializer.toJson<DateTime>(operationDate),
      'activityType': serializer.toJson<String>(activityType),
      'field': serializer.toJson<String>(field),
      'hectar': serializer.toJson<double>(hectar),
      'mandays': serializer.toJson<int>(mandays),
      'remarks': serializer.toJson<String?>(remarks),
      'labourRate': serializer.toJson<double>(labourRate),
      'labourOtHour': serializer.toJson<int>(labourOtHour),
      'labourOtRate': serializer.toJson<double>(labourOtRate),
      'labourPieceQty': serializer.toJson<int>(labourPieceQty),
      'labourPieceRate': serializer.toJson<double>(labourPieceRate),
      'supervisionRate': serializer.toJson<double>(supervisionRate),
      'driverRate': serializer.toJson<double>(driverRate),
      'materialType': serializer.toJson<String>(materialType),
      'materialQty': serializer.toJson<int>(materialQty),
      'materialLitreRate': serializer.toJson<double>(materialLitreRate),
      'evitTime': serializer.toJson<double>(evitTime),
      'evitRate': serializer.toJson<double>(evitRate),
    };
  }

  OperationLogsTableData copyWith({
    int? id,
    DateTime? operationDate,
    String? activityType,
    String? field,
    double? hectar,
    int? mandays,
    Value<String?> remarks = const Value.absent(),
    double? labourRate,
    int? labourOtHour,
    double? labourOtRate,
    int? labourPieceQty,
    double? labourPieceRate,
    double? supervisionRate,
    double? driverRate,
    String? materialType,
    int? materialQty,
    double? materialLitreRate,
    double? evitTime,
    double? evitRate,
  }) => OperationLogsTableData(
    id: id ?? this.id,
    operationDate: operationDate ?? this.operationDate,
    activityType: activityType ?? this.activityType,
    field: field ?? this.field,
    hectar: hectar ?? this.hectar,
    mandays: mandays ?? this.mandays,
    remarks: remarks.present ? remarks.value : this.remarks,
    labourRate: labourRate ?? this.labourRate,
    labourOtHour: labourOtHour ?? this.labourOtHour,
    labourOtRate: labourOtRate ?? this.labourOtRate,
    labourPieceQty: labourPieceQty ?? this.labourPieceQty,
    labourPieceRate: labourPieceRate ?? this.labourPieceRate,
    supervisionRate: supervisionRate ?? this.supervisionRate,
    driverRate: driverRate ?? this.driverRate,
    materialType: materialType ?? this.materialType,
    materialQty: materialQty ?? this.materialQty,
    materialLitreRate: materialLitreRate ?? this.materialLitreRate,
    evitTime: evitTime ?? this.evitTime,
    evitRate: evitRate ?? this.evitRate,
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
      mandays: data.mandays.present ? data.mandays.value : this.mandays,
      remarks: data.remarks.present ? data.remarks.value : this.remarks,
      labourRate: data.labourRate.present
          ? data.labourRate.value
          : this.labourRate,
      labourOtHour: data.labourOtHour.present
          ? data.labourOtHour.value
          : this.labourOtHour,
      labourOtRate: data.labourOtRate.present
          ? data.labourOtRate.value
          : this.labourOtRate,
      labourPieceQty: data.labourPieceQty.present
          ? data.labourPieceQty.value
          : this.labourPieceQty,
      labourPieceRate: data.labourPieceRate.present
          ? data.labourPieceRate.value
          : this.labourPieceRate,
      supervisionRate: data.supervisionRate.present
          ? data.supervisionRate.value
          : this.supervisionRate,
      driverRate: data.driverRate.present
          ? data.driverRate.value
          : this.driverRate,
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
          ..write('mandays: $mandays, ')
          ..write('remarks: $remarks, ')
          ..write('labourRate: $labourRate, ')
          ..write('labourOtHour: $labourOtHour, ')
          ..write('labourOtRate: $labourOtRate, ')
          ..write('labourPieceQty: $labourPieceQty, ')
          ..write('labourPieceRate: $labourPieceRate, ')
          ..write('supervisionRate: $supervisionRate, ')
          ..write('driverRate: $driverRate, ')
          ..write('materialType: $materialType, ')
          ..write('materialQty: $materialQty, ')
          ..write('materialLitreRate: $materialLitreRate, ')
          ..write('evitTime: $evitTime, ')
          ..write('evitRate: $evitRate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    operationDate,
    activityType,
    field,
    hectar,
    mandays,
    remarks,
    labourRate,
    labourOtHour,
    labourOtRate,
    labourPieceQty,
    labourPieceRate,
    supervisionRate,
    driverRate,
    materialType,
    materialQty,
    materialLitreRate,
    evitTime,
    evitRate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OperationLogsTableData &&
          other.id == this.id &&
          other.operationDate == this.operationDate &&
          other.activityType == this.activityType &&
          other.field == this.field &&
          other.hectar == this.hectar &&
          other.mandays == this.mandays &&
          other.remarks == this.remarks &&
          other.labourRate == this.labourRate &&
          other.labourOtHour == this.labourOtHour &&
          other.labourOtRate == this.labourOtRate &&
          other.labourPieceQty == this.labourPieceQty &&
          other.labourPieceRate == this.labourPieceRate &&
          other.supervisionRate == this.supervisionRate &&
          other.driverRate == this.driverRate &&
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
  final Value<String> activityType;
  final Value<String> field;
  final Value<double> hectar;
  final Value<int> mandays;
  final Value<String?> remarks;
  final Value<double> labourRate;
  final Value<int> labourOtHour;
  final Value<double> labourOtRate;
  final Value<int> labourPieceQty;
  final Value<double> labourPieceRate;
  final Value<double> supervisionRate;
  final Value<double> driverRate;
  final Value<String> materialType;
  final Value<int> materialQty;
  final Value<double> materialLitreRate;
  final Value<double> evitTime;
  final Value<double> evitRate;
  const OperationLogsTableCompanion({
    this.id = const Value.absent(),
    this.operationDate = const Value.absent(),
    this.activityType = const Value.absent(),
    this.field = const Value.absent(),
    this.hectar = const Value.absent(),
    this.mandays = const Value.absent(),
    this.remarks = const Value.absent(),
    this.labourRate = const Value.absent(),
    this.labourOtHour = const Value.absent(),
    this.labourOtRate = const Value.absent(),
    this.labourPieceQty = const Value.absent(),
    this.labourPieceRate = const Value.absent(),
    this.supervisionRate = const Value.absent(),
    this.driverRate = const Value.absent(),
    this.materialType = const Value.absent(),
    this.materialQty = const Value.absent(),
    this.materialLitreRate = const Value.absent(),
    this.evitTime = const Value.absent(),
    this.evitRate = const Value.absent(),
  });
  OperationLogsTableCompanion.insert({
    this.id = const Value.absent(),
    required DateTime operationDate,
    required String activityType,
    required String field,
    required double hectar,
    required int mandays,
    this.remarks = const Value.absent(),
    this.labourRate = const Value.absent(),
    required int labourOtHour,
    this.labourOtRate = const Value.absent(),
    required int labourPieceQty,
    required double labourPieceRate,
    this.supervisionRate = const Value.absent(),
    this.driverRate = const Value.absent(),
    required String materialType,
    required int materialQty,
    required double materialLitreRate,
    required double evitTime,
    required double evitRate,
  }) : operationDate = Value(operationDate),
       activityType = Value(activityType),
       field = Value(field),
       hectar = Value(hectar),
       mandays = Value(mandays),
       labourOtHour = Value(labourOtHour),
       labourPieceQty = Value(labourPieceQty),
       labourPieceRate = Value(labourPieceRate),
       materialType = Value(materialType),
       materialQty = Value(materialQty),
       materialLitreRate = Value(materialLitreRate),
       evitTime = Value(evitTime),
       evitRate = Value(evitRate);
  static Insertable<OperationLogsTableData> custom({
    Expression<int>? id,
    Expression<DateTime>? operationDate,
    Expression<String>? activityType,
    Expression<String>? field,
    Expression<double>? hectar,
    Expression<int>? mandays,
    Expression<String>? remarks,
    Expression<double>? labourRate,
    Expression<int>? labourOtHour,
    Expression<double>? labourOtRate,
    Expression<int>? labourPieceQty,
    Expression<double>? labourPieceRate,
    Expression<double>? supervisionRate,
    Expression<double>? driverRate,
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
      if (mandays != null) 'mandays': mandays,
      if (remarks != null) 'remarks': remarks,
      if (labourRate != null) 'labour_rate': labourRate,
      if (labourOtHour != null) 'labour_ot_hour': labourOtHour,
      if (labourOtRate != null) 'labour_ot_rate': labourOtRate,
      if (labourPieceQty != null) 'labour_piece_qty': labourPieceQty,
      if (labourPieceRate != null) 'labour_piece_rate': labourPieceRate,
      if (supervisionRate != null) 'supervision_rate': supervisionRate,
      if (driverRate != null) 'driver_rate': driverRate,
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
    Value<String>? activityType,
    Value<String>? field,
    Value<double>? hectar,
    Value<int>? mandays,
    Value<String?>? remarks,
    Value<double>? labourRate,
    Value<int>? labourOtHour,
    Value<double>? labourOtRate,
    Value<int>? labourPieceQty,
    Value<double>? labourPieceRate,
    Value<double>? supervisionRate,
    Value<double>? driverRate,
    Value<String>? materialType,
    Value<int>? materialQty,
    Value<double>? materialLitreRate,
    Value<double>? evitTime,
    Value<double>? evitRate,
  }) {
    return OperationLogsTableCompanion(
      id: id ?? this.id,
      operationDate: operationDate ?? this.operationDate,
      activityType: activityType ?? this.activityType,
      field: field ?? this.field,
      hectar: hectar ?? this.hectar,
      mandays: mandays ?? this.mandays,
      remarks: remarks ?? this.remarks,
      labourRate: labourRate ?? this.labourRate,
      labourOtHour: labourOtHour ?? this.labourOtHour,
      labourOtRate: labourOtRate ?? this.labourOtRate,
      labourPieceQty: labourPieceQty ?? this.labourPieceQty,
      labourPieceRate: labourPieceRate ?? this.labourPieceRate,
      supervisionRate: supervisionRate ?? this.supervisionRate,
      driverRate: driverRate ?? this.driverRate,
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
    if (mandays.present) {
      map['mandays'] = Variable<int>(mandays.value);
    }
    if (remarks.present) {
      map['remarks'] = Variable<String>(remarks.value);
    }
    if (labourRate.present) {
      map['labour_rate'] = Variable<double>(labourRate.value);
    }
    if (labourOtHour.present) {
      map['labour_ot_hour'] = Variable<int>(labourOtHour.value);
    }
    if (labourOtRate.present) {
      map['labour_ot_rate'] = Variable<double>(labourOtRate.value);
    }
    if (labourPieceQty.present) {
      map['labour_piece_qty'] = Variable<int>(labourPieceQty.value);
    }
    if (labourPieceRate.present) {
      map['labour_piece_rate'] = Variable<double>(labourPieceRate.value);
    }
    if (supervisionRate.present) {
      map['supervision_rate'] = Variable<double>(supervisionRate.value);
    }
    if (driverRate.present) {
      map['driver_rate'] = Variable<double>(driverRate.value);
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
          ..write('mandays: $mandays, ')
          ..write('remarks: $remarks, ')
          ..write('labourRate: $labourRate, ')
          ..write('labourOtHour: $labourOtHour, ')
          ..write('labourOtRate: $labourOtRate, ')
          ..write('labourPieceQty: $labourPieceQty, ')
          ..write('labourPieceRate: $labourPieceRate, ')
          ..write('supervisionRate: $supervisionRate, ')
          ..write('driverRate: $driverRate, ')
          ..write('materialType: $materialType, ')
          ..write('materialQty: $materialQty, ')
          ..write('materialLitreRate: $materialLitreRate, ')
          ..write('evitTime: $evitTime, ')
          ..write('evitRate: $evitRate')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $OperationLogsTableTable operationLogsTable =
      $OperationLogsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [operationLogsTable];
}

typedef $$OperationLogsTableTableCreateCompanionBuilder =
    OperationLogsTableCompanion Function({
      Value<int> id,
      required DateTime operationDate,
      required String activityType,
      required String field,
      required double hectar,
      required int mandays,
      Value<String?> remarks,
      Value<double> labourRate,
      required int labourOtHour,
      Value<double> labourOtRate,
      required int labourPieceQty,
      required double labourPieceRate,
      Value<double> supervisionRate,
      Value<double> driverRate,
      required String materialType,
      required int materialQty,
      required double materialLitreRate,
      required double evitTime,
      required double evitRate,
    });
typedef $$OperationLogsTableTableUpdateCompanionBuilder =
    OperationLogsTableCompanion Function({
      Value<int> id,
      Value<DateTime> operationDate,
      Value<String> activityType,
      Value<String> field,
      Value<double> hectar,
      Value<int> mandays,
      Value<String?> remarks,
      Value<double> labourRate,
      Value<int> labourOtHour,
      Value<double> labourOtRate,
      Value<int> labourPieceQty,
      Value<double> labourPieceRate,
      Value<double> supervisionRate,
      Value<double> driverRate,
      Value<String> materialType,
      Value<int> materialQty,
      Value<double> materialLitreRate,
      Value<double> evitTime,
      Value<double> evitRate,
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

  ColumnFilters<int> get mandays => $composableBuilder(
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

  ColumnFilters<int> get labourOtHour => $composableBuilder(
    column: $table.labourOtHour,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get labourOtRate => $composableBuilder(
    column: $table.labourOtRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get labourPieceQty => $composableBuilder(
    column: $table.labourPieceQty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get labourPieceRate => $composableBuilder(
    column: $table.labourPieceRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get supervisionRate => $composableBuilder(
    column: $table.supervisionRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get driverRate => $composableBuilder(
    column: $table.driverRate,
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

  ColumnOrderings<int> get mandays => $composableBuilder(
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

  ColumnOrderings<int> get labourOtHour => $composableBuilder(
    column: $table.labourOtHour,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get labourOtRate => $composableBuilder(
    column: $table.labourOtRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get labourPieceQty => $composableBuilder(
    column: $table.labourPieceQty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get labourPieceRate => $composableBuilder(
    column: $table.labourPieceRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get supervisionRate => $composableBuilder(
    column: $table.supervisionRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get driverRate => $composableBuilder(
    column: $table.driverRate,
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

  GeneratedColumn<int> get mandays =>
      $composableBuilder(column: $table.mandays, builder: (column) => column);

  GeneratedColumn<String> get remarks =>
      $composableBuilder(column: $table.remarks, builder: (column) => column);

  GeneratedColumn<double> get labourRate => $composableBuilder(
    column: $table.labourRate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get labourOtHour => $composableBuilder(
    column: $table.labourOtHour,
    builder: (column) => column,
  );

  GeneratedColumn<double> get labourOtRate => $composableBuilder(
    column: $table.labourOtRate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get labourPieceQty => $composableBuilder(
    column: $table.labourPieceQty,
    builder: (column) => column,
  );

  GeneratedColumn<double> get labourPieceRate => $composableBuilder(
    column: $table.labourPieceRate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get supervisionRate => $composableBuilder(
    column: $table.supervisionRate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get driverRate => $composableBuilder(
    column: $table.driverRate,
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
                Value<String> activityType = const Value.absent(),
                Value<String> field = const Value.absent(),
                Value<double> hectar = const Value.absent(),
                Value<int> mandays = const Value.absent(),
                Value<String?> remarks = const Value.absent(),
                Value<double> labourRate = const Value.absent(),
                Value<int> labourOtHour = const Value.absent(),
                Value<double> labourOtRate = const Value.absent(),
                Value<int> labourPieceQty = const Value.absent(),
                Value<double> labourPieceRate = const Value.absent(),
                Value<double> supervisionRate = const Value.absent(),
                Value<double> driverRate = const Value.absent(),
                Value<String> materialType = const Value.absent(),
                Value<int> materialQty = const Value.absent(),
                Value<double> materialLitreRate = const Value.absent(),
                Value<double> evitTime = const Value.absent(),
                Value<double> evitRate = const Value.absent(),
              }) => OperationLogsTableCompanion(
                id: id,
                operationDate: operationDate,
                activityType: activityType,
                field: field,
                hectar: hectar,
                mandays: mandays,
                remarks: remarks,
                labourRate: labourRate,
                labourOtHour: labourOtHour,
                labourOtRate: labourOtRate,
                labourPieceQty: labourPieceQty,
                labourPieceRate: labourPieceRate,
                supervisionRate: supervisionRate,
                driverRate: driverRate,
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
                required String activityType,
                required String field,
                required double hectar,
                required int mandays,
                Value<String?> remarks = const Value.absent(),
                Value<double> labourRate = const Value.absent(),
                required int labourOtHour,
                Value<double> labourOtRate = const Value.absent(),
                required int labourPieceQty,
                required double labourPieceRate,
                Value<double> supervisionRate = const Value.absent(),
                Value<double> driverRate = const Value.absent(),
                required String materialType,
                required int materialQty,
                required double materialLitreRate,
                required double evitTime,
                required double evitRate,
              }) => OperationLogsTableCompanion.insert(
                id: id,
                operationDate: operationDate,
                activityType: activityType,
                field: field,
                hectar: hectar,
                mandays: mandays,
                remarks: remarks,
                labourRate: labourRate,
                labourOtHour: labourOtHour,
                labourOtRate: labourOtRate,
                labourPieceQty: labourPieceQty,
                labourPieceRate: labourPieceRate,
                supervisionRate: supervisionRate,
                driverRate: driverRate,
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

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$OperationLogsTableTableTableManager get operationLogsTable =>
      $$OperationLogsTableTableTableManager(_db, _db.operationLogsTable);
}
