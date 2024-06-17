import 'package:flutter/material.dart';
import 'package:todoapp/model/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TodoScreen(),
    );
  }
}

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

GlobalKey<FormState> simpleform = GlobalKey();

class _TodoScreenState extends State<TodoScreen> {
  List<String> activities = [];
  String cruentact = "first value";

  @override
  Widget build(BuildContext context) {
    print(cruentact);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: simpleform,
                child: TextFormField(
                  decoration:
                      const InputDecoration(label: Text("Enter the Activity")),
                  initialValue: cruentact,
                  validator: (val) {
                    if (val != null) {
                      val = val.trim();
                      if (val != "") {
                        activities.add(val);
                        cruentact = val;
                        setState(() {});
                      }
                    } else {
                      return 'Please type a activity';
                    }
                  },
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  if (simpleform.currentState!.validate()) {}
                  simpleform.currentState!.reset();
                },
                child: Text(
                  "Submit",
                  style: TextStyle(fontSize: 25),
                ))
          ],
        ),
      ),
    );
  }
}
