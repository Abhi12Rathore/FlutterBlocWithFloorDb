
class Recipient{

  String? name;
  String? profileImage;
  String? accountNumber;

  Recipient(this.name, this.profileImage, this.accountNumber);

  Recipient.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        profileImage = json['profileImage'],
        accountNumber = json['accountNumber'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'profileImage': profileImage,
      'accountNumber': accountNumber,

    };
  }
}