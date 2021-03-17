import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:intl/intl.dart';

class AmountField extends StatelessWidget {
  final String label;

  const AmountField({
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 100.0,
      margin: const EdgeInsets.all(10.0),
      child: TextField(
        style: TextStyle(color: Color(0xFFF9AA33), fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        inputFormatters: [ThousandsFormatter(allowFraction: true)],
        decoration: InputDecoration(
          prefixText: 'Rs ',
          prefixStyle: TextStyle(
              color: Color(0xFFF9AA33),
              fontWeight: FontWeight.bold,
              fontSize: 16.0),
          labelText: label,
          labelStyle: TextStyle(
              color: Colors.grey[700],
              fontSize: 14.0,
              fontWeight: FontWeight.bold),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54, width: 1),
          ),
          contentPadding: EdgeInsets.all(15.0),
        ),
      ),
    );
  }
}

class DateField extends StatefulWidget {
  @override
  _DateFieldState createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  TextEditingController dateCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 100.0,
      margin: const EdgeInsets.all(10.0),
      child: TextField(
        style: TextStyle(color: Color(0xFFF9AA33), fontWeight: FontWeight.bold),
        controller: dateCtl,
        inputFormatters: [ThousandsFormatter(allowFraction: true)],
        decoration: InputDecoration(
          labelText: 'Receipt Date',
          labelStyle: TextStyle(
              color: Colors.grey[700],
              fontSize: 14.0,
              fontWeight: FontWeight.bold),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54, width: 1),
          ),
          contentPadding: EdgeInsets.all(15.0),
        ),
        onTap: () async {
          DateTime date = DateTime(2019);
          FocusScope.of(context).requestFocus(new FocusNode());

          date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2019),
              lastDate: DateTime(2022));
          dateCtl.text = DateFormat.yMMMd().format(date);
        },
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
            ShaderMask(
                child: Container(
                  child: Icon(
                    Icons.camera_enhance_rounded,
                    color: Colors.white,
                  ),
                ),
                shaderCallback: (bounds) => LinearGradient(colors: [
                      Color(0xFFF9AA33),
                      Color(0xFFF9AA33),
                    ]).createShader(bounds)),
            /*Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
              color: Color(0xFF344955),
              padding: EdgeInsets.all(8.0),
              
              child: ShaderMask(
                              child: Icon(
                  Icons.camera_enhance_outlined,
                  color: Color(0xFFF9AA33),
                  
                ),
              ),
            ),*/
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

class DescriptionField extends StatefulWidget {
  @override
  _DescriptionFieldState createState() => _DescriptionFieldState();
}

class _DescriptionFieldState extends State<DescriptionField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 100.0,
      margin: const EdgeInsets.all(10.0),
      child: TextField(
        style: TextStyle(color: Color(0xFFF9AA33), fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          labelText: 'Description',
          labelStyle: TextStyle(
              color: Colors.grey[700],
              fontSize: 14.0,
              fontWeight: FontWeight.bold),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54, width: 1),
          ),
          contentPadding: EdgeInsets.all(15.0),
        ),
      ),
    );
  }
}

String valueChoose;
const List managerList = ["M001", "M002", "M003", "M004", "M005", "M006"];
const List categoryList = ["Food", "Travel", "Clinet Meeting", "Misc"];
const List paymentList = ["Card", "Cash"];

class DropDownArrow extends StatefulWidget {
  final String hintText;
  final List hintList;

  DropDownArrow({this.hintList, this.hintText});

  @override
  _DropDownArrowState createState() => _DropDownArrowState();
}

class _DropDownArrowState extends State<DropDownArrow> {
  @override
  Widget build(BuildContext context) {
    return selectDownMenu();
  }

  Padding selectDownMenu() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF344955), width: 1),
            borderRadius: BorderRadius.circular(5.0)),
        child: DropdownButton(
          hint: Text(widget.hintText),
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
          items: widget.hintList.map((valueItem) {
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
