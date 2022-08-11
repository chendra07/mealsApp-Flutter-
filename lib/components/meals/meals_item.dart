import 'package:flutter/material.dart';

//model
import '../../models/meals_model.dart';

//routes
import '../../routes/routes_config.dart';

//component
import '../UI/custom_icon_button.dart';

class MealsItem extends StatelessWidget {
  final String mealsId;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  // final Function removeItem;

  const MealsItem({
    Key key,
    @required this.mealsId,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.affordability,
    @required this.complexity,
    // @required this.removeItem,
  }) : super(key: key);

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      RoutesConfig.mealDetailScreen,
      arguments: mealsId,
    )
        .then((value) {
      // if (value != null) {
      //   removeItem(value);
      // }
    });
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomRight: Radius.zero,
                    bottomLeft: Radius.zero,
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: const Color.fromARGB(120, 0, 0, 0),
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomIconButton(
                    title: '$duration min',
                    icon: Icons.schedule,
                  ),
                  CustomIconButton(
                    title: complexityText,
                    icon: Icons.work,
                  ),
                  CustomIconButton(
                    title: affordabilityText,
                    icon: Icons.attach_money,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
