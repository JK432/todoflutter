import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/Provider/todoprovider.dart';
import 'package:todoapp/Utils/colors.dart';
import 'addtask.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddTaskForm(),
          ));
        },
        child: Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Palette.grad1green, Palette.grad2green],
              ),
              borderRadius: BorderRadius.circular(50)),
          child: const Icon(
            Icons.add_reaction_rounded,
            size: 30,
            color: Palette.textwhite,
          ),
        ),
      ),
      // appBar: AppBar(backgroundColor: Palette.background,),
      body: Consumer<TodoProvider>(
        builder: (context,value,child){
          print(value.todolist);
          return Column(
            children: [
              Container(
                child: Center(child: Text(value.todolist.length.toString(),style: TextStyle(fontSize: 50,fontWeight: FontWeight.w600,color: Palette.textwhite),),),
                decoration: const BoxDecoration(
                  color: Palette.container,
                  gradient: LinearGradient(
                    colors: [Palette.grad1green, Palette.grad2green],
                  ),
                ),
                height: 200,
              ),
              Container(
                height: 500,
                child: ListView.builder(
                  itemCount: value.todolist.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration:  BoxDecoration(
                              color: Palette.container,
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                              colors: [Palette.grad1green, Palette.grad2green],
                              ),
                              ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(value.todolist[index].action,style: TextStyle(fontSize: 20),),
                      ),),
                  ) ,),
              )
            ],
          );
        },
      ),
    );
  }
}
