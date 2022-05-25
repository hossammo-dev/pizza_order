import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:pizza_order/models/dish_model.dart';

import '../../constants.dart';
import '../../views/dish_details_screen.dart';
import '../shared.dart';

class FavoriteItemCard extends StatelessWidget {
  const FavoriteItemCard({Key? key, required this.dishModel}) : super(key: key);
  final DishModel? dishModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Constants.mediaQuery(context).height * 0.48,
      child: GestureDetector(
        onTap: () =>
            navigateTo(context, page: DishDetailsScreen(dish: dishModel)),
        child: Card(
          color: Colors.white,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          shadowColor: const Color(0XFFF6F6F6),
          elevation: 6.5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network('${dishModel!.imageUrl}'),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(EvaIcons.heartOutline)),
                  ],
                ),
                Container(
                  constraints: const BoxConstraints(maxWidth: 200),
                  child: Text(
                    '${dishModel!.name}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '${dishModel!.category}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const Spacer(),
                Text(
                  'EGP ${dishModel!.price}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
