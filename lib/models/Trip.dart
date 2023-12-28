/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the Trip type in your schema. */
class Trip extends amplify_core.Model {
  static const classType = const _TripModelType();
  final String id;
  final Units? _tripUnits;
  final String? _vehicleMake;
  final String? _vehicleModel;
  final int? _vehicleYear;
  final int? _startReading;
  final int? _endReading;
  final int? _fuelQuantity;
  final String? _date;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  TripModelIdentifier get modelIdentifier {
      return TripModelIdentifier(
        id: id
      );
  }
  
  Units get tripUnits {
    try {
      return _tripUnits!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get vehicleMake {
    try {
      return _vehicleMake!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get vehicleModel {
    try {
      return _vehicleModel!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get vehicleYear {
    try {
      return _vehicleYear!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get startReading {
    try {
      return _startReading!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get endReading {
    try {
      return _endReading!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get fuelQuantity {
    try {
      return _fuelQuantity!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get date {
    try {
      return _date!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Trip._internal({required this.id, required tripUnits, required vehicleMake, required vehicleModel, required vehicleYear, required startReading, required endReading, required fuelQuantity, required date, createdAt, updatedAt}): _tripUnits = tripUnits, _vehicleMake = vehicleMake, _vehicleModel = vehicleModel, _vehicleYear = vehicleYear, _startReading = startReading, _endReading = endReading, _fuelQuantity = fuelQuantity, _date = date, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Trip({String? id, required Units tripUnits, required String vehicleMake, required String vehicleModel, required int vehicleYear, required int startReading, required int endReading, required int fuelQuantity, required String date}) {
    return Trip._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      tripUnits: tripUnits,
      vehicleMake: vehicleMake,
      vehicleModel: vehicleModel,
      vehicleYear: vehicleYear,
      startReading: startReading,
      endReading: endReading,
      fuelQuantity: fuelQuantity,
      date: date);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Trip &&
      id == other.id &&
      _tripUnits == other._tripUnits &&
      _vehicleMake == other._vehicleMake &&
      _vehicleModel == other._vehicleModel &&
      _vehicleYear == other._vehicleYear &&
      _startReading == other._startReading &&
      _endReading == other._endReading &&
      _fuelQuantity == other._fuelQuantity &&
      _date == other._date;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Trip {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("tripUnits=" + (_tripUnits != null ? amplify_core.enumToString(_tripUnits)! : "null") + ", ");
    buffer.write("vehicleMake=" + "$_vehicleMake" + ", ");
    buffer.write("vehicleModel=" + "$_vehicleModel" + ", ");
    buffer.write("vehicleYear=" + (_vehicleYear != null ? _vehicleYear!.toString() : "null") + ", ");
    buffer.write("startReading=" + (_startReading != null ? _startReading!.toString() : "null") + ", ");
    buffer.write("endReading=" + (_endReading != null ? _endReading!.toString() : "null") + ", ");
    buffer.write("fuelQuantity=" + (_fuelQuantity != null ? _fuelQuantity!.toString() : "null") + ", ");
    buffer.write("date=" + "$_date" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Trip copyWith({Units? tripUnits, String? vehicleMake, String? vehicleModel, int? vehicleYear, int? startReading, int? endReading, int? fuelQuantity, String? date}) {
    return Trip._internal(
      id: id,
      tripUnits: tripUnits ?? this.tripUnits,
      vehicleMake: vehicleMake ?? this.vehicleMake,
      vehicleModel: vehicleModel ?? this.vehicleModel,
      vehicleYear: vehicleYear ?? this.vehicleYear,
      startReading: startReading ?? this.startReading,
      endReading: endReading ?? this.endReading,
      fuelQuantity: fuelQuantity ?? this.fuelQuantity,
      date: date ?? this.date);
  }
  
  Trip copyWithModelFieldValues({
    ModelFieldValue<Units>? tripUnits,
    ModelFieldValue<String>? vehicleMake,
    ModelFieldValue<String>? vehicleModel,
    ModelFieldValue<int>? vehicleYear,
    ModelFieldValue<int>? startReading,
    ModelFieldValue<int>? endReading,
    ModelFieldValue<int>? fuelQuantity,
    ModelFieldValue<String>? date
  }) {
    return Trip._internal(
      id: id,
      tripUnits: tripUnits == null ? this.tripUnits : tripUnits.value,
      vehicleMake: vehicleMake == null ? this.vehicleMake : vehicleMake.value,
      vehicleModel: vehicleModel == null ? this.vehicleModel : vehicleModel.value,
      vehicleYear: vehicleYear == null ? this.vehicleYear : vehicleYear.value,
      startReading: startReading == null ? this.startReading : startReading.value,
      endReading: endReading == null ? this.endReading : endReading.value,
      fuelQuantity: fuelQuantity == null ? this.fuelQuantity : fuelQuantity.value,
      date: date == null ? this.date : date.value
    );
  }
  
  Trip.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _tripUnits = amplify_core.enumFromString<units>(json['tripUnits'], units.values),
      _vehicleMake = json['vehicleMake'],
      _vehicleModel = json['vehicleModel'],
      _vehicleYear = (json['vehicleYear'] as num?)?.toInt(),
      _startReading = (json['startReading'] as num?)?.toInt(),
      _endReading = (json['endReading'] as num?)?.toInt(),
      _fuelQuantity = (json['fuelQuantity'] as num?)?.toInt(),
      _date = json['date'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'tripUnits': amplify_core.enumToString(_tripUnits), 'vehicleMake': _vehicleMake, 'vehicleModel': _vehicleModel, 'vehicleYear': _vehicleYear, 'startReading': _startReading, 'endReading': _endReading, 'fuelQuantity': _fuelQuantity, 'date': _date, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'tripUnits': _tripUnits,
    'vehicleMake': _vehicleMake,
    'vehicleModel': _vehicleModel,
    'vehicleYear': _vehicleYear,
    'startReading': _startReading,
    'endReading': _endReading,
    'fuelQuantity': _fuelQuantity,
    'date': _date,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<TripModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<TripModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final TRIPUNITS = amplify_core.QueryField(fieldName: "tripUnits");
  static final VEHICLEMAKE = amplify_core.QueryField(fieldName: "vehicleMake");
  static final VEHICLEMODEL = amplify_core.QueryField(fieldName: "vehicleModel");
  static final VEHICLEYEAR = amplify_core.QueryField(fieldName: "vehicleYear");
  static final STARTREADING = amplify_core.QueryField(fieldName: "startReading");
  static final ENDREADING = amplify_core.QueryField(fieldName: "endReading");
  static final FUELQUANTITY = amplify_core.QueryField(fieldName: "fuelQuantity");
  static final DATE = amplify_core.QueryField(fieldName: "date");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Trip";
    modelSchemaDefinition.pluralName = "Trips";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Trip.TRIPUNITS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Trip.VEHICLEMAKE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Trip.VEHICLEMODEL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Trip.VEHICLEYEAR,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Trip.STARTREADING,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Trip.ENDREADING,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Trip.FUELQUANTITY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Trip.DATE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _TripModelType extends amplify_core.ModelType<Trip> {
  const _TripModelType();
  
  @override
  Trip fromJson(Map<String, dynamic> jsonData) {
    return Trip.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Trip';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Trip] in your schema.
 */
class TripModelIdentifier implements amplify_core.ModelIdentifier<Trip> {
  final String id;

  /** Create an instance of TripModelIdentifier using [id] the primary key. */
  const TripModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'TripModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is TripModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}