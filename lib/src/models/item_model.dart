import '../helper/database_helper.dart';

class ItemFields {
// read the data of the database
  static const List<String> values = [
    id,
    title,
    description,
  ];

  // filter which rows to return
  Future<ItemModel> read(String id) async {
    final db = await DatabaseHelper.instance.database;
    final maps = await db.query(
      ItemFields.tableName,
      columns: ItemFields.values,
      where: '${ItemFields.id} = ?',
      //value reference that will be passed on the placeholder whereArgs
      whereArgs: [
        id
      ], //value reference that will be search in the database and will be returned
    );

    if (maps.isNotEmpty) {
      return ItemModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  // created a model of the data of the table
  static const String tableName = 'crochet items';
  static const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  static const String textType = 'TEXT NOT NULL';
  static const String id = '_id';
  static const String title = 'title';
  static const String description = 'description';
}

//  parse the data
class ItemModel {
  late String title;
  late String description;
  late String id;

  ItemModel({
    required this.title,
    required this.description,
    required this.id,
  });

  //Convert a Item model object into a Map object
  Map<String, Object?> toJson() => {
        ItemFields.id: id,
        ItemFields.title: title,
        ItemFields.description: description,
      };

  // Extract a  Item Model object from a Map object
  ItemModel.fromMapObject(Map<String, dynamic> map) {
    title = map["title"];
    description = map["description"];
    id = map["id"];
  }

  // get the unique id and pass to the database
  ItemModel copy({
    String? id,
    String? title,
    String? description,
  }) =>
      ItemModel(
        id: id ?? this.id,
        description: description ?? this.description,
        title: title ?? this.title,
      );

  factory ItemModel.fromJson(Map<String, Object?> json) {
    final String? id = json[ItemFields.id] as String?;
    if (id == null) {
      // Throw an exception or handle the missing id case differently
      throw Exception("Missing id in JSON data");
    }
    return ItemModel(
      id: id,
      title: json[ItemFields.title] as String,
      description: json[ItemFields.description] as String,
    );
  }

// read all items
  Future<List<ItemModel>> readAll() async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.query(ItemFields.tableName, orderBy: id.toString());
    return result.map((json) => ItemModel.fromJson(json)).toList();
  }

// update data of the database
  Future<int> update(ItemModel item) async {
    final db = await DatabaseHelper.instance.database;
    return db.update(
      ItemFields.tableName,
      item.toJson(),
      where: '${ItemFields.id} = ?',
      whereArgs: [item.id],
    );
  }

//delete data of database
  Future<int> delete(String id) async {
    final db = await DatabaseHelper.instance.database;
    return await db.delete(
      ItemFields.tableName,
      where: '${ItemFields.id} = ?',
      whereArgs: [id],
    );
  }

// close the data base
  Future close() async {
    final db = await DatabaseHelper.instance.database;
    db.close();
  }
}
