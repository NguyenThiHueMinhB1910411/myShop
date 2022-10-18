import 'package:flutter/material.dart';
import 'package:myshop/ui/Screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
//  const MyApp({super.key});
  const MyApp({Key? Key}) : super(key: Key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsManager(),
        ),

        //LAB4 buoc 2,3
        ChangeNotifierProvider(
          create: (ctx) =>CartManager(),
        ),
        // LAB4 buoc 4
        ChangeNotifierProvider(
          create: (ctx) => OrdersManager(),
        ),
      ],
      child: MaterialApp(
        title: 'My Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
          ).copyWith(
            secondary: Colors.deepOrange,
          ),
        ),
        //lab1 hinh 1
        // home: SafeArea(
        //   child: ProductDetailScreen(
        //     ProductsManager().items[0],
        //   ),
        // ),
// lab1 hinh 2,3
        // home: const SafeArea(
        //    //child: ProductOverviewScreen(),
        //   child: UserProductsScreen(),
        //  ),
//lab2, hinh 1
        // home: const SafeArea(
        //   child: CartScreen(),
        // ),
//lab2 , hinh 2
        //
//lab2 , hinh3
        home: const ProductOverviewScreen(),
        routes: {
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrdersScreen.routeName: (ctx) => const OrdersScreen(),
          UserProductsScreen.routeName: (ctx) => const UserProductsScreen(),
        },

        onGenerateRoute: (settings) {
          if (settings.name == ProductDetailScreen.routeName) {
            final productId = settings.arguments as String;
            return MaterialPageRoute(
              builder: (ctx) {
                return ProductDetailScreen(
                  ctx.read<ProductsManager>().findById(productId),
                  // ProductsManager().findById(productId));
                );
              },
            );
          }
          if(settings.name == EditProductScreen.routeName){
            final productId = settings.arguments as String?;
            return MaterialPageRoute(
              builder: (ctx){
                return EditProductScreen(
                  productId != null
                  ? ctx.read<ProductsManager>().findById(productId)
                  : null,
          );
        },
      );
    }
          
          return null;
        },
      ),
    );
  }
}
