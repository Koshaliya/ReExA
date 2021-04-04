import 'package:flutter/material.dart';
import 'package:ReExA/empWidgets/constants.dart';

class VerifyNew extends StatelessWidget {
  const VerifyNew({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.black
      ),
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
      icon: Icon(Icons.search_rounded),
      iconSize: 10.0,
      color: Colors.blueGrey,
      onPressed: () {
        showSearch(context: context, delegate: ListSearch());
      },
        
    )
          ],  ),
    );
  }
}

final normalEmp = [
  "M001",
  "E002",
  "M002",
  "E001",
  "M004",
  "E005",
  "M005",
  "E004"
];
final recentEmp = ["M021", "E022", "M022", "E011"];

class ListSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {}

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentEmp
        : normalEmp.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
         // Navigator.pushNamed(context, ProfilePage.id);
        },
        leading: Icon(Icons.person),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
