
import 'package:flutter/material.dart';

class SliderCard extends StatefulWidget {
  final String title;
  final int divisions;
  final double max;
  final Function onChange;
  const SliderCard(this.title,this.divisions,this.max,this.onChange);

  @override
  State<SliderCard> createState() => _SliderCardState();
}

class _SliderCardState extends State<SliderCard> {
  double sliderVal = 0;

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
          Text(widget.title),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Slider(
              value: sliderVal,
              label: sliderVal.round().toString(),
              onChanged: (double val) {
                setState(() {
                  sliderVal = val;
                });
                widget.onChange(val);
              },
              divisions: widget.divisions,
              min: 0,
              max: widget.max,
              activeColor: Colors.blue,
            )
          )
        ],
      ),
    )
  );
  }
}