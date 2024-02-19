class Account{
  int accountID;
  String userName;
  String email;
  String pwd;
  String gender;
  int weight;
  int height;
  int role;
  DateTime birthDate;

  Account({
    required this.accountID,
    required this.userName,
    required this.email,
    required this.pwd,
    required this.gender,
    required this.weight,
    required this.height,
    required this.role,
    required this.birthDate,
  });

  factory Account.fromJson(Map<String, dynamic> json){
    DateTime date = json['birthDate'] == null? DateTime.now() : DateTime.parse(json['birthDate'] as String);
    return Account(accountID: json['accountID'] as int, userName: json['userName'] as String, email: json['email'] as String, pwd: json['pwd'] as String, gender: ['gender'] as String, weight: json['weight'] as int, height: json['height'] as int, role: json['role'] as int, birthDate: json['birthDate'] as DateTime);
  }

  Map<String, dynamic> toJson(){
    return{
      "accountID":accountID,
      "userName":userName,
      "email":email,
      "pwd":pwd,
      "gender":gender,
      "weight":weight,
      "height":height,
      "role":role,
      "birthDate":birthDate,
    };
  }
}