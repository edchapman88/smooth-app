import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:smooth_app/pages/eds_api/handle_eaten.dart';
import 'package:smooth_app/pages/eds_api/pick_date_time.dart';

class SearchedItemMenu extends StatelessWidget {
  final Product product;

  const SearchedItemMenu({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
        Column(children: [
          Container(
            padding: EdgeInsetsDirectional.symmetric(vertical: 2),
            decoration: BoxDecoration(border: Border(top: BorderSide(width: 1))),
            child: Row(  children: [
              Text('Serving size: ', style: TextStyle(fontWeight: FontWeight.bold),),
              Text('${product.servingSize}'),
            ]),
          ),
          Container(
            padding: EdgeInsetsDirectional.symmetric(vertical: 2),
            decoration: BoxDecoration(border: Border(top: BorderSide(width: 1))),
            child: Row(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                verticalDirection: VerticalDirection.up,
                children: [
                  Text('Categories: ', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              Expanded(child: Text('${product.labelsTags?.map((e) => e.substring(3)).join(' ,')}')),
            ],),
          ),
          Container(
            padding: EdgeInsetsDirectional.symmetric(vertical: 2),
            decoration: BoxDecoration(border: Border(top: BorderSide(width: 1), bottom: BorderSide(width: 1),)),
            child: Row(children: [
              Text('Ingredients: ', style: TextStyle(fontWeight: FontWeight.bold),),
              Expanded(child: Text('${product.ingredientsText?.replaceAll("\n", " ")}')),
            ],),
          )
        ]),
        SizedBox(height: 20,),
          
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            ElevatedButton(child: Text('add now'),
            onPressed: () => {
                handleEaten(product),
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Successfully added"),
                ))
              },
            ),
            SizedBox(width: 5,),
            ElevatedButton(
              style: ButtonStyle(),
              onPressed: () {
                pickDateTime(context).then((date) {
                    if (date != null) {
                      handleEaten(product, date);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Successfully added"),
                      ));
                    }
                  });
              },
              child: Text('add at date-time')
            )
          ],
          ),
        ),
      ],
    );
  }
}
