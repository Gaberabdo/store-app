class ProfileModel {
  final bool status;
  final Profile? data;
  ProfileModel({required this.status, required this.data});

  factory ProfileModel.fromJson(jsonData) {
    return ProfileModel(
        status:jsonData['status'],
        data: jsonData['data'] == null ? null : Profile.fromJson(jsonData['data']));
  }
}

class Profile {
  final String email;
  final String phone;
  final int points;
  final int credit;
  final String token;
  final int id;
  final String image;
  final String name;

  Profile(
      {required this.id,
      required this.name,
      required this.token,
      required this.phone,
      required this.credit,
      required this.image,
      required this.email,
      required this.points,
      });
  factory Profile.fromJson(jsonData) {
    return Profile(
      id: jsonData['id'],
      name: jsonData['name'],
      token: jsonData['token'],
      phone: jsonData['phone'],
      image: jsonData['image'],
      points: jsonData['points'],
      credit: jsonData['credit'],
      email: jsonData['email'],
    );
  }
}
