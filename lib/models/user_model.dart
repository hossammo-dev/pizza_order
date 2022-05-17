class UserModel {
  String? uid;
  String? username;
  String? email;
  String? phoneNumber;

  UserModel({this.uid, this.email, this.phoneNumber, this.username});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    username = json['username'];
    email = json['email'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'username': username,
        'email': email,
        'phone_number': phoneNumber,
      };
}
