class VoucherModel {
  int id;
  String name;
  String imageUrl;
  bool isPopular;

  VoucherModel({this.id, this.imageUrl, this.name, this.isPopular = false});
}
