class UserModel {
  final String uid;
  final String name;
  final String email;
  final String department;
  final List<String> interests;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.department,
    required this.interests,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'department': department,
      'interests': interests,
    };
  }

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      department: map['department'] ?? 'unknown',
      interests: List<String>.from(map['interests']),
    );
  }
}