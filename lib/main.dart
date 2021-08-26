import 'package:baseproject/src/view/pages/movie_page.dart';
import 'package:baseproject/src/view_model/movie_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/view_model/movie_details_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MovieViewModel>(
          create: (_) => MovieViewModel(),
        ),
        ChangeNotifierProvider<MovieDetailsViewModel>(
          create: (_) => MovieDetailsViewModel(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.blueGrey),
        home: MoviePage(),
      ),
    );
  }
}
