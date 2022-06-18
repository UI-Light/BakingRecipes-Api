import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:scamp_assessment/ui/sharedWidgets/recipe_card.dart';
import 'package:scamp_assessment/data/http_service.dart';
import 'package:scamp_assessment/ui/views/recipe_details_view.dart';

class RecipesView extends StatefulWidget {
  const RecipesView({Key? key}) : super(key: key);

  @override
  State<RecipesView> createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecipesView> {
  List<dynamic> recipes = [];
  HttpService httpService = HttpService();

  TextEditingController searchController = TextEditingController();
  Color iconColor = Colors.grey;
  bool isLoading = true;

  void fetchRecipes() async {
    var result = await httpService.getRecipes();
    Future.delayed(const Duration(seconds: 2)).then((value) => setState(() {
          recipes = result.recipes;
          isLoading = false;
        }));
  }

  @override
  void initState() {
    super.initState();
    fetchRecipes();

    searchController.addListener(() {
      if (searchController.text.isEmpty) {
        setState(() {
          iconColor = Colors.grey;
        });
      } else {
        setState(() {
          iconColor = const Color(0xffF8C8DC);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffF8C8DC),
        title: Text(
          'Recipes',
          style: GoogleFonts.pacifico(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(3.0),
              height: MediaQuery.of(context).size.height / 15,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: iconColor),
                  suffixIcon: searchController.text.isNotEmpty
                      ? GestureDetector(
                          onTap: () => searchController.clear(),
                          child: Icon(
                            Icons.clear,
                            color: iconColor,
                          ),
                        )
                      : null,
                  hintText: 'Search by recipes or ingredients',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            isLoading
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Color(0xffF8C8DC)),
                  )
                : Expanded(
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                      ),
                      children: [
                        for (int i = 0; i < recipes.length; i++)
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => RecipeDetailsView(
                                  recipe: recipes[i],
                                ),
                              ),
                            ),
                            child: RecipeCard(
                              recipe: recipes[i],
                            ),
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

// const CircularProgressIndicator(
//                     valueColor: AlwaysStoppedAnimation(
//                       Color(0xffF8C8DC),
//                     ),
