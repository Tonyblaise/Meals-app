import 'package:flutter/material.dart';
import 'package:navigation/widgets/meal_item.dart';
import '../dummy_data.dart';
import 'package:navigation/models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meals";
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  late String categoryTitle;
  late List<Meal> displayedMeals;
  bool _loadedInitData = false;
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    // TODO: implement initState
    if (_loadedInitData == false) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;

      final String? categoryId = routeArgs["id"];
      categoryTitle = routeArgs["title"] as String;
      displayedMeals = widget.availableMeals
          .where(
            (element) => element.categories.contains(categoryId),
          )
          .toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              affordability: displayedMeals[index].affordability,
              imageUrl: displayedMeals[index].imageUrl,
              complexity: displayedMeals[index].complexity,
              duration: displayedMeals[index].duration,
              removeItem: _removeMeal);
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
