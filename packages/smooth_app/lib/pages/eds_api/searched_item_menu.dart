
import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:smooth_app/pages/eds_api/handle_eaten.dart';
import 'package:smooth_app/pages/eds_api/pick_date_time.dart';

class SearchedItemMenu extends StatelessWidget {
  final Product product;
  final TextEditingController servingController;
  String serving;
  final ValueChanged<String> onChangeServing;

  SearchedItemMenu({
    required this.product,
    required this.serving,
    required this.servingController,
    required this.onChangeServing
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
          child: Column(
            children: [
              Row(
                children: [
                  ElevatedButton(child: Text('add 1 serving now'),
                    onPressed: () => {
                        handleEaten('1', product),
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Successfully added"),
                        ))
                      },
                    ),
                ],
              ),
              SizedBox(height: 20,),
              TextField(
                  keyboardType: TextInputType.number,
                  controller: servingController,
                  onChanged: onChangeServing,
                  decoration: InputDecoration(
                    label: Text('input serving size',style: TextStyle(color: Colors.white)),
                    hintText: '3',
                    hintStyle: TextStyle(color: Colors.grey),
                    // border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white,style: BorderStyle.solid,width: 3)),
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white,style: BorderStyle.solid,width: 3)),
                    // filled: true,
                    // fillColor: Colors.white,
                    
                    ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10,),
              Row(children: [
                ElevatedButton(child: Text('add now'),
                onPressed: () => {
                    handleEaten(serving, product),
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
                          handleEaten(serving, product, date);
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
            ],
          ),
        ),
      ],
    );
  }
}
