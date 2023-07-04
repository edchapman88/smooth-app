import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class RecordPage extends StatefulWidget {
  const RecordPage();
  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {

  final inputCtrl = TextEditingController();
  final selectedDate = ValueNotifier<DateTime>(DateTime.now());

  void sendForm () {

  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50,left: 10,right: 10),
      child: ListView.separated(
        padding: EdgeInsets.only(bottom: 50),
        itemCount: 3,
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
                      DatePicker.showDateTimePicker(context,
                                            showTitleActions: true,
                                            minTime: DateTime.now().subtract(const Duration(days: 7)),
                                            maxTime: DateTime.now().add(const Duration(days: 2)),
                                            onConfirm: (DateTime date) {
                                              selectedDate.value = date;
                                            },
                                            currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: Text('select date')
                    ),
                ],
              ),
            )
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            // color: ,
            // shadowColor: UiKit.palette.shadow,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text("Create a DID"),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: TextField(
                          // style: UiKit.text.textTheme.bodyMedium,
                          decoration: InputDecoration(
                            // border: OutlineInputBorder(),
                            hintText: 'Optionally enter ',
                            // hintStyle: UiKit.text.textTheme.bodyMedium,
                            // focusColor: UiKit.palette.textFieldBorder,
                            // errorText: createErr ?? createErr,
                          ),
                          controller: inputCtrl,
                        )
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: 200,
                    child: TextButton(onPressed: sendForm, child: Text("button"))),
                  
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
