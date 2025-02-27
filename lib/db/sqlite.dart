import 'dart:io' as io;

import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart' as sqlite;
import 'package:path/path.dart';
import 'package:sqlito/db/planetas.dart';
class Sqlite{

  static Future<sqlite.Database> db() async {


 final io.Directory appDocumentsDir = await getApplicationDocumentsDirectory();

 String ruta = join(appDocumentsDir.path, "databases", "planetas.db");




    //abrir la base de datos
    return sqlite.openDatabase(ruta,
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
  static Future<List<Planetas>> querydb() async {
    //abrir la base de datos
    final db = await Sqlite.db();
    List<Map<String, dynamic>> planets = await db.query("planetas");
    //realizamos el query
    return planets.map((e){
      return Planetas.deMapa(e);
    },).toList();
  }

  static add(List<Planetas> p) {}

}