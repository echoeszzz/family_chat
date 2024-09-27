enum ProfileImgSize { small, medium, large }

class ProfileModel {
  final int id;
  final String fullName;
  final String username;
  final String description;
  final DateTime birthDate;
  final String imgURL;

  ProfileModel({
    required this.id,
    required this.fullName,
    required this.username,
    required this.description,
    required this.birthDate,
    required this.imgURL,
  });

  @override
  String toString() {
    return "ProfileModel(id: $id, fullName: $fullName, nickname: $username, "
        "description: $description, birthDate: $birthDate, imgURL: $imgURL)";
  }
}
