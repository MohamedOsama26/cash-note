import 'package:cash_note/core/utils/app_enum.dart';
import 'package:cash_note/features/statistics/domain/entities/value.dart';

class ValueModel extends Value {
  ValueModel({
    required super.type,
    required super.amount,
  });

  factory ValueModel.fromJson(Map<String, dynamic> json) {

    return ValueModel(
      type: TransactionType.getType(json['type']),
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'type': type, 'amount': amount};
  }
}
