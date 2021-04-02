import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ReExA/empWidgets/constants.dart';

class Newspage extends StatefulWidget {
  static const String id = 'newsPage';
  @override
  _NewspageState createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        //leading: MenuButton(),
        actions: [SearchButton(), NotificationButton()],
        title: AppBarTitle(
          title: 'News',
        ),
      ),
      drawer: SideDrawer(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, Koshaliya',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Latest exclusive news',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        wordSpacing: 5,
                        letterSpacing: 1),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    NewsTemplate(
                      color: Color(0xFFF7D794),
                    ),
                    NewsTemplate(
                      color: Color(0xFF64CDDB),
                    ),
                    NewsTemplate(
                      color: Color(0xFF596174),
                    ),
                    NewsTemplate(
                      color: Color(0xFF786FA6),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NewsTemplate extends StatelessWidget {
  final Color color;
  const NewsTemplate({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 180.0,
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Next week is declared a holiday.',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
          ),
          //SizedBox(height:10.0),
          Text(
            'Due to covid pandemic Gampaha district is isolated. Considering the government order our company has decided to declare next week holiday. Due to covid pandemic Gampaha district is isolated. ',
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
