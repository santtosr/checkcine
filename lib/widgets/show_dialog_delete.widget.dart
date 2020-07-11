import 'package:flutter/material.dart';
import 'package:checkcine/classes/favorite.dart';
import 'package:checkcine/provider/favorites.provider-movie.dart';
import 'package:checkcine/provider/favorites.provider-serie.dart';
import 'package:provider/provider.dart';


class ShowDialogDelete {
  static show(BuildContext context, Favorite fav) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Excluir'),
        content: Text('Tem certeza que deseja excluir esse item da sua lista?'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Não'),
          ),
          FlatButton(
            onPressed: () {
              if (fav.type == 'serie') {
                Provider.of<FavoriteSerieProvider>(context, listen: false)
                    .remove(fav);
              } else {
                Provider.of<FavoriteMovieProvider>(context, listen: false)
                    .remove(fav);
              }
              Navigator.of(context).pop();
            },
            child: Text('Sim'),
          ),
        ],
      ),
    );
  }
}
