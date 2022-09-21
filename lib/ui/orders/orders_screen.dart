import 'package:flutter/material.dart';
import 'order_manager.dart';
import 'order_item_card.dart';

//
import '../orders/order_manager.dart';

import '../../models/order_item.dart';
// import '../../ui/orders/orders_screen.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('building orders');
    final ordersManager = OrdersManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      body: ListView.builder(
        itemCount: ordersManager.orderCount,
        itemBuilder: (ctx, i) => OrderItemCard(ordersManager.orders[i]),
      ),
    );
  }
}
