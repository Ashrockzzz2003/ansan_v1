class UserModel {
   String userName;
   String occupation;
   String phoneNumber;
   String age;
   String gender;
   String address;
   String uID;
   String createdAt;

  UserModel({
      required this.userName,
      required this.occupation,
      required this.phoneNumber,
      required this.age,
      required this.gender,
      required this.address,
      required this.createdAt,
      required this.uID,
  });

  // From Map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userName: map["userName"] ?? "",
      occupation: map["occupation"] ?? "",
      phoneNumber: map["phoneNumber"] ?? "",
      age: map["age"] ?? "",
      gender: map["gender"] ?? "",
      address: map["address"] ?? "",
      uID: map["uID"] ?? "",
      createdAt: map["createdAt"] ?? "",
    );
  }

  // To Map
  Map<String, dynamic> toMap() {
    return {
      "userName": userName,
      "occupation": occupation,
      "phoneNumber": phoneNumber,
      "age": age,
      "gender": gender,
      "address": address,
      "uID": uID,
      "createdAt": createdAt,
    };
  }

}