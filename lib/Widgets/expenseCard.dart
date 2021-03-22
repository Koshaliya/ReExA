import 'dart:ui';
import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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
        style: TextStyle(color: kSecondColor, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        inputFormatters: [ThousandsFormatter(allowFraction: true)],
        decoration: InputDecoration(
          prefixText: 'Rs ',
          prefixStyle: TextStyle(
              color: kSecondColor,
              fontWeight: FontWeight.bold,
              fontSize: 16.0),
          labelText: label,
          labelStyle: TextStyle(
              color: Colors.grey[700],
              fontSize: 14.0,
              fontWeight: FontWeight.bold),
          border: kEnabledBorder,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor, width: 1),
          ),
          enabledBorder: kEnabledBorder,
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
        style: TextStyle(color: kSecondColor, fontWeight: FontWeight.bold),
        controller: dateCtl,
        decoration: InputDecoration(
          labelText: 'Receipt Date',
          labelStyle: TextStyle(
              color: Colors.grey[700],
              fontSize: 14.0,
              fontWeight: FontWeight.bold),
          border: kEnabledBorder,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor, width: 1.5),
          ),
          enabledBorder: kEnabledBorder,
          contentPadding: EdgeInsets.all(15.0),
        ),
        onTap: () async {
          DateTime date = DateTime(2019);
          FocusScope.of(context).requestFocus(new FocusNode());

          date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime(2022),
            builder: (BuildContext context, Widget child) {
              return Theme(
                data: ThemeData(
                  textButtonTheme: new TextButtonThemeData(
                    style: TextButton.styleFrom(primary: kSecondColor),
                  ),
                  colorScheme: ColorScheme.light(
                    primary: kPrimaryColor,
                    onPrimary: Colors.white,
                    onSurface: kPrimaryColor,
                  ),
                ),
                child: child,
              );
            },
          );
          dateCtl.text = DateFormat.yMMMd().format(date);
        },
      ),
    );
  }
}
/*
class AttachButton extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return 
  }
}*/

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
        style: TextStyle(color: kSecondColor, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          labelText: 'Description',
          labelStyle: TextStyle(
              color: Colors.grey[700],
              fontSize: 14.0,
              fontWeight: FontWeight.bold),
          border: kEnabledBorder,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor, width: 1.5),
          ),
          enabledBorder: kEnabledBorder,
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
            border: Border.all(color: kPrimaryColor, width: 1),
            borderRadius: BorderRadius.circular(5.0)),
        child: DropdownButton(
          hint: Text(widget.hintText),
          dropdownColor: kPrimaryColor,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 36,
          isExpanded: true,
          style:
              TextStyle(color: kSecondColor, fontWeight: FontWeight.bold),
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

class AttachImage extends StatefulWidget {
  @override
  _AttachImageState createState() => _AttachImageState();
}

class _AttachImageState extends State<AttachImage> {
  File _image;
  Future getImage() async {
    final _picker = ImagePicker();
    final cameraImage = await _picker.getImage(source: ImageSource.camera);

    setState(() {
      print(cameraImage.path);
      _image = File(cameraImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 200.0,
          child: TextButton(
            onPressed: () {
              getImage();
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(color: kPrimaryColor, width: 1.5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //ShaderMask(
                    //child: 
                    Container(
                      decoration: BoxDecoration(
                        color:kSecondColor,
                      ),
                      child: Icon(
                        Icons.camera_enhance_rounded,
                        color: Colors.white,
                      ),
                    ),
                   /* shaderCallback: (bounds) => LinearGradient(colors: [
                          kSecondColor,
                          kSecondColor
                        ]).createShader(bounds)),
                Container(
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
                  'Attach Receipt',
                  style: TextStyle(fontSize: 15.0, color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.0),
          //padding: EdgeInsets.all(5.0),
          height: 30.0,

          child: _image == null
              ? Text('')
              : Text(
                  "Receipt Attached",
                  style: TextStyle(fontSize: 16.0, color: kPrimaryColor),
                ),
        ),
      ],
    );
  }
}
