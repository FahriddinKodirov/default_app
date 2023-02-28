
import 'package:default_package/default/sql/model/student_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static String tableName = 'student';
  static LocalDatabase getInstance = LocalDatabase.init();

  Database? _database;
  LocalDatabase.init();

  Future<Database> getDb() async {
    if (_database == null) {
      _database = await _initDb('studentOne.db');
      return _database!;
    }
    return _database!;
  }

  Future<Database> _initDb(String fileName) async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, fileName);

    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
        String textType = 'TEXT';
        String intType = 'INTEGER';
        String boolType = 'INTEGER';
        String doubleType = 'REAL';

        await db.execute('''
        CREATE TABLE $tableName (
          ${UserFields.id} $idType,
          ${UserFields.age} $intType,
          ${UserFields.name} $textType
        )
    ''');
      },
    );
    return database;
  }
//!                         Shu ergacha doim bir hil yoziladi
//___________________________________________________________________________________________//

// -------------------- Malumotni database ga qo'shish ------------------------------------------
  static Future<StudentModel> insertStudent({required StudentModel studentModel}) async {
    var database = await getInstance.getDb();
    int id = await database.insert(tableName, studentModel.toJson());
    debugPrint('ADD BOLDI HAMMASI YAXSHI');
    return studentModel.copyWith(id: id);
  }


// -------------------- Malumotni database dan o'qib olish ------------------------------------------
static Future<List<StudentModel>> getStudent() async {
    var database = await getInstance.getDb();
    var listOfStudent = await database.query(tableName, columns: [
      UserFields.id,
      UserFields.age,
      UserFields.name,
    ]);
    var list = listOfStudent.map((e) => StudentModel.fromJson(e)).toList();
    return list;
  }

// -------------------- Malumotni hammsini database dan o'chirvorish ------------------------------------------
static Future<int> deleteAll() async {
    var database = await getInstance.getDb();
    return await database.delete(tableName);
  }

// -------------------- Malumotni id bilan o'cgirish database dan o'chirvorish ------------------------------------------

  static Future<int> deleteTaskById(int id) async {
    var database = await getInstance.getDb();
    return await database.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
// -------------------- Malumotni id bilan o'cgirish database dan o'chirvorish ------------------------------------------

static Future<StudentModel> updateTaskById(StudentModel studentModel) async{
    var database = await getInstance.getDb();
    int id = await database.update(
      tableName, 
      studentModel.toJson(),
      where: 'id = ?',
      whereArgs: [studentModel.id]);
      print('zor');
      return studentModel.copyWith(id: id);
  }

// -------------------- Malumotni search bilan chiqarib berish ------------------------------------------

  static Future<List<StudentModel>> getTaskByTitle({String name = ''}) async{
    var database = await getInstance.getDb();

    if(name.isNotEmpty){
      var listOfTodos = await database.query(
        tableName,
        where: 'name LIKE ?',
        whereArgs: ['%$name%'],);
        
        var list = listOfTodos.map((e) => StudentModel.fromJson(e)).toList();
      return list;
    } else {
        var listOfTodos = await database.query(tableName, columns: [
        UserFields.id,
        UserFields.age,
        UserFields.name,
        ]);
         var list = listOfTodos.map((e) => StudentModel.fromJson(e)).toList();
        return list;
    }
  }
  
}
