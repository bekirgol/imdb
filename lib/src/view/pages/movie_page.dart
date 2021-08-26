import 'package:baseproject/src/components/image_Container.dart';
import 'package:baseproject/src/components/info_Container.dart';
import 'package:baseproject/src/view/pages/movie_details_page.dart';
import 'package:baseproject/src/view_model/movie_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<MovieViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 20.0,
        title: Text('Film Ara'),
        centerTitle: true,
      ),
      body: buildApp(data, context),
    );
  }

  Widget buildApp(MovieViewModel data, context) {
    switch (data.state) {
      case MovieState.BUSY:
        {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

      case MovieState.ERROR:
        {
          return Center(
            child: Text('no data'),
          );
        }
      case MovieState.IDLE:
        {
          return ListView(
            children: [
              Container(
                color: Colors.grey,
                width: MediaQuery.of(context).size.width,
                height: 60.0,
                padding: EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TextField(
                    controller: data.movieController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 6.0, right: 6.0),
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: data.sendMovie,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.grey,
                child: GridView.builder(
                  primary: false,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                  ),
                  itemCount: data.moviesList!.result!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => MovieDetailsPage(
                                      index: index,
                                      id: data
                                          .moviesList!.result![index].imdbId,
                                    )));
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  ImageContainer(
                                    img:
                                        data.moviesList!.result![index].poster!,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InfoContainer(
                                          text: data
                                              .moviesList!.result![index].year!,
                                        ),
                                        InfoContainer(
                                          text: data
                                              .moviesList!.result![index].type
                                              .toString(),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                data.moviesList!.result![index].title!,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
    }
  }
}
