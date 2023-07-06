import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smooth_app/pages/eds_api/button_style.dart';
import 'package:smooth_app/pages/eds_api/pick_date_time.dart';
import 'package:smooth_app/pages/eds_api/record_interface.dart';
import 'package:smooth_app/pages/eds_api/slider_card.dart';

class RecordPage extends StatefulWidget {
  const RecordPage();
  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {

  final inputCtrl = TextEditingController();
  final selectedDate = ValueNotifier<DateTime>(DateTime.now());
  double sliderVal_1 = 0;

  void sendForm () {
    final record = RecordObj(
      date: selectedDate.value,
      symptom1: sliderVal_1
    );
    print(jsonEncode(record));
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50,left: 10,right: 10),
      child: ListView.separated(
        padding: EdgeInsets.only(bottom: 50),
        itemCount: 4,
        separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10,),
        itemBuilder: (BuildContext context, int index) {
          return [
          SizedBox(height: 20,),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  ValueListenableBuilder(
                      valueListenable: selectedDate,
                          builder: (context, value, widget) {
                            return Text(
                              selectedDate.value.toString().split('.').first,
                              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),);
                          }),
                  ElevatedButton(
                    onPressed: () {
                      pickDateTime(context).then((date) {
                            if (date != null) {
                              selectedDate.value = date;
                            }
                          });
                          
                        },
                      // });
                    // },
                    child: Text('select date'),
                    style: buttonStyle,
                    ),
                ],
              ),
            )
          ),
          SliderCard("card1", 3, 3, (val) => sliderVal_1 = val),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            // color: ,
            // shadowColor: UiKit.palette.shadow,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: sendForm,
                      child: Text("send"),
                      style: buttonStyle
                    )
                  ),
                ],
              ),
            )
          ),
      

        ][index];
        },
      ),
    );
  }
}
