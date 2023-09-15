import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class ToDo {
  // ignore: non_constant_identifier_names
  String? Topic;
  // ignore: non_constant_identifier_names
  String? Time;
  ToDo(this.Topic, this.Time);
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  // ignore: non_constant_identifier_names
  List<ToDo> To_Do = [
    ToDo("Communication Systems Quiz", "10:00 AM"),
    ToDo("OS Report", "11:00 AM"),
    ToDo("Buy some stuff", "1:00 PM"),
    ToDo("Go to the Gym", "2:00 PM"),
    ToDo("Flutter Task", "4:00 PM"),
    ToDo("Flutter Task بردو", "6:00 PM"),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: const Color(0xff4368FF),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: const Text(
                "Todo List",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
              centerTitle: true,
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: To_Do.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${To_Do[index].Topic}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                    subtitle: Text("${To_Do[index].Time}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        )),
                    trailing: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  title: const Text(
                                    "Delete",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  content: const Text(
                                    "Are you sure you want to delete this item?",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "Cancel",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          To_Do.removeAt(index);
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "Yes",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.red),
                                        ))
                                  ]);
                            });
                      },
                      icon: const Icon(Icons.delete_outline),
                      color: Colors.white,
                      iconSize: 30,
                    ),
                  );
                },
              ),
            )));
  }
}
