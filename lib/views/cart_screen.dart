import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:pizza_order/providers/cart_provider.dart';
import 'package:pizza_order/services/location_services.dart';
import 'package:pizza_order/shared/shared.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Your',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Cart',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        EvaIcons.close,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                //BODY: ORDERS
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    itemCount: Provider.of<CartProvider>(context, listen: true)
                        .cartList
                        .length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final _cartItemsList =
                          Provider.of<CartProvider>(context, listen: false)
                              .cartList
                              .values
                              .toList()[index];
                      return ListTile(
                        minVerticalPadding: 16,
                        leading: Card(
                          color: Colors.white,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Image.network(_cartItemsList.dishImageUrl!),
                        ),
                        title: Text(_cartItemsList.dishName!),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Size: ${_cartItemsList.size}'),
                            Text('x${_cartItemsList.cheese} cheese'),
                            if (_cartItemsList.onion!) const Text('x1 onion'),
                            if (_cartItemsList.bacon!) const Text('x1 bacon'),
                            if (_cartItemsList.beef!) const Text('x1 beef'),
                          ],
                        ),
                        trailing: Column(
                          children: [
                            Text('EGP ${_cartItemsList.dishPrice}'),
                            const SizedBox(height: 5),
                            Text('${_cartItemsList.quantity.toString()}X'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const Divider(),
                const SizedBox(height: 15),
                //BODY:INFO
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            _buildCardTile(
                              title: Provider.of<LocationServices>(context,
                                      listen: false)
                                  .address,
                              leadingIcon: EvaIcons.pinOutline,
                              onEditPressed: () {},
                            ),
                            const SizedBox(height: 5),
                            _buildCardTile(
                              title: '25-30 min (ASAP)',
                              leadingIcon: EvaIcons.clockOutline,
                              onEditPressed: () {},
                            ),
                            const SizedBox(height: 5),
                            _buildCardTile(
                              title: 'Cash',
                              leadingIcon: EvaIcons.creditCardOutline,
                              onEditPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Subtotal',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'EGP ${_cart.totalPrice}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Delivery fee',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'EGP 10',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'EGP ${_cart.totalPrice + 10}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Center(
                      child: MaterialButton(
                        onPressed: () =>
                            Provider.of<CartProvider>(context, listen: false)
                                .makeOrder(
                                  location: 'Egypt, Damietta, New Damietta',
                                  estimatedTime: '25-30',
                                  paymentMethod: 'cash',
                                )
                                .whenComplete(() => navigateAndRemove(context,
                                    page: const HomeScreen())),
                        elevation: 7.5,
                        color: const Color(0xFFFFC56B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        minWidth: 300,
                        padding: const EdgeInsets.all(16),
                        child: const Text(
                          'Place Order',
                          style: TextStyle(
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardTile(
          {String? title,
          IconData? leadingIcon,
          VoidCallback? onEditPressed}) =>
      ListTile(
        leading: Icon(
          leadingIcon,
          color: Colors.grey,
        ),
        title: Text('$title'),
        trailing: IconButton(
          onPressed: onEditPressed,
          icon: const Icon(
            EvaIcons.editOutline,
            color: Colors.black,
          ),
        ),
      );
}
