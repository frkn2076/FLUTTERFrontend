import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterfrontend/business/textValidator.dart';
import 'package:flutterfrontend/util/API.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'util/caller.dart';
import 'models/todosResponse.dart';

void main() {
  runApp(MyApp(client: Caller()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.client}) : super(key: key);
  final API client; 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page', client: client),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title, required this.client}) : super(key: key);
  final API client;
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<TodosResponse> _futureTodos;

  @override
  void initState() {
    _futureTodos = widget.client.getTodos();
    super.initState();
  }

  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              TextField(
                key: Key("Item-Name"),
                controller: _nameController,
                decoration: new InputDecoration(hintText: "Eklemek istediğiniz Todo Itemi giriniz..."),
              ),
              TextButton(
                key: Key("Item-Button"),
                onPressed: () {
                  if (TextValidator().isLengthEnough(_nameController.text)) {
                    widget.client.addTodo(_nameController.text).then((value) => setState(() {
                          _futureTodos = widget.client.getTodos();
                          _nameController.text = "";
                        }));
                  } else {
                    _popup(context);
                  }
                },
                child: Icon(Icons.add),
              ),
              FutureBuilder<TodosResponse>(
                key: Key("Item-List"),
                future: _futureTodos,
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data?.isError == false) {
                    return DataTable(
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Text('Todo Itemler',
                                style: TextStyle(fontWeight: FontWeight.bold)
                                ,),
                          ),
                        ],
                        rows: snapshot.data!.todos!
                            .sublist(snapshot.data!.todos!.length > 5 ? snapshot.data!.todos!.length - 5 : 0)
                            .map((todo) => DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      Text(
                                        todo.toString(),
                                      ),
                                    ),
                                  ],
                                ))
                            .toList());
                  } else if (snapshot.hasData &&
                      snapshot.data?.isError == true) {
                    _popup(context);
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
              TextButton(
                key: Key("DeleteAll-Button"),
                child: Text("Delete All"),
                onPressed: () {
                  API.items = [];
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _popup(BuildContext context) {
    Alert(
        context: context,
        title: 'İtem isminin uzunluğu 2den küçük olamaz.',
        buttons: [
          DialogButton(
            onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
            child: Text(
              'Tamam',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }
}
