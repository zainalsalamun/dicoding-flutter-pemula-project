class UserModel {
  int id;
  String firstName;
  String lastName;
  String birthDate;
  String phone;
  String gender;
  String plainPassword;
  bool agreement1;
  String email;
  String username;
  String profilePhotoUrl;
  String token;

  UserModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.birthDate,
      this.phone,
      this.gender,
      this.plainPassword,
      this.agreement1,
      this.email,
      this.username,
      this.profilePhotoUrl,
      this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    birthDate = json['birthDate'];
    phone = json['phone'];
    gender = json['gender'];
    plainPassword = json['plainPassword'];
    agreement1 = json['agreement1'];
    username = json['username'];
    email = json['email'];
    profilePhotoUrl = json['profile_photo_url'];
    token = json['token'];

    // ignore: unused_element
    Map<String, dynamic> toJson() {
      return {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'birthDate': birthDate,
        'phone': phone,
        'plainPassword': plainPassword,
        'agreement': agreement1,
        'username': username,
        'email': email,
        'profile_photo_url': profilePhotoUrl,
        'token': token,
      };
    }
  }
}
