import 'package:baseproject/src/components/details_container.dart';
import 'package:baseproject/src/components/image_Container.dart';
import 'package:baseproject/src/components/info_Container.dart';
import 'package:baseproject/src/model/movie_details_model.dart';
import 'package:baseproject/src/service/movie_details_service.dart';
import 'package:flutter/material.dart';

class MovieDetailsPage extends StatelessWidget {
  final int? index;
  final String? id;
  MovieDetailsPage({this.index, this.id});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MovieDetailsService().getMovieDetails(this.id.toString()),
      builder:
          (BuildContext context, AsyncSnapshot<MoviesDetailModel> snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(''),
            ),
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(snapshot.data!.result!.title!),
            ),
            body: buildApp(snapshot, context),
          );
        }
      },
    );
  }

  Widget buildApp(AsyncSnapshot<MoviesDetailModel> snapshot, context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Center(
        child: ListView(
          children: [
            Stack(
              children: [
                ImageContainer(
                  img: snapshot.data!.result!.poster.toString(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfoContainer(
                        text: snapshot.data!.result!.year!,
                      ),
                      InfoContainer(
                        text: snapshot.data!.result!.type.toString(),
                      ),
                    ],
                  ),
                )
              ],
            ),
            DetailsContainer(
              text: 'Yönetmen: ${snapshot.data!.result!.director}',
            ),
            DetailsContainer(
              text: 'Imdb Puanı: ${snapshot.data!.result!.imdbRating!}',
            ),
            DetailsContainer(
              text: 'Diller: ${snapshot.data!.result!.language!}',
            ),
            DetailsContainer(
              text: 'Oyuncular: ${snapshot.data!.result!.actors!}',
            ),
            DetailsContainer(
              text: 'Ülke: ${snapshot.data!.result!.country!}',
            ),
            DetailsContainer(
              text: 'Ödüller: ${snapshot.data!.result!.awards!}',
            ),
            DetailsContainer(
              text: 'Tür: ${snapshot.data!.result!.genre!}',
            ),
            DetailsContainer(
              text: 'Süre: ${snapshot.data!.result!.runtime!}',
            ),
            DetailsContainer(
              text: 'Gişe: ${snapshot.data!.result!.boxOffice!}',
            ),
            DetailsContainer(
              text: 'Produksiyon: ${snapshot.data!.result!.production!}',
            ),
          ],
        ),
      ),
    );
  }
}
