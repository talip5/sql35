import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/open.dart';
import 'dart:io';
import 'package:sqlite3/sqlite3.dart';
import 'dart:ffi';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Database? database;

  createDatabase() async{
    //print(sqlite3.version);
    Directory? databasesPath=await getExternalStorageDirectory();
    String databasesPathx=databasesPath!.path;
    String dbPath='$databasesPathx/my1.db';
    database=await sqlite3.open(dbPath);
     var versionx=await sqlite3.version;
       print(databasesPathx);
    print(dbPath);
    print(versionx.toString());
  }

  createTable() async{
    Directory? databasesPath=await getExternalStorageDirectory();
    String databasesPathx=databasesPath!.path;
    String dbPath='$databasesPathx/my1.db';
    Database database=await sqlite3.open(dbPath);
    database.execute("CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL,age INTEGER NOT NULL, country TEXT NOT NULL, email TEXT)");
  }

 /* createTablo() async{
    await database.execute("CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL,age INTEGER NOT NULL, country TEXT NOT NULL, email TEXT)",
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sqllite',
      home: Scaffold(
        appBar: AppBar(
          title: Text('sqlLite'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('SQLLITE'),
              ElevatedButton(
                  onPressed: (){
                   //createDatabase();
                    createTable();
                    print('sqllite');
                  },
                  child: Text('sqllite'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
