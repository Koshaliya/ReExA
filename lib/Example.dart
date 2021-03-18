import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ImageSave extends StatefulWidget {
  @override
  _ImageSaveState createState() => _ImageSaveState();
}

class _ImageSaveState extends State<ImageSave> {
  File _image;
  final picker = ImagePicker();
  Future _getImage() async{
//ImageSource: camera
    PickedFile imageFile = await picker.getImage(source: ImageSource.camera);
//If there is no image selected, return.
    if (imageFile == null) return;
//File created.
    File tmpFile =File(imageFile.path);  
//it gives path to a directory - path_provider package.
    final appDir = await getApplicationDocumentsDirectory();
//filename - returns last part after the separator - path package.
    final fileName = basename(imageFile.path);
//copy the file to the specified directory and return File instance.
    tmpFile = await tmpFile.copy('${appDir.path}/$fileName');
//prints file location
    print('File path is :${tmpFile.path}');
    setState(() {
      _image = tmpFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ImagePicker - Save Image Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter ImagePicker - Save Image Example'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child:  _image != null
        ?Container(
                height: 300,
                child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.file(
                          _image,
                        ),
                      ),)
                    : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('No Image found'),
                    ),
            ),
            ElevatedButton(
              child: Text('Capture and Store Image'),
              onPressed: _getImage,
            )
          ],
        ),
      ),
    );
  }
  }

