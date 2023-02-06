import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/item_data_model.dart';
import '../repository/data_repository.dart';

class DataService implements DataRepository {


  @override
  Future<Database> initDB() async {
    return openDatabase(
      join(await getDatabasesPath(), 'cash_note.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE items(id INTEGER PRIMARY KEY AUTOINCREMENT, type VARCHAR(7) , title TEXT , subtitle TEXT NULL , amount REAL , creation_date NUMERIC )',
        );
      },
      version: 1,
    );
  }

  @override
  Future<void> insertItem({
    int? id,
    required String type,
    required String title,
    String? subTitle,
    required double amount,
    required String creationDate,
  }) async {
    Item item = Item(
      type: type,
      creationDate: creationDate,
      amount: amount,
      title: title,
      subTitle: subTitle,
      id: id,
    );
    final db = await initDB();
    await db.insert(
      'items',
      item.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<Item>> readItems({sort = ''}) async {
    final db = await initDB();
    List<Map<String, Object?>> itemMaps =
        await db.query('items', orderBy: "creation_date $sort");
    List<Item> items = itemMaps.map((item) => Item.fromJson(item)).toList();
    return items;
  }

  @override
  Future<void> removeItems(int id) async {
    final db = await initDB();
    await db.delete(
      'items',
      where: 'id = ? ',
      whereArgs: [id],
    );
  }

  @override
  Future<void> updateItems(Item item) async {
    final db = await initDB();
    await db.update(
      'items',
      item.toJson(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }
}
