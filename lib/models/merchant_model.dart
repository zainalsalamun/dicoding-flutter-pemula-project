class MerchantModel {
  int id;
  String firstName;
  String lastName;
  String email;
  String posId;
  String sellerId;
  bool active;
  bool deleted;
  String posName;
  String posCity;
  bool allowPointTransfer;

  MerchantModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.posId,
    this.sellerId,
    this.active,
    this.deleted,
    this.posName,
    this.posCity,
    this.allowPointTransfer,
  });

  MerchantModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    posId = json['posId'];
    sellerId = json['sellerId'];
    active = json['deleted'];
    deleted = json['deleted'];
    posName = json['posName'];
    posCity = json['posCity'];
    allowPointTransfer = json['allowPointTransfer'];
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'posId': posId,
      'sellerId': sellerId,
      'deleted': deleted,
      'active': active,
      'posName': posName,
      'posCity': posCity,
      'allowPointTransfer': allowPointTransfer,
    };
  }
}

class UninitializedMerchanttModel extends MerchantModel {}
