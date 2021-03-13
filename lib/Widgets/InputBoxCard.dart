import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;

  const InputField({this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: InputDecorator(
        decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.all(15.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('hi'),
          ],
        ),
      ),
    );
  }
}

class AttachButton extends StatelessWidget {
  final String label;
  const AttachButton({this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: Color(0xFF0969FA)),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        textBaseline: TextBaseline.ideographic,
        children: [
          Icon(
            Icons.camera_enhance_outlined,
            color: Color(0xFF0969FA),
          ),
          Text(
            label,
            style: TextStyle(fontSize: 15.0, color: Colors.black87),
          ),
        ],
      ),
      width: 170.0,
      height: 50.0,
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
    );
  }
}
