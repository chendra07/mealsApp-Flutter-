import 'package:flutter/material.dart';

//dummyData
import '../data/dummy_data.dart';

//components
import '../components/category/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(
              key: ValueKey(catData.id),
              catId: catData.id,
              title: catData.title,
              color: catData.color,
            ),
          )
          .toList(),
    );
  }
}
