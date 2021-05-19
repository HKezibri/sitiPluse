import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
//import 'dart:async';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DataGrid',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyTablePage(),
    );
  }
}

class MyTablePage extends StatefulWidget {

  @override
  _MyTablePageState createState() => _MyTablePageState();
}


class _MyTablePageState extends State<MyTablePage> {
  List<Employee> _employees;
  EmployeeDataSource _employeeDataSource;
  @override
  void initState(){
    _employees = getEmployeeData();
    _employeeDataSource = EmployeeDataSource(_employees);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          body: SfDataGrid(source: _employeeDataSource,
            columns: [
              GridTextColumn(columnName: 'id', label: Container(padding: EdgeInsets.symmetric(horizontal: 16.0), alignment: Alignment.centerRight,
                child: Text('ID',overflow: TextOverflow.ellipsis,),)),
              GridTextColumn(columnName: 'name', label: Container(padding: EdgeInsets.symmetric(horizontal: 16.0), alignment: Alignment.centerRight,
                child: Text('ID',overflow: TextOverflow.ellipsis,),)),
              GridTextColumn(columnName: 'designation', label: Container(padding: EdgeInsets.symmetric(horizontal: 16.0), alignment: Alignment.centerRight,
                child: Text('ID',overflow: TextOverflow.ellipsis,),)),
              GridTextColumn(columnName: 'salary', label: Container(padding: EdgeInsets.symmetric(horizontal: 16.0), alignment: Alignment.centerRight,
                child: Text('ID',overflow: TextOverflow.ellipsis,),)),

            ],),
        ));
  }

  List<Employee> getEmployeeData() {
    return [
      Employee(10001, 'James', 'Project Lead', 20000),
      Employee(10002, 'Kathryn', 'Manager', 30000),
      Employee(10003, 'Lara', 'Developer', 15000),
      Employee(10004, 'Michael', 'Designer', 15000),
      Employee(10005, 'Martin', 'Developer', 15000),
      Employee(10006, 'Newberry', 'Developer', 15000),
      Employee(10007, 'Balnc', 'Developer', 15000),
      Employee(10008, 'Perry', 'Developer', 15000),
      Employee(10009, 'Gable', 'Developer', 15000),
      Employee(10010, 'Grimes', 'Developer', 15000)
    ];
  }


}

class EmployeeDataSource extends DataGridSource{
  EmployeeDataSource(List <Employee> employees){
    DataGridRows = employees.map<DataGridRow> ((dataGridRow)=> DataGridRow(cells: [
      DataGridCell<int>(columnName: 'id', value: dataGridRow.id),
      DataGridCell<String>(columnName: 'name', value: dataGridRow.name),
      DataGridCell<String>(columnName: 'designation', value: dataGridRow.designation),
      DataGridCell<int>(columnName: 'salary', value: dataGridRow.salary),
    ]))
        .toList();
  }
  late List <DataGridRow>  DataGridRows;
  @override
  List <DataGridRow> get rows => DataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
          return Container(
              child: Text(
                dataGridCell.value.toString(),
              ));
        }).toList());
  }


}

class Employee {
  Employee(this.id, this.name, this.designation, this.salary);
  final int id;
  final String name;
  final String designation;
  final int salary;
}