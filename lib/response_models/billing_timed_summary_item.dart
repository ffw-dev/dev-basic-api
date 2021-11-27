import 'package:json_annotation/json_annotation.dart';

part 'billing_timed_summary_item.g.dart';

@JsonSerializable(explicitToJson: true)

class BillingTimedSummaryItem {
  @JsonKey(name: 'Date')
  int date;

  @JsonKey(name: 'DigitizationCount')
  int digitizationCount;

  @JsonKey(name: 'IntermediateCount')
  int intermediateCount;

  @JsonKey(name: 'FinalizeCount')
  int finalizeCount;

  @JsonKey(name: 'ExportCount')
  int exportCount;

  @JsonKey(name: 'DigitizeDuration')
  String digitizeDuration;

  @JsonKey(name: 'IntermediateDuration')
  String intermediateDuration;

  @JsonKey(name: 'FinalizeDuration')
  String finalizeDuration;

  @JsonKey(name: 'ExportDuration')
  String exportDuration;

  @JsonKey(name: 'FullName')
  String fullName;

  BillingTimedSummaryItem(
      {required this.date,
        required this.digitizationCount,
        required this.intermediateCount,
        required this.finalizeCount,
        required this.exportCount,
        required this.digitizeDuration,
        required this.intermediateDuration,
        required this.finalizeDuration,
        required this.exportDuration,
        required this.fullName});


  factory BillingTimedSummaryItem.fromJson(Map<String, dynamic> json) => _$BillingTimedSummaryItemFromJson(json);
  Map<String, dynamic> toJson() => _$BillingTimedSummaryItemToJson(this);
}