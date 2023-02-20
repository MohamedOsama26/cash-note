import 'package:cash_note/logic/model/item_data_model.dart';
import 'package:cash_note/logic/repository/calculations_repository.dart';

class CalculationsService implements CalculationsRepository{


  @override
  double listSum(List<Item> items) {
    double sum = 0;
    for(Item item in items){
      sum+= item.amount;
    }
    return sum;
  }

  @override
  String handleNumber(double amount) {
    String total;

    if (amount >= 1000000) {
      total =
      '${(amount / 1000000).toStringAsFixed(2)} M';
    } else if (amount >= 10000) {
      total = '${(amount / 1000).toStringAsFixed(2)} K';
    } else {
      total = amount.toStringAsFixed(2);
    }

    return total;
  }



}

class IncomeCalculationService extends CalculationsService {

  @override
  double listSum(List<Item> items) {
    double sum = 0;
    for(Item item in items){
      if(item.type == 'income'){
        sum += item.amount;
      }
    }
    return sum;
  }

}

class ExpenseCalculationsService extends CalculationsService {

  @override
  double listSum(List<Item> items) {
    double sum = 0;
    for(Item item in items){
      if(item.type == 'expenditure'){
        sum += item.amount;
      }
    }
    return sum;
  }

}