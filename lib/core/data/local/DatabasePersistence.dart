// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqlite_api.dart';

// class DatabasePersistence {
//   static const DatabaseName = 'save.db';
//   static const MoviesWatchedTableName = 'moviesWatched';
//   Database db;

//   DatabasePersistence._(this.db);

//   static Future<DatabasePersistence> create() async =>
//       DatabasePersistence._(await database());

//   static Future<Database> database() async {
//     return openDatabase(
//       join(await getDatabasesPath(), DatabaseName),
//       onCreate: (db, version) {
//         return db.execute(
//           '''CREATE TABLE $MoviesWatchedTableName(
//             id INTEGER PRIMARY KEY,
//             imdbId INTEGER,
//             name STRING,
//             imageUrl STRING,
//             year STRING,
//             watchedOn INTEGER
//           )''',
//         );
//       },
//       version: 1,
//     );
//   }

//   Future<List<Map<String, dynamic>>> getUniqueObjects() async {
//     final ret = await db.rawQuery(
//         'SELECT *, COUNT(*) as watchedTimes FROM $MoviesWatchedTableName group by imdbId');
//     return ret;
//   }

//   Future<List<Map<String, dynamic>>> findObjects(String query) async {
//     final ret = await db.rawQuery(
//         'SELECT *, COUNT(*) as watchedTimes FROM $MoviesWatchedTableName where name like ? group by imdbId',
//         ['%$query%']);
//     return ret;
//   }

//   void createOrUpdateObject(int key, Map<String, dynamic> object) async {
//     await db.insert(MoviesWatchedTableName, object,
//         conflictAlgorithm: ConflictAlgorithm.replace);
//   }

//   Future<void> removeObject(int key) async {
//     await db.delete(
//       MoviesWatchedTableName,
//       where: 'id = ?',
//       whereArgs: [key],
//     );
//   }
// }
