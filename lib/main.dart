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
  const EmployeeApp({super.key});

  @override
  EmployeeAppState createState()=> EmployeeAppState();
  }

  class EmployeeAppState extends State<EmployeeApp>{
    final List<Employee> emploies =[];
    final TextEditingController nameController = TextEditingController();
    final TextEditingController ageController = TextEditingController();
    final TextEditingController salaryController = TextEditingController();

    void addEmployee(){
      String name= nameController.text;
      int? age= int.tryParse(ageController.text);
      double? salary= double.tryParse(salaryController.text);

      if (name.isNotEmpty && age!= null && salary!=null){
        setState((){
          emploies.add(Employee(name: name, age: age, salary: salary));
        });
        nameController.clear();
        ageController.clear();
        salaryController.clear();
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
                   controller: nameController,
                   decoration: InputDecoration(labelText: "Name"),
                ),

          TextField(
            controller: ageController,
            decoration: InputDecoration(labelText: "Age"),
            keyboardType: TextInputType.number,
          ),

          TextField(
            controller: salaryController,
            decoration: InputDecoration(labelText: "Salary"),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 10,),
          ElevatedButton(
            onPressed: addEmployee,
            child: Text("Add Employee"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: emploies.length,
              itemBuilder: (context, index){
                final employee = emploies[index];
                return ListTile(

                  title: Text(employee.name),
                  subtitle: Text('Age: ${employee.age}, Salary:${employee.salary}'),
                );
              },
              ),
          ),
            ],
          ),
          ),
        ),
      );
    }

  }