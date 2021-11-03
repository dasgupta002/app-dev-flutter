import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/employees.dart';

class Services {
  static const ROOT = 'http://3721-116-206-222-51.ngrok.io/backend/server.php';

  static const String _GET = 'GET_ALL';
  static const String _CREATE = 'CREATE_TABLE';
  static const String _ADD = 'ADD_EMPLOYEE';
  static const String _UPDATE = 'UPDATE_EMPLOYEE';
  static const String _DELETE = 'DELETE_EMPLOYEE';

  static Future<List<Employee>> getEmployees() async {
    try {
      var map = new Map<String, dynamic>();
      map["action"] = _GET;

      final response = await http.post(Uri.parse(ROOT), body: map);

      if (response.statusCode == 200) {
        List<Employee> list = parseData(response.body);
        return list;
      } else {
        throw [];
      }
    } catch (error) {
      return [];
    }
  }

  static List<Employee> parseData(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Employee>((json) => Employee.fromJson(json)).toList();
  }

  static Future<String> createTable() async {
    try {
      var map = new Map<String, dynamic>();
      map["action"] = _CREATE;

      final response = await http.post(Uri.parse(ROOT), body: map);

      return response.body;
    } catch (error) {
      return 'error';
    }
  }

  static Future<String> addEmployee(String firstName, String lastName) async {
    try {
      var map = new Map<String, dynamic>();
      map["action"] = _ADD;

      map["first_name"] = firstName;
      map["last_name"] = lastName;

      final response = await http.post(Uri.parse(ROOT), body: map);

      return response.body;
    } catch (error) {
      return 'error';
    }
  }

  static Future<String> updateEmployee(
      String? employeeID, String firstName, String lastName) async {
    try {
      var map = new Map<String, dynamic>();
      map["action"] = _UPDATE;

      map["employee_key"] = employeeID;
      map["first_name"] = firstName;
      map["last_name"] = lastName;

      final response = await http.post(Uri.parse(ROOT), body: map);

      return response.body;
    } catch (error) {
      return 'error';
    }
  }

  static Future<String> deleteEmployee(String? employeeID) async {
    try {
      var map = new Map<String, dynamic>();
      map["action"] = _DELETE;

      map["employee_key"] = employeeID;

      final response = await http.post(Uri.parse(ROOT), body: map);

      return response.body;
    } catch (error) {
      return 'error';
    }
  }
}
