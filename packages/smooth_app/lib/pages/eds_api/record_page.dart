
import 'package:flutter/material.dart';
import 'package:smooth_app/pages/eds_api/button_style.dart';
import 'package:smooth_app/pages/eds_api/check_box_card.dart';
import 'package:smooth_app/pages/eds_api/handle_record.dart';
import 'package:smooth_app/pages/eds_api/record_interface.dart';
import 'package:smooth_app/pages/eds_api/slider_card.dart';

class RecordPage extends StatefulWidget {
  const RecordPage();
  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {

  final inputCtrl = TextEditingController();
  final selectedDate = ValueNotifier<DateTime>(
    DateTime.parse(DateTime.now().toString().substring(0,10))
  );
  double fam_cramp = 0;
  bool fam_bloated = false;
  double am_eat_cramp = 0;
  double am_ibsd_intensity = 0;
  double am_ibsd_duration = 0;
  double pm_ibsd_intensity = 0;
  double pm_ibsd_duration = 0;
  bool nausea = false;

  bool am_overwhelmed = false;
  bool pm_overwhelmed = false;

  void sendForm () {
    final record = RecordObj(
      date: selectedDate.value,
      targets: Targets(
        fam_cramp: fam_cramp,
        fam_bloated: fam_bloated,
        am_eat_cramp: am_eat_cramp,
        am_ibsd_intensity: am_ibsd_intensity,
        am_ibsd_duration: am_ibsd_duration,
        pm_ibsd_intensity: pm_ibsd_intensity,
        pm_ibsd_duration: pm_ibsd_duration,
        nausea: nausea
      ),
      features: Features(
        am_overwhelmed: am_overwhelmed,
        pm_overwhelmed: pm_overwhelmed
      )
    );
    // print(jsonEncode(record));
    handleRecord(record);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Successfully recorded"),
    ));
    setState(() {
      selectedDate.value = DateTime.parse(DateTime.now().toString().substring(0,10));
      fam_cramp = 0;
      fam_bloated = false;
      am_eat_cramp = 0;
      am_ibsd_intensity = 0;
      am_ibsd_duration = 0;
      pm_ibsd_intensity = 0;
      pm_ibsd_duration = 0;
      nausea = false;
      am_overwhelmed = false;
      pm_overwhelmed = false;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50,left: 10,right: 10),
      child: ListView.separated(
        padding: EdgeInsets.only(bottom: 50),
        itemCount: 13,
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
                              selectedDate.value.toString().substring(0,10),
                              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),);
                          }),
                  ElevatedButton(
                    onPressed: () {
                      showDatePicker(
                        builder: (context, child) {
                          return Theme(data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: const Color.fromARGB(65, 3, 168, 244), // header background color
                                onPrimary: Colors.blue, // header text color
                                onSurface: Colors.black, // body text color
                                surfaceTint: Colors.white
                              ),
                              useMaterial3: true,
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.blue, // button text color
                                ),
                              )
                            ),
                            child: child!
                            );},
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now().subtract(const Duration(days: 7)),
                          lastDate: DateTime.now().add(const Duration(days: 2))
                      ).then((date) {
                        if (date != null) {
                          selectedDate.value = date;
                        }
                      });
                    },
                    child: Text('select date'),
                    style: buttonStyle,
                  ),
                ],
              ),
            )
          ),
          SliderCard('cramp when waking up', fam_cramp, 3, 3, (val) {setState(() {fam_cramp = val;});}),
          CheckBoxCard('bloated when waking up', fam_bloated, (val) {setState(() {fam_bloated = val;});}),
          SliderCard('cramp eating breakfast', am_eat_cramp, 3, 3, (val){setState(() {am_eat_cramp = val;});}),
          SliderCard('AM IBSD intensity', am_ibsd_intensity, 3, 3, (val) {setState(() {am_ibsd_intensity = val;});}),
          SliderCard('AM IBSD duration', am_ibsd_duration, 3, 3, (val) {setState(() {am_ibsd_duration = val;});}),
          SliderCard('PM IBSD intensity', pm_ibsd_intensity, 3, 3, (val) {setState(() {pm_ibsd_intensity = val;});}),
          SliderCard('PM IBSD duration', pm_ibsd_duration, 3, 3, (val) {setState(() {pm_ibsd_duration = val;});}),
          CheckBoxCard('nausea', nausea, (val) => nausea = val),
          CheckBoxCard('AM feel overwhelmed', am_overwhelmed, (val) {setState(() {am_overwhelmed = val;});}),
          CheckBoxCard('PM feel overwhelmed', pm_overwhelmed, (val) {setState(() {pm_overwhelmed = val;});}),
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
                      child: Text("record"),
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
