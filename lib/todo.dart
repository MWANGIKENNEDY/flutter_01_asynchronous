import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class Todo{

  int id;
  int userId;
  bool completed;
  String title;

  Todo({required this.id, required this.userId, required this.completed, required this.title});


  factory Todo.myConstructor(Map<String,dynamic> jsonData){
    return Todo(id: jsonData['id'], userId: jsonData['userId'], completed: jsonData['completed'], title: jsonData['title']);
  }

}