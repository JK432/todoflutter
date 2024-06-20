import 'package:flutter/material.dart';
import '../model/todo.dart';


class TodoProvider extends ChangeNotifier{
  List <Todo> _todolist = [];
  List <Todo> get todolist => _todolist;

  void addTodo(Todo todo){
    _todolist.add(todo);
    notifyListeners();
  }
}

