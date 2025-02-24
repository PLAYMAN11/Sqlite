import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart' as sqlite;
import 'package:path/path.dart';
class Sqlite{

  static Future<sqlite.Database> db() async {
    String ruta = await sqlite.inMemoryDatabasePath;
    //abrir la base de datos
    return sqlite.openDatabase(join(ruta, "planeta.db"),
    version: 1, singleInstance: true, onCreate: (db, version)async{
      await createdb(db);
    },);

  }

  static Future<void> createdb(Database db) async {
    const String sql = """
    create table planetas (
    id integer primary key autoincrement not null,
    nombre text not null,
    distSol real not null,
    radio real not null
    )
    """;
    await db.execute(sql);
  }

}