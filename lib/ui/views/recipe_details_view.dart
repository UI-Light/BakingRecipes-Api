import "package:flutter/material.dart";
import 'package:url_launcher/url_launcher.dart';
import 'package:scamp_assessment/models/recipe_model.dart';

class RecipeDetailsView extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetailsView({Key? key, required this.recipe}) : super(key: key);

  @override
  _RecipeDetailsViewState createState() => _RecipeDetailsViewState();
}

class _RecipeDetailsViewState extends State<RecipeDetailsView> {
  void launchURL(_url) async {
    var url = Uri.parse(_url);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Error loading $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfff2f4f8),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(18, 20, 18, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                    color: const Color(0xffF8C8DC),
                  ),
                  Expanded(
                    child: Text(
                      widget.recipe.recipeName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  const Icon(
                    Icons.more_horiz,
                    color: Color(0xffF8C8DC),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height / 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: AssetImage('assets/bakery.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Ingredients',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xffF8C8DC),
                          Colors.pinkAccent,
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '${widget.recipe.servingSize} Serving(s)',
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < widget.recipe.ingredients.length; i++)
                        ListTile(
                          title: Text(
                            " ${widget.recipe.ingredients[i].quantity} ${widget.recipe.ingredients[i].measurement} ${widget.recipe.ingredients[i].ingredientName}",
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          visualDensity:
                              const VisualDensity(horizontal: 0, vertical: -4),
                        ),
                      const Padding(
                        padding: EdgeInsets.only(top: 30.0, bottom: 10),
                        child: Text(
                          'Cooking Instructions',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      for (int i = 0; i < widget.recipe.steps.length; i++)
                        ListTile(
                          title: Text(
                            widget.recipe.steps[i].description,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          trailing: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                      color: const Color(0xffF8C8DC))),
                              child: GestureDetector(
                                  onTap: () => launchURL(
                                      widget.recipe.steps[i].videoUrl),
                                  child: const Icon(
                                    Icons.video_library,
                                    color: Color(0xffF8C8DC),
                                  ))),
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
