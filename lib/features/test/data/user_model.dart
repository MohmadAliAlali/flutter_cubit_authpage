class UserModel {
  final int id;
  final String name;
  final String email;

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'];
}