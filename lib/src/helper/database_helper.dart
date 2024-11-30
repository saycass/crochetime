import 'dart:async';
import 'package:crochetime/src/models/item_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();

  Database? _database;
  DatabaseHelper._internal();

  Future<Database> get database async {
    // verify if the database already exits
    if (_database != null) {
      return _database!;
    }
    _database =
        await _initDatabase(); // if does not have any database, is create one
    return _database!;
  }

  Future<Database> _initDatabase() async {
    // database path
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/crochet.db';
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  // this will catch the model class an create and save the data on a table
  Future<void> _createDatabase(Database db, int version) async {
    return await db.execute(''' CREATE TABLE ${ItemFields.tableName} (
        ${ItemFields.id} ${ItemFields.idType},
        ${ItemFields.title} ${ItemFields.textType},
        ${ItemFields.description} ${ItemFields.textType},
     
    )
   ''');
  }

  Future<ItemModel> create(ItemModel item) async {
    final db = await instance.database;
    final id = await db.insert(ItemFields.tableName, item.toJson());
    return item.copy(id: id.toString());
  }
}
