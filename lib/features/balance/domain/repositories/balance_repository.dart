import '../../data/models/transaction_model.dart';

abstract class BalanceRepository{

  Future<List<TransactionModel>> getTransactions({int? limit});

}