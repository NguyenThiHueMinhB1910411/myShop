import 'package:flutter/material.dart';
import 'package:myshop/ui/cart/cart_manager.dart';
import 'package:myshop/ui/shared/app_drawer.dart';
import 'package:provider/provider.dart';
import 'products_grid.dart';

import "../cart/cart_screen.dart";
import 'top_right_badge.dart';

enum FilterOption { favorites, all }

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: <Widget>[
          buildProductFilterMenu(),
          buildShoppingCartIcon(),
        ],
      ),
      drawer: const AppDrawer(),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
//lab2 hinh 1,2,3
  // Widget buildShoppingCartIcon() {
  //   return IconButton(
  //     icon: const Icon(
  //       Icons.shopping_cart,
  //     ),
  //     onPressed: () {
  //       // print('Go to cart screen');
  //       Navigator.of(context).pushNamed(CartScreen.routerName);
  //     },
  //   );
  // }

  //lab2 hinh 4
  // Widget buildShoppingCartIcon() {
  //   return TopRightBadge(
  //     data: CartManager().productCount,
  //     child: IconButton(
  //       icon: const Icon(
  //         Icons.shopping_cart,
  //       ),
  //       onPressed: () {
  //         Navigator.of(context).pushNamed(CartScreen.routeName);
  //       },
  //     ),
  //   );
  // }

  Widget buildShoppingCartIcon() {
    return Consumer<CartManager>(
      builder: (ctx, cartManager, child) {
        return TopRightBadge(
          data: cartManager.productCount,
          child: IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              Navigator.of(ctx).pushNamed(CartScreen.routeName);
            },
          ),
        );
      },
    );
  }

  Widget buildProductFilterMenu() {
    return PopupMenuButton(
      onSelected: (FilterOption selectedValue) {
        setState(() {
          if (selectedValue == FilterOption.favorites) {
            _showOnlyFavorites = true;
          } else {
            _showOnlyFavorites = false;
          }
        });
      },
      icon: const Icon(
        Icons.more_vert,
      ),
      itemBuilder: (ctx) => [
        const PopupMenuItem(
          value: FilterOption.favorites,
          child: Text('Only Favorites'),
        ),
        const PopupMenuItem(
          value: FilterOption.all,
          child: Text('Show All'),
        ),
      ],
    );
  }
}
