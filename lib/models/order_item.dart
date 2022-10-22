import 'package:myshop/models/cart_item.dart';

class OrderItem {
  final String? id;
  final double amount;
  final List<CartItem> products;
  final DateTime dataTime;

  int get productCount {
    return products.length;
  }

  OrderItem({
    this.id,
    required this.amount,
    required this.products,
    DateTime? dateTime,
  }) : dataTime = dateTime ?? DateTime.now();

  // OrderItem copyWith({
  //   String? id,
  //   double? amount ,
  //   List<CarItem>? products,
  //   DateTime? dateTime,
  // })
  OrderItem copyWith({
    String? id,
    double? amount,
    List<CartItem>? products,
    DateTime? dateTime,
  }) {
    return OrderItem(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      products: products ?? this.products,
      dateTime: dateTime ?? this.dataTime,
    );
  }
}
