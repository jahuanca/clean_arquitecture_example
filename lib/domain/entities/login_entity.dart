
class LoginEntity{
  LoginEntity({
        this.profile,
        this.document,
        this.password,
    });

    int profile;
    String document;
    String password;

  Map<String, dynamic> toJson() => {
    "profile" : profile,
    "document" : document,
    "password" : password,
  };

  factory LoginEntity.fromJson(Map<String, dynamic> json) => LoginEntity(
      profile: json["profile"],
      document: json["document"],
      password: json["password"]
    );
  

}