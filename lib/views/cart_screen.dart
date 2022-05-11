import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      onPressed: () {},
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
                    itemCount: 10,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => ListTile(
                      minVerticalPadding: 16,
                      leading: Card(
                        color: Colors.white,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Image.network(
                            'https://images.phi.content-cdn.io/cdn-cgi/image/height=170,width=180,quality=50/https://martjackamstorage.azureedge.net/am-resources/c3877a59-69f7-40fa-bb17-ae5b9ac37732/Images/ProductImages/Large/Margherita-p1.png'),
                      ),
                      title: const Text('Spicy Chicken Ranch'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('x2 cheese'),
                          Text('x1 olives'),
                        ],
                      ),
                      trailing: const Text('EGP 105'),
                    ),
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
                              title: 'Egypt, Damietta, New Damietta',
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
                      children: const [
                        Text(
                          'Subtotal',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'EGP 1050',
                          style: TextStyle(
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
                      children: const [
                        Text(
                          'Total',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'EGP 1060',
                          style: TextStyle(
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
                        onPressed: () {},
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
