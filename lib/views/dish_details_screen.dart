import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:pizza_order/providers/cart_provider.dart';
// import 'package:pizza_order/providers/main_provider.dart';
import 'package:pizza_order/shared/shared.dart';
import 'package:pizza_order/views/cart_screen.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

import '../models/dish_model.dart';

class DishDetailsScreen extends StatefulWidget {
  final DishModel? dish;
  const DishDetailsScreen({Key? key, this.dish}) : super(key: key);

  @override
  State<DishDetailsScreen> createState() => _DishDetailsScreenState();
}

class _DishDetailsScreenState extends State<DishDetailsScreen> {
  int _currentIndex = 0;

  final _sizes = const [
    'S',
    'M',
    'L',
  ];

  int _cheese = 1;
  int _quantity = 1;
  bool _onion = false;
  bool _bacon = false;
  bool _beef = false;

  void _changeCheeseValue({String? operation}) {
    if (operation == 'i') {
      //increment
      setState(() {
        _cheese++;
      });
    } else {
      //decrement
      if (_cheese > 1) {
        setState(() {
          _cheese--;
        });
      }
    }
  }

  void _changeQuantityValue({String? operation}) {
    if (operation == 'i') {
      //increment
      setState(() {
        _quantity++;
      });
    } else {
      //decrement
      if (_quantity > 1) {
        setState(() {
          _quantity--;
        });
      }
    }
  }

  void _changeIngredients({String? ingredient}) {
    switch (ingredient) {
      case "Onion":
        setState(() {
          _onion = !_onion;
        });
        break;

      case "Bacon":
        setState(() {
          _bacon = !_bacon;
        });
        break;

      case "Beef":
        setState(() {
          _beef = !_beef;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //HEADER
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.network('${widget.dish!.imageUrl}'),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(
                                EvaIcons.close,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: const [
                        Icon(
                          EvaIcons.star,
                          color: Colors.amber,
                        ),
                        SizedBox(width: 3),
                        Text(
                          '4.5',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${widget.dish!.name}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'with garlic',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          // 'EGP 105',
                          'EGP ${widget.dish!.price}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              //BODY
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.73,
                    width: double.infinity,
                    child: Card(
                      color: Colors.white,
                      margin: const EdgeInsets.only(top: 25),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                      ),
                      elevation: 1.5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 40),
                            const Text(
                              'Add more stuff',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Quantity',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () =>
                                          _changeQuantityValue(operation: 'd'),
                                      icon: const Icon(EvaIcons.minus),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        _quantity.toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () =>
                                          _changeQuantityValue(operation: 'i'),
                                      icon: const Icon(EvaIcons.plus),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Cheese',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () =>
                                          _changeCheeseValue(operation: 'd'),
                                      icon: const Icon(EvaIcons.minus),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        _cheese.toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () =>
                                          _changeCheeseValue(operation: 'i'),
                                      icon: const Icon(EvaIcons.plus),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Onion',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                (_onion)
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16.0),
                                        child: GestureDetector(
                                          onTap: () => _changeIngredients(
                                              ingredient: 'Onion'),
                                          child: const Text(
                                            'Added',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16.0),
                                        child: Row(
                                          children: [
                                            IconButton(
                                              onPressed: () =>
                                                  _changeIngredients(
                                                      ingredient: 'Onion'),
                                              icon: const Icon(EvaIcons.plus),
                                            ),
                                            const SizedBox(width: 5),
                                            const Text(
                                              'Add',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Bacon',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                (_bacon)
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16.0),
                                        child: GestureDetector(
                                          onTap: () => _changeIngredients(
                                              ingredient: 'Bacon'),
                                          child: const Text(
                                            'Added',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16.0),
                                        child: Row(
                                          children: [
                                            IconButton(
                                              onPressed: () =>
                                                  _changeIngredients(
                                                      ingredient: 'Bacon'),
                                              icon: const Icon(EvaIcons.plus),
                                            ),
                                            const SizedBox(width: 5),
                                            const Text(
                                              'Add',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Beef',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                (_beef)
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16.0),
                                        child: GestureDetector(
                                          onTap: () => _changeIngredients(
                                              ingredient: 'Beef'),
                                          child: const Text(
                                            'Added',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16.0),
                                        child: Row(
                                          children: [
                                            IconButton(
                                              onPressed: () =>
                                                  _changeIngredients(
                                                      ingredient: 'Beef'),
                                              icon: const Icon(EvaIcons.plus),
                                            ),
                                            const SizedBox(width: 5),
                                            const Text(
                                              'Add',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Center(
                              child: MaterialButton(
                                onPressed: () {
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .addItem(
                                    quantity: _quantity,
                                    size: _sizes[_currentIndex],
                                    dishModel: widget.dish!,
                                    cheese: _cheese,
                                    onion: _onion,
                                    bacon: _bacon,
                                    beef: _beef,
                                  );
                                },
                                elevation: 7.5,
                                color: const Color(0xFFFFC56B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                minWidth: 300,
                                padding: const EdgeInsets.all(16),
                                child: const Text(
                                  'Add to cart',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 110,
                    right: 50,
                    child: SizedBox(
                      height: 60,
                      child: ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () => _changeCurrentIndex(index),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: (_currentIndex == index)
                                  ? const Color(0xFFFFC56B)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: (_currentIndex == index)
                                      ? const Color(0xFFFFEECB)
                                      : Colors.black12,
                                  blurRadius: 15,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: Text(
                              _sizes[index],
                              style: (_currentIndex == index)
                                  ? const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600)
                                  : const TextStyle(
                                      color: Colors.black, fontSize: 25),
                            ),
                          ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateTo(
          context,
          page: const CartScreen(),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: const [
            Icon(
              EvaIcons.shoppingBagOutline,
              color: Colors.black,
            ),

            //TODO: CART BADGE
            //  CircleAvatar(
            //   radius: 5,
            //   backgroundColor: const Color(0XFFFFC56A),
            // ),
          ],
        ),
        // backgroundColor: const Color(0XFFFFC56A),
        backgroundColor: Colors.white,
      ),
    );
  }

  void _changeCurrentIndex(int index) => setState(() {
        _currentIndex = index;
      });
}
