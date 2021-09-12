import 'package:hello/todo.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class TodoService{
  
  Future<List<Todo>> getData() async {
    //make network request

    Uri uri=Uri.https('jsonplaceholder.typicode.com', '/todos');
    http.Response res = await http.get(uri);

    if(res.statusCode == 200){
      List<dynamic> body = jsonDecode(res.body);
      List<Todo> todos=body.map((dynamic item) => Todo.myConstructor(item)).toList();
      return todos;
    }
    else{
      throw "Error getting the data";
    }
  }
  
}