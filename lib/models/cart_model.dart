class CartModel {
  String? id;
  String? uid;
  // CartItemModel? cartItemModel;
  String? location;
  String? estimatedTime;
  String? paymentMethod;
  int? subTotal;
  int? total;

  CartModel({
    this.id,
    this.uid,
    this.location,
    this.estimatedTime,
    this.paymentMethod,
    this.subTotal,
    this.total,
  });
}

class CartItemModel {
  String? dishImageUrl;
  String? dishName;
  int? dishPrice;
  String? size;
  int? quantity;
  int? cheese;
  bool? onion;
  bool? bacon;
  bool? beef;

  CartItemModel({
    this.dishImageUrl,
    this.dishName,
    this.dishPrice,
    this.size,
    this.quantity,
    this.cheese,
    this.onion,
    this.bacon,
    this.beef,
  });
}
