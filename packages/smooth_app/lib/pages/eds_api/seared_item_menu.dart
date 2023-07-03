import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:smooth_app/pages/eds_api/handle_eaten.dart';

class SearchedItemMenu extends StatelessWidget {
  final Product product;

  const SearchedItemMenu({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
       
        Text(product.knowledgePanels!.panelIdToPanelMap.keys.join('::')),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            ElevatedButton(child: Text('add AM'),
            onPressed: () => handleEaten(product),
            ),
            SizedBox(width: 5,),
            ElevatedButton(child: Text('add snack'),
            onPressed: () => handleEaten(product),
            ),
            SizedBox(width: 5,),
            ElevatedButton(child: Text('add PM'),
            onPressed: () => handleEaten(product),
            ),
          ],),
        ),
        ]);
  }
}
