import 'package:sqflite/sqflite.dart';

import '../model/item_data_model.dart';
import '../services/data_service.dart';

abstract class DataRepository {
  factory DataRepository() => DataService();
  Future<Database> initDB();

  Future<void> insertItem({
    int? id,
    required String type,
    required String title,
    String? subTitle,
    required double amount,
    required String creationDate,
  });

  Future<List<Item>> readItems({sort = ''});

  Future<void> updateItems(Item item);

  Future<void> removeItems(int id);
}
