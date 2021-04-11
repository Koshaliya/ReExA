import 'dart:ui';

import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

import 'package:image_picker/image_picker.dart';

import 'package:ReExA/empScreens/empDashboard.dart';

var managerIncharge,
    category,
    paymentMethod,
    amount,
    transactionDate,
    description;

//************************************************Amount Input Field************************************************************/

class AmountField extends StatelessWidget {
  final String label;
  const AmountField({
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    //print('Prana :' + transactionDate);
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: TextFormField(
        
        controller: TextEditingController(text: amount),
        onChanged: (value) {
          amount = value;
        },
        
        style: TextStyle(color: kSecondColor, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        inputFormatters: [ThousandsFormatter(allowFraction: true)],
        decoration: InputDecoration(
          prefixText: 'Rs ',
          prefixStyle: TextStyle(
              color: kSecondColor, fontWeight: FontWeight.bold, fontSize: 16.0),
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

//************************************************Description Input Field************************************************************/

class DescriptionField extends StatefulWidget {
  @override
  _DescriptionFieldState createState() => _DescriptionFieldState();
}

class _DescriptionFieldState extends State<DescriptionField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: TextField(
        controller: TextEditingController(text: description),
        onChanged: (value) {
          description = value;
        },
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

//************************************************DropDown ManagerIncharge Select************************************************************/

//var managerdetails= User().getManagers();

const List managerList = ["602ffb42c87096c45e83cea6"];
const List categoryList = ["Food", "Travel", "Clinet Meeting", "Misc"];
const List paymentList = ["Card", "Cash"];

class DropDownManager extends StatefulWidget {
  final String hintText;
  final List hintList;

  DropDownManager({this.hintList, this.hintText});

  @override
  _DropDownManagerState createState() => _DropDownManagerState();
}

class _DropDownManagerState extends State<DropDownManager> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            border: Border.all(color: kPrimaryColor, width: 1),
            borderRadius: BorderRadius.circular(5.0)),
        child: DropdownButtonFormField(
          decoration: InputDecoration.collapsed(hintText: ' '),
          hint: Text(widget.hintText),
          dropdownColor: kPrimaryColor,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 36,
          isExpanded: true,
          style: TextStyle(color: kSecondColor, fontWeight: FontWeight.bold),
          items: widget.hintList.map((valueItem) {
            return DropdownMenuItem(
              child: Text(valueItem),
              value: valueItem,
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              managerIncharge = newValue;
            });
          },
          value: managerIncharge,
        ),
      ),
    );
  }
}

//************************************************DropDown Category Select************************************************************/

class DropDownCategory extends StatefulWidget {
  final String hintText;
  final List hintList;

  DropDownCategory({this.hintList, this.hintText});
  @override
  _DropDownCategoryState createState() => _DropDownCategoryState();
}

class _DropDownCategoryState extends State<DropDownCategory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            border: Border.all(color: kPrimaryColor, width: 1),
            borderRadius: BorderRadius.circular(5.0)),
        child: DropdownButtonFormField(
          decoration: InputDecoration.collapsed(hintText: ' '),
          hint: Text(widget.hintText),
          dropdownColor: kPrimaryColor,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 36,
          isExpanded: true,
          style: TextStyle(color: kSecondColor, fontWeight: FontWeight.bold),
          items: widget.hintList.map((valueItem) {
            return DropdownMenuItem(
              child: Text(valueItem),
              value: valueItem,
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              category = newValue;
            });
          },
          value: category,
        ),
      ),
    );
  }
}

//************************************************DropDown PayMethod Select************************************************************/

class DropDownPayMethod extends StatefulWidget {
  final String hintText;
  final List hintList;

  DropDownPayMethod({this.hintList, this.hintText});
  @override
  _DropDownPayMethodState createState() => _DropDownPayMethodState();
}

class _DropDownPayMethodState extends State<DropDownPayMethod> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            border: Border.all(color: kPrimaryColor, width: 1),
            borderRadius: BorderRadius.circular(5.0)),
        child: DropdownButtonFormField(
          decoration: InputDecoration.collapsed(hintText: ' '),
          hint: Text(widget.hintText),
          dropdownColor: kPrimaryColor,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 36,
          isExpanded: true,
          style: TextStyle(color: kSecondColor, fontWeight: FontWeight.bold),
          items: widget.hintList.map((valueItem) {
            return DropdownMenuItem(
              child: Text(valueItem),
              value: valueItem,
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              paymentMethod = newValue;
            });
          },
          value: paymentMethod,
        ),
      ),
    );
  }
}

//************************************************Attach Image Button************************************************************/

class AttachImage extends StatefulWidget {
  @override
  _AttachImageState createState() => _AttachImageState();
}

class _AttachImageState extends State<AttachImage> {
  // Future getImage() async {
  //   final _picker = ImagePicker();
  //   final cameraImage = await _picker.getImage(source: ImageSource.camera);

  //   setState(() {
  //     print(cameraImage.path);
  //     _image = File(cameraImage.path);
  //   });
  // }
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  Image imageFromPreferences;
  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      print(pickedFile.path);
      _imageFile = pickedFile;
    });
    // final SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.setString('pickedImage', _imageFile.toString());
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
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
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
                CircleAvatar(
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
          height: 30.0,
          child: _imageFile == null
              ? Text('')
              : Text(
                  "Receipt Attached",
                  style: TextStyle(fontSize: 16.0, color: kPrimaryColor),
                ),
        ),
      ],
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text('Select a photo'),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                icon: Icon(Icons.camera_rounded),
                onPressed: () async {
                  takePhoto(ImageSource.camera);
                },
                label: Text('Camera'),
              ),
              TextButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: Text('Gallery'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

//************************************************PopUp Widgets************************************************************/

class PopContainer extends StatelessWidget {
  final String title;
  final String titleAns;

  const PopContainer({this.title, this.titleAns});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1.0, color: Colors.white),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              title,
              style: kPopTitle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              titleAns,
              style: kPopTitleAns,
            ),
          ),
        ],
      ),
    );
  }
}

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.all(15.0),
        ),
      ),
      child: Text(
        "Confirm",
        style: TextStyle(color: Colors.white, fontSize: 15.0),
      ),
      onPressed: () {
        Navigator.pushNamed(context, EmpDashboard.id);
      },
    );
  }
}

//************************************************PopUp Screen************************************************************/

Future buildShowDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color(0xFFF1EFEF),
        insetPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        content: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Positioned(
              right: -40.0,
              top: -40.0,
              child: InkResponse(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: CircleAvatar(
                  child: Icon(Icons.close),
                  backgroundColor: Colors.red,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundColor: kPrimaryColor,
                        child: Icon(Icons.receipt_long_outlined),
                      ),
                      Text('Add expense approval')
                    ],
                  ),
                ),
                PopContainer(
                  title: 'Authorizer Name',
                  titleAns: 'P.K.Fernando',
                ),
                PopContainer(
                  title: 'Expense Category',
                  titleAns: 'Travel',
                ),
                PopContainer(
                  title: 'Payment Method',
                  titleAns: 'Card',
                ),
                PopContainer(
                  title: 'Amount',
                  titleAns: 'Rs.520',
                ),
                PopContainer(
                  title: 'Receipt Date',
                  titleAns: '14/03/2020',
                ),
                PopContainer(
                  title: 'Description',
                  titleAns: 'Due to client meeting..',
                ),
                ConfirmButton(),
              ],
            ),
          ],
        ),
      );
    },
  );
}
