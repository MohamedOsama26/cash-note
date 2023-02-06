import 'package:cash_note/logic/services/calculations_service.dart';

import '../model/item_data_model.dart';

abstract class CalculationsRepository {
  factory CalculationsRepository() => CalculationsService();

  double listSum(List<Item> items);

  String handleNumber (double amount);

}