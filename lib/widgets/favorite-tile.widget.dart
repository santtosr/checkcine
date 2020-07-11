import 'package:flutter/material.dart';
import 'package:checkcine/classes/favorite.dart';

import 'package:checkcine/widgets/show_dialog_delete.widget.dart';
import 'package:checkcine/routes/app_routes.dart';

class FavoriteTile extends StatefulWidget {
  final Favorite favorite;

  const FavoriteTile(this.favorite);

  @override
  _FavoriteTileState createState() => _FavoriteTileState();
}

class _FavoriteTileState extends State<FavoriteTile> {
  _edit() {
    if (widget.favorite.type == 'serie') {
      Navigator.of(context).pushNamed(
        AppRoutes.ADD_SERIE,
        arguments: widget.favorite,
      );
    } else if (widget.favorite.type == 'movie') {
      Navigator.of(context).pushNamed(
        AppRoutes.ADD_MOVIE,
        arguments: widget.favorite,
      );
    }
  }

  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Color(0xFF368B61),
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: ListTile(
        
        title: Text(widget.favorite.title),
        subtitle: Text(widget.favorite.category),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit, color: Color(0xFF368B61)),
                onPressed: _edit,
              ),
              IconButton(
                icon: widget.favorite.watched
                    ? Icon(
                        Icons.check_circle,
                        color: Color(0xFF368B61),
                      )
                    : Icon(
                        Icons.check_circle_outline,
                        color: Color(0xFF368B61),
                      ),
                onPressed: () {
                  setState(() {
                    widget.favorite.watched = !widget.favorite.watched;
                  });
                },
              ),
              // IconButton(
              //   icon: Icon(Icons.delete),
              //   onPressed: () {
              //     ShowDialogDelete.show(context, widget.favorite);
              //   },
              // ),
            ],
          ),
        ),
        onTap: () {
          if (widget.favorite.type == 'serie') {
            Navigator.of(context).pushNamed(
              AppRoutes.READFAVSERIE,
              arguments: widget.favorite,
            );
          } else if (widget.favorite.type == 'movie') {
            Navigator.of(context).pushNamed(
              AppRoutes.READFAVMOVIE,
              arguments: widget.favorite,
            );
          }
        },
      ),
      confirmDismiss: (DismissDirection direction) async {
        return await ShowDialogDelete.show(context, widget.favorite);
      },
      onDismissed: (direction) {},
    );
  }

}
