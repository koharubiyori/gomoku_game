import 'package:flutter/material.dart';

class ButtonRadio extends StatefulWidget {
  final String text;
  final bool selected;
  final void Function() onPressed;
  
  const ButtonRadio({
    required this.text,
    required this.selected,
    required this.onPressed,
    Key? key
  }) : super(key: key);

  @override
  _ButtonRadioState createState() => _ButtonRadioState();
}

class _ButtonRadioState extends State<ButtonRadio> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 90,
          height: 45,
          child: ElevatedButton(
            onPressed: widget.onPressed, 
            child: Text(widget.text),
          )
        ),

        Positioned.fill(
          left: 0,
          bottom: 0,
          child: Container(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 100),
              color: Colors.orange,
              width: widget.selected ? 90 : 0,
              height: 3,
            ),
          ),
        ),
      ],
    );
  }
}