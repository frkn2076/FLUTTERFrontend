import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'caller.dart';
import 'models/todosResponse.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<TodosResponse> _futureTodos = getTodos();

  @override
  void initState() {
    _futureTodos = getTodos();
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
          width: MediaQuery.of(context).size.width / 10,
          height: MediaQuery.of(context).size.width / 10,
          child: Column(
            children: <Widget>[
              TextField(
                key: Key("Item-Name"),
                controller: _nameController,
              ),
              TextButton(
                onPressed: () {
                  addTodo(_nameController.text).then(
                      (value) => setState(() => _futureTodos = getTodos()));
                },
                child: Icon(Icons.add),
              ),
              Container(
                child: FutureBuilder<TodosResponse>(
                  future: _futureTodos,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data?.isSuccess == true) {
                      return DataTable(
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Text('Item'),
                            ),
                          ],
                          rows: snapshot.data!.todos!
                              .map((todo) => DataRow(
                                    cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          todo.name!.toString(),
                                        ),
                                      ),
                                    ],
                                  ))
                              .toList());
                    } else if (snapshot.hasData &&
                        snapshot.data?.isSuccess == false) {
                      _popup(context);
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
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
