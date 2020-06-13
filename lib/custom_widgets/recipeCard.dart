import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({@required this.recipe, @required this.cookName, @required this.dishImage, @required this.openFunc , @required this.ratingFunc , this.tagList});
  final Function openFunc;
  final String recipe;
  final String cookName;
  final String dishImage;
  final Function ratingFunc;
  final List<Widget> tagList;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openFunc,
      child: Stack(
        children: <Widget>[
          Container(
            width: 353.5,
            height: 265.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: const Color(0xffffffff),
              border: Border.all(width: 0.5, color: const Color(0xfff67300)),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x82ff7801),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(15.0, 11.5),
            child: SizedBox(
              width: 146.0,
              height: 160,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Text(
                        recipe,
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 20,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Dish by',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 17.5,
                          color: const Color(0xff000000),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        cookName,
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 18.6,
                          color: const Color(0xfff67300),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    )
                  ]
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(2 , 174.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: tagList,
            ),
          ),
          Transform.translate(
            offset: Offset(177.5, 12.0),
            child:
            // Adobe XD layer: 'kadai-paneer-gravy-…' (shape)
            Container(
              width: 147.5,
              height: 141.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21.0),
                image: DecorationImage(
                  image: AssetImage(dishImage),
                  fit: BoxFit.fill,
                ),
                border: Border.all(width: 1.5, color: const Color(0xfff67300)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(17.0 , 214.0),
            child: SizedBox(
              width: 184,
              height: 44,
              child: SmoothStarRating(
                  allowHalfRating: true,
                  onRated: ratingFunc,
                  starCount: 5,
                  rating: 2.5,
                  size: 35,
                  isReadOnly:false,
                  filledIconData: Icons.star,
                  halfFilledIconData: Icons.star_half,
                  color: const Color(0xfff67300),
                  borderColor: const Color(0xfff67300),
                  spacing:0.0
              ),
            ),
          )
        ],
      ),
    );
  }
}


