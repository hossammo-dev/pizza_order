import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pizza_order/constants.dart';
import 'package:pizza_order/providers/main_provider.dart';
import 'package:pizza_order/shared/widgets/category_item.dart';
import 'package:pizza_order/shared/widgets/favorite_item_card.dart';
import 'package:pizza_order/shared/widgets/lunch_item_card.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:pizza_order/shared/shared.dart';
import 'package:pizza_order/views/dish_details_screen.dart';
import 'auth/login_and_register_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainProvider _main = Constants.mainProvider(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(EvaIcons.menu2Outline, color: Colors.black),
                    Row(
                      children: [
                        const Icon(EvaIcons.navigation2Outline,
                            color: Colors.grey),
                        const SizedBox(width: 5),
                        Container(
                          constraints: const BoxConstraints(
                            maxWidth: 250,
                          ),
                          child: Text(
                            Constants.locationProvider(context, listen: true)
                                .address,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () => Constants.authProvider(context)
                          .logUserOut()
                          .whenComplete(() => navigateAndRemove(context,
                              page: const LoginAndRegisterScreen())),
                      icon: const Icon(EvaIcons.logOutOutline,
                          color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                //BODY: HEADER
                const Text(
                  'What would you like',
                  style: TextStyle(fontSize: 30),
                ),
                const Text(
                  'to eat?',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                //BODY: MIDDLE
                (Constants.mainProvider(context, listen: true)
                        .dishesList
                        .isEmpty)
                    ? Center(
                        child: Lottie.asset(Constants.pizzaBw),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 46,
                            child: ListView.builder(
                                itemCount: _main
                                    .categoriesList
                                    .length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => CategoryItem(
                                      index: index,
                                    )),
                          ),
                          const SizedBox(height: 30),
                          RichText(
                            text: const TextSpan(
                              text: 'Favorite',
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text: '  dishes',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: Constants.mediaQuery(context).height * 0.48,
                            child: ListView.builder(
                                itemCount: _main
                                    .dishesList
                                    .length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    FavoriteItemCard(
                                        dishModel:
                                            _main
                                                .dishesList[index])),
                          ),

                          const SizedBox(height: 40),
                          //FOOTER
                          const Text(
                            'Business lunch',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 40),
                          ),
                          const SizedBox(height: 20),
                          ListView.builder(
                            itemCount:
                                Constants.mainProvider(context, listen: true)
                                    .dishesList
                                    .length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () => navigateTo(
                                context,
                                page: DishDetailsScreen(
                                  dish: _main
                                      .dishesList[index],
                                ),
                              ),
                              child: LunchItemCard(
                                dishModel: Constants.mainProvider(context,
                                        listen: true)
                                    .dishesList[index],
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
      floatingActionButton: defaultFloatingActionButton(context,
          btnColor: const Color(0XFFFFC56A),
          badgeColor: Colors.white),
    );
  }
}
