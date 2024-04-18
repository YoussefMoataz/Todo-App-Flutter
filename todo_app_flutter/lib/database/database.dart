// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:floor/floor.dart';
import 'package:todo_app_flutter/database/daos/todo_dao.dart';
import 'package:todo_app_flutter/domain/todo.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Todo])
abstract class AppDatabase extends FloorDatabase{
  TodoDao get todoDao;
}