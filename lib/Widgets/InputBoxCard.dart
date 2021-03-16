import 'dart:ui';

import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final String hintText;

  const InputField({this.label, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      margin: EdgeInsets.all(15.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.black87, fontSize: 14.0),
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(15.0),
          hintText: 'hi',
          hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
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
    return SizedBox(
      width: 200.0,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: Color(0xFF344955), width: 1.5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.camera_enhance_outlined,
              color: Color(0xFF0969FA),
            ),
            SizedBox(width: 15.0),
            Text(
              label,
              style: TextStyle(fontSize: 15.0, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}

String valueChoose;
List listItem = ["M001", "M002", "M003", "M004", "M005", "M006"];

class DropDownArrow extends StatefulWidget {
  @override
  _DropDownArrowState createState() => _DropDownArrowState();
}

class _DropDownArrowState extends State<DropDownArrow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF344955), width: 1),
            borderRadius: BorderRadius.circular(5.0)),
        child: DropdownButton(
          hint: Text('Select a person'),
          dropdownColor: Color(0xFF344955),
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 36,
          isExpanded: true,
          style:
              TextStyle(color: Color(0xFFF9AA33), fontWeight: FontWeight.bold),
          underline: SizedBox(),
          value: valueChoose,
          onChanged: (newValue) {
            setState(() {
              valueChoose = newValue;
            });
          },
          items: listItem.map((valueItem) {
            return DropdownMenuItem(
              child: Text(valueItem),
              value: valueItem,
            );
          }).toList(),
        ),
      ),
    );
  }
}
