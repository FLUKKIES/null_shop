class User {
  final String uid;
  final String email;
  final String username;
  // ....? เป็น null ได้
  final String? role;
  final String? phone;
  final String? address;
  double? coin;

  User(
      {required this.uid,
      required this.email,
      required this.username,
      this.role,
      this.phone,
      this.address,
      this.coin});

  User.formMap({required Map<String, dynamic> userMap})
      : uid = userMap["uid"],
        email = userMap["email"],
        username = userMap["username"],
        role = userMap["role"],
        phone = userMap["phone"],
        address = userMap["address"],
        coin = userMap["coin"];

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'email': email,
        'username': username,
        // ?? if left value is null, Will use value right side.
        'role': role ?? "",
        'phone': phone ?? "",
        'address': address ?? "",
        'coin': coin ?? 0
      };
}

// final Map<String,String> userInfo = {
//   "uid" : "123",
//   "email" : "123@gmail",
//   "username": "Fluke"
// };
