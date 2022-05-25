import 'package:flutter/material.dart';
import 'package:pizza_order/models/dish_model.dart';

class LunchItemCard extends StatelessWidget {
  const LunchItemCard({Key? key, required this.dishModel}) : super(key: key);
  final DishModel? dishModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      shadowColor: const Color(0xFFFFEECB),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 170,
                  ),
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
                const SizedBox(height: 20),
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
            SizedBox(
              height: 150,
              width: 150,
              child: Image.network(
                  '${dishModel!.imageUrl}'),
            )
          ],
        ),
      ),
    );
  }
}
