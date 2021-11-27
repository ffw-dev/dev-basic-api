// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_timed_summary_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillingTimedSummaryItem _$BillingTimedSummaryItemFromJson(
        Map<String, dynamic> json) =>
    BillingTimedSummaryItem(
      date: json['Date'] as int,
      digitizationCount: json['DigitizationCount'] as int,
      intermediateCount: json['IntermediateCount'] as int,
      finalizeCount: json['FinalizeCount'] as int,
      exportCount: json['ExportCount'] as int,
      digitizeDuration: json['DigitizeDuration'] as String,
      intermediateDuration: json['IntermediateDuration'] as String,
      finalizeDuration: json['FinalizeDuration'] as String,
      exportDuration: json['ExportDuration'] as String,
      fullName: json['FullName'] as String,
    );

Map<String, dynamic> _$BillingTimedSummaryItemToJson(
        BillingTimedSummaryItem instance) =>
    <String, dynamic>{
      'Date': instance.date,
      'DigitizationCount': instance.digitizationCount,
      'IntermediateCount': instance.intermediateCount,
      'FinalizeCount': instance.finalizeCount,
      'ExportCount': instance.exportCount,
      'DigitizeDuration': instance.digitizeDuration,
      'IntermediateDuration': instance.intermediateDuration,
      'FinalizeDuration': instance.finalizeDuration,
      'ExportDuration': instance.exportDuration,
      'FullName': instance.fullName,
    };
