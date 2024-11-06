class User {
  final String id;
  final String name;
  final String email;
  final int age;

  User({required this.id, required this.name, required this.email, required this.age});

  // JSON 데이터를 User 객체로 변환
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      age: json['age'],
    );
  }

  // User 객체를 JSON으로 변환
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'age': age,
    };
  }
}
