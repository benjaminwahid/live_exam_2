import 'package:flutter/material.dart';

void main(){
  runApp(EmployeeApp());
}
class Employee {
  String name;
  int age;
  double salary;
  Employee({required this.name,
    required this.age,
    required this.salary,
  });
}
  class EmployeeApp extends StatefulWidget{
  @override
  _EmployeAppState createState()=> _EmployeAppState();
  }

  class _EmployeAppState extends State<EmployeeApp>{
    final List<Employee> emploies =[];
    final TextEditingController nameControler = TextEditingController();
    final TextEditingController ageControler = TextEditingController();
    final TextEditingController salaryControler = TextEditingController();

    void addEmployee(){
      String name= nameControler.text;
      int? age= int.tryParse(ageControler.text);
      double? salary= double.tryParse(salaryControler.text);

      if (name.isNotEmpty && age!= null && salary!=null){
        setState((){
          emploies.add(Employee(name: name, age: age, salary: salary));
        });
        nameControler.clear();
        ageControler.clear();
        salaryControler.clear();
      }
    }

    @override
    Widget build(BuildContext context){
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Add Employee'),),
          body: Padding(
              padding: EdgeInsets.all(15.0),
                  child: Column(
              children: [
                TextField(
              controller: nameControler,
            decoration: InputDecoration(labelText: "Name"),
          ),

          TextField(
            controller: ageControler,
            decoration: InputDecoration(labelText: "Age"),
          ),

          TextField(
            controller: salaryControler,
            decoration: InputDecoration(labelText: "Salary"),
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: addEmployee, child: Text("Add Employee"),),
          Expanded(child: ListView.builder(
              itemCount: emploies.length,
              itemBuilder: (context, index){
                final emploies = emploies[index];
                return ListTile(

                  title: Text(emploies.name),
                  subtitle: Text('Age: ${emploies.age}, Salary:${emploies.salary}'),
                );
              }
              ),
          ),
            ],
          ),
          ),
        ),
      );
    }

  }