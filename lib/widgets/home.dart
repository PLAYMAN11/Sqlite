import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../db/planetas.dart';
import '../db/sqlite.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Planetas>? planets;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    planets = [];
    openDB();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    closeDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Builder(
          builder: (context) {
            consultar();
            if (planets!.isEmpty) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                  backgroundColor: Colors.black87,
                ),
              );
            } else {
              return ListView.builder(
                itemCount: planets!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: CupertinoListTile(
                      leading: Icon(CupertinoIcons.circle),
                      title: Text(planets![index].nombre!),
                      subtitle: Text("Distancia al sol ${planets![index].distSol!}"),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  void openDB() {
    Sqlite.db().whenComplete((){
      add();
    },);
  }

  void closeDB() {}

  void consultar() {}
  Future<void> add()async{
    List<Planetas> p = [
      Planetas(1, "Mercurio", 2, 2.5),
      Planetas(2, "Venus", 2.4, 3),
      Planetas(3, "Tierra", 9, 4),
      Planetas(4, "Marte", 14, 20),
      Planetas(5, "Jupiter", 20, 25),
      Planetas(6, "Saturno", 25, 22),
    ];
    int result =0;
   await Sqlite.add(p);
  }
}
