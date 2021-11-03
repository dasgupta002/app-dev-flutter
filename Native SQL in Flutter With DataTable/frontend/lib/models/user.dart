class User {
  String firstName;
  String lastName;

  List<User> users = [];

  User({ required this.firstName, required this.lastName });

  static List<User> getUsers() {
    return <User>[
      User(firstName: "Aaron", lastName: "Jackson"),
      User(firstName: "Ben", lastName: "John"),
      User(firstName: "Carrie", lastName: "Brown"),
      User(firstName: "Deep", lastName: "Sen"),
      User(firstName: "Emily", lastName: "Jane"),
    ];
  }
}