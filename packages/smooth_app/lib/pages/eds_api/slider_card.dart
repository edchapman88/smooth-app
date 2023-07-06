
import 'package:flutter/material.dart';

class SliderCard extends StatelessWidget {
  final String title;
  final double sliderVal;
  final int divisions;
  final double max;
  final ValueChanged<double> onChange;
  const SliderCard(this.title,this.sliderVal,this.divisions,this.max,this.onChange);

  @override
  Widget build(BuildContext context) {
    return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    // color: ,
    // shadowColor: UiKit.palette.shadow,
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Text(title),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Slider(
              value: sliderVal,
              label: sliderVal.round().toString(),
              onChanged: (double val) {
                onChange(val);
              },
              divisions: divisions,
              min: 0,
              max: max,
              activeColor: Colors.blue,
            )
          )
        ],
      ),
    )
  );
  }
}
