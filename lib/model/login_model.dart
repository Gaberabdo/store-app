class LoginModel {
  LoginModel({
    required this.status,
    required this.message,
    required this.data,
  });
  late final bool status;
  late final String message;
  late final Data? data;

  factory LoginModel.fromJson(jsonData) {
    return LoginModel(
        status: jsonData['status'],
        message: jsonData['message'],
        data: jsonData['data'] == null
            ? null
            : Data.fromJson(jsonData['data']));
  }

}

class Data {
  Data({
    required this.name,
    required this.id,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });
  late final int id;
  late final String name;
  late final String email;
  late final String phone;
  late final String image;
  late final int points;
  late final int credit;
  late final String token;

  factory Data.fromJson(jsonData) {
    return Data(
      name: jsonData['name'],
      email: jsonData['email'],
      phone: jsonData['phone'],
      id: jsonData['id'],
      image: jsonData['image'],
      token: jsonData['token'],
      points: jsonData['points'],
      credit: jsonData['credit'],
    );
  }
}