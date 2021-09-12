import 'package:flutter/material.dart';
import 'package:hello/todo.dart';
import 'package:hello/todo_service.dart';

void main()=>runApp(MaterialApp(
  title: 'Flutter Demo',
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
  home: Home(),
));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TodoService todoService=TodoService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todoService.getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Async data testing"),
      backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: todoService.getData(),
          builder: (BuildContext context,AsyncSnapshot<List<Todo>> snapshot){

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            else if(snapshot.hasData){
              var myTodos = snapshot.data;
              return ListView(
                children: myTodos!.map((todos) => ListTile(
                  leading: FlutterLogo(),
                  title: Text(todos.title),
                  subtitle: Text(todos.userId.toString()+"=>"+todos.id.toString()),
                  trailing: Text(todos.completed.toString()),
                )).toList(),
              );
            }
            else{
              return Text("No data found");
            }
            },
        ),
      ),
    );
  }
}



