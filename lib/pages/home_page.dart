import 'package:flutter/material.dart';
import 'package:checkcine/provider/favorites.provider-movie.dart';
import 'package:checkcine/provider/favorites.provider-serie.dart';
import 'package:checkcine/routes/app_routes.dart';
import 'package:checkcine/widgets/floatActBut-home.widget.Dart';
import 'package:checkcine/widgets/list-constructor.dart';
import 'package:provider/provider.dart';
import '../layout.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final FavoriteMovieProvider movie = Provider.of(context);
    final FavoriteSerieProvider serie = Provider.of(context);
    final String nameAppBar = "   Início";
    final content = Column(
      children: <Widget>[
        ListConstructor.searchBar(),
        Padding(
          padding: EdgeInsets.only(top: 20, right: 100, left: 100),
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: 'Adicionados Recentes',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey,
                fontWeight: FontWeight.w100,
                fontFamily: "Roboto",
              ),
            ),
          ),
        ),
        Divider(
          endIndent: 20,
          indent: 20,
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: 'Filmes:',
              style: TextStyle(
                fontSize: 20.0,
                color: Color(0xFF368B61),
                fontWeight: FontWeight.w500,
                fontFamily: "Roboto",
              ),
            ),
          ),
        ),
        ListConstructor(
          type: 'movie',
          favorite: movie,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color(0xFF1F4432),
          ),
          child: FlatButton(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Mais",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                  fontFamily: "Roboto",
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.LIST_MOVIE);
            },
          ),
        ),
        Divider(
          endIndent: 20,
          indent: 20,
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: 'Séries:',
              style: TextStyle(
                fontSize: 20.0,
                color: Color(0xFF368B61),
                fontWeight: FontWeight.w500,
                fontFamily: "Roboto",
              ),
            ),
          ),
        ),
        ListConstructor(
          type: 'serie',
          favorite: serie,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xFF1F4432),
            ),
            child: FlatButton(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Mais",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.LIST_SERIE);
              },
            ),
          ),
        ),
      ],
    );
    final fActBut = FloatActBut();
    return Layout.getContent(
      context,
      content,
      nameAppBar,
      fActBut,
    );
  }
}
