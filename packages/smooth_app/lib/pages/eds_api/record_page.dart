import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecordPage extends StatefulWidget {
  const RecordPage();
  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {

  final inputCtrl = TextEditingController();

  void sendForm () {

  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50,left: 50,right: 50),
      child: ListView.separated(
        padding: EdgeInsets.only(bottom: 50),
        itemCount: 1,
        separatorBuilder: (BuildContext context, int index) => SizedBox(height: 30,),
        itemBuilder: (BuildContext context, int index) {
          return [
          // CREATE____________________________________________________________
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            // color: ,
            // shadowColor: UiKit.palette.shadow,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
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
