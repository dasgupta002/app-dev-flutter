class Employee {
  String? ID;
  String? firstName;
  String? lastName;

  Employee({ this.ID, this.firstName, this.lastName });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      ID: json['ID'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
    );
  }
}