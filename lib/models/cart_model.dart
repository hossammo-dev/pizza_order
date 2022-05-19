class CartModel {
  String? id;
  String? uid;
  List<CartItemModel>? cartItemsList;
  String? location;
  String? estimatedTime;
  String? paymentMethod;
  int? total;

  CartModel({
    this.id,
    this.uid,
    this.location,
    this.cartItemsList,
    this.estimatedTime,
    this.paymentMethod,
    this.total,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'uid': uid,
        'location': location,
        'cart_items_list': cartItemsList,
        'estimated_time': estimatedTime,
        'payment_method': paymentMethod,
        'total': total,
      };
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

  Map<String, dynamic> toJson() => {
        'image_url': dishImageUrl,
        'name': dishName,
        'price': dishPrice,
        'size': size,
        'quantity': quantity,
        'cheese': cheese,
        'onion': onion,
        'bacon': bacon,
        'beef': beef,
      };
}
