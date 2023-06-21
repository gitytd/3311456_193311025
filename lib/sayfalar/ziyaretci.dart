import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Ziyaretci extends StatefulWidget {
  Ziyaretci({super.key});

  @override
  State<Ziyaretci> createState() => _ZiyaretciState();
}

class _ZiyaretciState extends State<Ziyaretci> {
  @override
  TextEditingController yorumController = TextEditingController();
  String? yorum;
  String? yazar = 'Isimsiz';
  String baslik = 'Ziyaretci Defteri';

  TextEditingController yazarcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData().then((value) {
      setState(() {
        if (value.length > 0) {
          yazarcontroller.text = value[value.length - 1]['isim'];
        }
      });
    });
    readText().then((value) {
      print(value);
      if (value != 'none') {
        setState(() {
          baslik = 'Hos Geldiniz, ' + value;
        });
      }
    });
  }

  //SQL ISLEMLERI

  Future<void> insertData(Map<String, dynamic> data) async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'isim.db'),
      onCreate: (db, version) {
        return db.execute(
            '''CREATE TABLE IF NOT EXISTS isim (id INTEGER PRIMARY KEY AUTOINCREMENT, isim TEXT)''');
      },
      version: 1,
    );

    final db = await database;
    await db.rawQuery(
        '''CREATE TABLE IF NOT EXISTS  isim (id INTEGER PRIMARY KEY AUTOINCREMENT, isim TEXT)''');
    await db.insert('isim', data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'isim.db'),
      onCreate: (db, version) {
        return db.execute(
            '''CREATE TABLE IF NOT EXISTS isim (id INTEGER PRIMARY KEY AUTOINCREMENT, isim TEXT)''');
      },
      version: 1,
    );

    final db = await database;
    print(await db.query('isim'));
    return await db.query('isim');
  }

  //DOSYA ISLEMLERI

  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get localFile async {
    final path = await localPath;
    return File('$path/isim.txt');
  }

  Future<File> writeText(String text) async {
    final file = await localFile;
    return file.writeAsString(text);
  }

  Future<String> readText() async {
    try {
      final file = await localFile;
      final contents = await file.readAsString();
      return contents;
    } catch (e) {
      return 'none';
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomSheet: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.green),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TextField(
                        maxLines: 4,
                        minLines: 1,
                        controller: yazarcontroller,
                        onChanged: (value) async {
                          yazar = value;
                        },
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: yorumController,
                        maxLines: 4,
                        minLines: 1,
                        onChanged: (value) {
                          yorum = value;
                        },
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            border: InputBorder.none,
                            hintText: 'Defterimize yazin...',
                            hintStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        FirebaseFirestore.instance.collection('defter').add({
                          'yorum': yorum,
                          'yazar': yazar,
                          'tarih': DateTime.now()
                        }).then((value) {
                          yorumController.clear();
                        });

                        final data = {'isim': yazar};
                        await insertData(data);
                        await fetchData().then((value) {
                          print(value);
                        });

                        await writeText(yazar!);
                        String baslik2 = await readText();
                        setState(() {
                          baslik = 'Hos Geldiniz,  ' + baslik2;
                        });
                      },
                      child: Text(
                        'Gonder',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(baslik),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 450,
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('defter')
                    .orderBy('tarih', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        if (snapshot.data!.docs.length != 0) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            child: snapshot.data!.docs[index]['yazar'] ==
                                'a'
                                ? Row(
                              children: [
                                Spacer(),
                                ChatBubble(
                                  clipper: ChatBubbleClipper4(
                                      type: BubbleType.sendBubble),
                                  backGroundColor: Colors.green,
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: MediaQuery.of(context)
                                          .size
                                          .width *
                                          0.7,
                                    ),
                                    child: Text(
                                      snapshot.data!.docs[index]
                                      ['yorum'],
                                      style: TextStyle(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection('defter')
                                          .doc(snapshot
                                          .data!.docs[index].id)
                                          .delete();
                                    },
                                    icon: Icon(Icons.delete)),
                              ],
                            )
                                : Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(snapshot.data!.docs[index]
                                ['yazar']),
                                SizedBox(
                                  height: 10,
                                ),
                                ChatBubble(
                                  clipper: ChatBubbleClipper2(
                                      type:
                                      BubbleType.receiverBubble),
                                  backGroundColor: Colors.green,
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: MediaQuery.of(context)
                                          .size
                                          .width *
                                          0.7,
                                    ),
                                    child: Text(
                                      snapshot.data!.docs[index]
                                      ['yorum'],
                                      style: TextStyle(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Center(
                            child: CupertinoActivityIndicator(),
                          );
                        }
                      })
                      : SizedBox();
                }),
          )
        ],
      ),
    );
  }
}
