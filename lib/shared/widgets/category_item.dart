import 'package:flutter/material.dart';
import 'package:pizza_order/constants.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, this.index}) : super(key: key);
  final int? index;

  @override
  Widget build(BuildContext context) {
    final _mainProvider = Constants.mainProvider(context);
    return GestureDetector(
      onTap: () => _mainProvider.changeCurrentIndex(index!),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: (_mainProvider.currentIndex == index)
              ? const Color(0xFFFFC56B)
              : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: (_mainProvider.currentIndex == index)
                  ? const Color(0xFFFFEECB)
                  : Colors.white10,
              blurRadius: 15,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Center(
            child: Text(
          _mainProvider.categoriesList[index!],
          style: const TextStyle(fontSize: 16),
        )),
      ),
    );
  }
}
