class OrderModel {
  String? id;
  String? uid;
  String? dishId;
  String? size;
  int? cheese;
  bool? onion;
  bool? bacon;
  bool? beef;
  DateTime? time;

  OrderModel(
      {this.uid,
      this.id,
      this.dishId,
      this.size,
      this.cheese,
      this.onion,
      this.bacon,
      this.beef,
      this.time});

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['id'],
        uid: json['uid'],
        dishId: json['dish_id'],
        size: json['size'],
        cheese: json['cheese'],
        onion: json['onion'],
        bacon: json['bacon'],
        beef: json['beef'],
        time: json['time'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'uid': uid,
        'dish_id': dishId,
        'size': size,
        'cheese': cheese,
        'onion': onion,
        'bacon': bacon,
        'beef': beef,
        'time': time,
      };
}
