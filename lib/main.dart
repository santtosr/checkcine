import 'package:flutter/material.dart';
import 'package:checkcine/pages/addmovie_page.dart';
import 'package:checkcine/pages/addserie_page.dart';
import 'package:checkcine/pages/home_page.dart';
import 'package:checkcine/pages/listserie_page.dart';
import 'package:checkcine/pages/login_page.dart';
import 'package:checkcine/pages/readfavmovie_page.dart';
import 'package:checkcine/pages/readfavserie_page.dart';
import 'package:checkcine/provider/favorites.provider-movie.dart';
import 'package:checkcine/provider/favorites.provider-serie.dart';
import 'package:checkcine/routes/app_routes.dart';
import 'package:provider/provider.dart';

import 'pages/listmovie_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoriteMovieProvider>(
          create: (ctx) => FavoriteMovieProvider(),
        ),
        ChangeNotifierProvider<FavoriteSerieProvider>(
          create: (ctx) => FavoriteSerieProvider(),
        )
      ],
      child: MaterialApp(
          title: 'Lista de Filmes e Séries',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.dark,
            // primaryColor: Colors.grey[350],
            // accentColor: Colors.white,
          ),
          routes: {
            AppRoutes.LOGIN_PAGE: (_) => LoginPage(), //inicializar
            AppRoutes.HOME: (_) => HomePage(),
            AppRoutes.ADD_SERIE: (_) => AddSeriePage(),
            AppRoutes.ADD_MOVIE: (_) => AddMoviePage(),
            AppRoutes.LIST_MOVIE: (_) => ListMoviePage(),
            AppRoutes.LIST_SERIE: (_) => ListSeriePage(),
            AppRoutes.READFAVMOVIE: (_) => ReadFavoriteMovie(),
            AppRoutes.READFAVSERIE: (_) => ReadFavoriteSerie(),
          }),
    );
  }
}
