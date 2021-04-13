import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:loading/loading.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var imageUrl;

bool isloading = false;
Future uploadImage() async {
  final ImagePicker _picker = ImagePicker();
    const url = "https://api.cloudinary.com/v1_1/****/upload";
    var image = await _picker.getImage(source: ImageSource.gallery);

    setState(() {
      isloading = true;
    });

    Dio dio = Dio();

    FormData formData = new FormData.from({
      "file": image.path,
      "upload_preset": "<*Upload Preset Name *>",
      "cloud_name": "<* cloud name*>",
    });
    try {
      Response response = await dio.post(url, data: formData);

      var data = jsonDecode(response.toString());
      print(data['secure_url']);

      setState(() {
        isloading = false;
        imageUrl = data['secure_url'];
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: CircleAvatar(
          radius: 100,
          backgroundColor: Colors.blueAccent,
          backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : null,
          child: imageUrl == null
              ? !isloading
                  ? Icon(
                      Icons.person,
                      size: 100,
                      color: Colors.white,
                    )
                  : CircularProgressIndicator()
              : Container(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => uploadImage(),
        child: Icon(Icons.add),
      ), 
    );
  }
}