import 'package:flutter/material.dart';
import '../models/employees.dart';
import '../utils/services.dart';

class Home extends StatefulWidget {
  final String title = "Flutter SQL";

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  List<Employee> _employees = [];
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  Employee _selectedEmployee = Employee();
  bool _isUpdating = false;
  String _titleProgress = "";

  @override
  void initState() {
    super.initState();

    _titleProgress = widget.title;
    _getEmployees();
  }

  _showProgress(String message) {
    setState(() {
      _titleProgress = message;
    });
  }

  _createTable() {
    _showProgress('Creating the table to hold data!');

    Services.createTable().then((result) {
      if (result == 'success') {
        showSnackBar(context, result);
        _getEmployees();
      }
    });
  }

  _addEmployee() {
    if (_firstNameController.text.trim().isEmpty || _lastNameController.text.trim().isEmpty) {
      return;
    }

    _showProgress('Adding employee to dump!');

    Services.addEmployee(_firstNameController.text, _lastNameController.text).then((result) {
      if (result == 'success') {
        _getEmployees();
      }
      _clearValues();
    });
  }

  _getEmployees() {
    _showProgress('Loading employees from warehouse!');

    Services.getEmployees().then((employees) {
      setState(() {
        _employees = employees;
      });

      _showProgress(widget.title);
    });
  }

  _deleteEmployee(Employee employee) {
    _showProgress('Deleting employee from store!');

    Services.deleteEmployee(employee.ID).then((result) {
      if (result == 'success') {
        setState(() {
          _employees.remove(employee);
        });
        
        _getEmployees();
      }
    });
  }

  _updateEmployee(Employee employee) {
    _showProgress('Updating employee in our custody!');

    Services.updateEmployee(employee.ID, _firstNameController.text, _lastNameController.text).then((result) {
      if (result == 'success') {
        _getEmployees();

        setState(() {
          _isUpdating = false;
        });

        _firstNameController.text = '';
        _lastNameController.text = '';
      }
    });
  }

  _setValues(Employee employee) {
    _firstNameController.text = employee.firstName.toString();
    _lastNameController.text = employee.lastName.toString();
    
    setState(() {
      _isUpdating = true;
    });
  }

  _clearValues() {
    _firstNameController.text = '';
    _lastNameController.text = '';
  }

  SingleChildScrollView _dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(
              label: Text("ID"),
              numeric: false
            ),
            DataColumn(
                label: Text("FIRST NAME"),
                numeric: false
            ),
            DataColumn(
                label: Text("LAST NAME"),
                numeric: false
            ),
            DataColumn(
                label: Text("ACTIONS"),
                numeric: false
            ),
          ],
          rows: _employees.map((employee) => DataRow(
            cells: [
              DataCell(
                Text(employee.ID.toString()),
                onTap: () {
                  _setValues(employee);
                  _selectedEmployee = employee;
                }
              ),
              DataCell(
                Text(employee.firstName.toString().toUpperCase()),
                onTap: () {
                  _setValues(employee);
                  _selectedEmployee = employee;
                }
              ),
              DataCell(
                Text(employee.lastName.toString().toUpperCase()),
                onTap: () {
                  _setValues(employee);
                  _selectedEmployee = employee;
                }
              ),
              DataCell(
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteEmployee(employee);
                  },
                ),
                onTap: () {}
              )
            ]
          )).toList()
        )
      )
    );
  }

  showSnackBar(context, message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleProgress),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _createTable();
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _getEmployees();
            }
          )
        ]
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _firstNameController,
                decoration: InputDecoration.collapsed(hintText: "First Name")
              )
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _lastNameController,
                decoration: InputDecoration.collapsed(hintText: "Last Name")
              )
            ),
            _isUpdating ? Row(
              children: <Widget>[
                OutlinedButton(
                  child: Text('UPDATE'),
                  onPressed: () {
                    _updateEmployee(_selectedEmployee);
                  }
                ),
                OutlinedButton(
                  child: Text('CANCEL'),
                  onPressed: () {
                    setState(() {
                      _isUpdating = false;
                    });
                 
                    _clearValues();
                  }
                )
              ]
            ) : Container(),
            Expanded(
              child: _dataBody()
            )
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addEmployee();
        },
        child: Icon(Icons.add)
      )
    );
  }
}