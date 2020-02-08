import 'package:flutter/material.dart';

// import '../models/meal.dart';
import '../screen/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  // final Complexity complexity;
  // final Affordability affordability;
  // final Function removeItem;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    // @required this.affordability,
    // @required this.complexity,
    @required this.duration,
    // this.removeItem,
  });

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailScreen.routeNAme, arguments: id)
        .then((result) {
      if (result != null) {
        // removeItem(result);
      }
    });
  }

  // String get complexityText {
  //   if (complexity == Complexity.Simple) {
  //     return 'Simple';
  //   } else if (complexity == Complexity.Challenging) {
  //     return 'Challenging';
  //   } else if (complexity == Complexity.Hard) {
  //     return 'Hard';
  //   } else {
  //     return 'unknown';
  //   }
  // }

  // String get affordabilityText {
  //   if (affordability == Affordability.Affordable) {
  //     return 'Affordability';
  //   } else if (affordability == Affordability.Luxurious) {
  //     return 'Luxurious';
  //   } else if (affordability == Affordability.Pricey) {
  //     return 'Pricey';
  //   } else {
  //     return 'unknown';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 8,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(15),
                    topRight: const Radius.circular(15),
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
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        '$duration min',
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text('Simple')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text('Pricey')
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
