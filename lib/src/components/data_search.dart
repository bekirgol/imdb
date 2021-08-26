// import 'package:flutter/material.dart';

// class DataSearch extends SearchDelegate<String> {
//   final cities = [
//     'sggfa',
//     'asfg',
//     'asf',
//     'asds',
//     'asds',
//   ];

//   final recentCities = [
//     'sggfa',
//     'asfg',
//     'asf',
//     'asds',
//     'asds',
//   ];
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [IconButton(onPressed: () {}, icon: Icon(Icons.clear))];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//         onPressed: () {},
//         icon: AnimatedIcon(
//           icon: AnimatedIcons.menu_arrow,
//           progress: transitionAnimation,
//         ));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//     throw UnimplementedError();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final suggestionList = query.isEmpty ? recentCities : cities;
//     return ListView.builder(
//       itemCount: suggestionList.length,
//       itemBuilder: (BuildContext context, int index) {
//         return ListTile(
//           leading: Icon(Icons.location_city),
//           title: Text(suggestionList[index]),
//         );
//       },
//     );
//   }
// }
