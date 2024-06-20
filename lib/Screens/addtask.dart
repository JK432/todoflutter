import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/Provider/todoprovider.dart';
import 'package:todoapp/model/todo.dart';
import '../Utils/colors.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({super.key});

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}
GlobalKey<FormState> addForm = GlobalKey();
Todo todo = Todo(action: "", dueDate: DateTime.now());
class _AddTaskFormState extends State<AddTaskForm> {
  @override
  Widget build(BuildContext context) {
    TodoProvider todoProvider = Provider.of(context,listen: false);
    return  Scaffold(
      backgroundColor: Palette.background,
body: SingleChildScrollView(
  child: Column(
    children: [
      const SizedBox(height: 50,),
      const Text("Add Todo",style: TextStyle(color: Palette.textd,fontSize: 35),),
      Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          // decoration: BoxDecoration(color: Colors.cyanAccent),
          child: Form(
          key: addForm,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: "Action"),
                  initialValue: "",
                  validator: (input) {
                    if (input == null || input.isEmpty) {
                      return 'Please enter the Action';
                    } else {
                      todo = Todo(action: input, dueDate: DateTime.now());
                    }
                    return null;
                  },
  
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: (){
                  if(addForm.currentState!.validate()){
                    todoProvider.addTodo(todo);
                    Navigator.of(context).pop();
                  }

  
                },
                child: Container(
                  decoration: BoxDecoration(   gradient: const LinearGradient(
                    colors: [Palette.grad1green, Palette.grad2green],
                  ),borderRadius: BorderRadius.circular(50) ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 8.0,right:15 ,left: 15,bottom:8.0 ),
                    child: Text("Submit",style: TextStyle(fontSize: 18,color: Palette.textwhite),),
                  ),),
              )
            ],
          )),
          ),
      ),
    ],
  ),
),
    );
  }
}
