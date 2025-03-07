import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:sqlito/widgets/app.dart';

void main() {
  //inicializar la base de datos

  sqfliteFfiInit();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS || Platform.isAndroid) {
    databaseFactory = databaseFactoryFfi;
  }
  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb;
  }
  runApp(const app());
}


