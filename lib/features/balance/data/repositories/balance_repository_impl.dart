import '../../../balance/data/models/transaction_model.dart';
import '../../domain/repositories/balance_repository.dart';
import '../data_sources/local/balance_local_data_source_impl.dart';

class BalanceRepositoryImpl extends BalanceRepository {
  final BalanceLocalDataSourceImpl _dataSource =
     BalanceLocalDataSourceImpl();


  @override
  Future<List<TransactionModel>> getTransactions({int? limit}) async{
    final List<Map<String,dynamic>> maps = await _dataSource.getTransactions();
    final List<TransactionModel> transactions = maps.map((transaction) => TransactionModel.fromJson(transaction)).toList();
    return transactions;
  }
}
