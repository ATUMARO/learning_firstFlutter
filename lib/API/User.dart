
class User {
  final String id;
  final String name;
  final String image;
  final String device_token;
  final String token;

  User({this.id, this.name, this.image, this.device_token, this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        device_token: json['device_token'],
        token: json['token']);
  }
}
