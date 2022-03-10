class Account{
  String? username;
  String? email;
  String? phone;
  String? password;
  Account({this.username,this.email,this.phone,this.password});
  Account.fromJson(Map<String, dynamic> json)
  : username = json['username'],
    email = json['email'],
    phone = json['phone'],
    password = json['password'];

  Map<String, dynamic> toJson() => {
    'username' : username,
    'email' : email,
    'phone' : phone,
    'password' : password
  };

}