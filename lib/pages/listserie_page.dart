import 'package:flutter/material.dart';
import 'package:checkcine/provider/favorites.provider-serie.dart';
import 'package:checkcine/widgets/floac_act_but_fav.dart';

import 'package:checkcine/widgets/list-constructor.dart';
import 'package:provider/provider.dart';

import '../layout.dart';

class ListSeriePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FavoriteSerieProvider series = Provider.of(context);
    final content = Column(
      children: <Widget>[
        ListConstructor.searchBar(),
        ListConstructor(
          type: 'serie',
          favorite: series,
        ),
      ],
    );
    final nameAppBar = 'Lista Serie';
    final fActBut = FloatButFav.floatAct(context, 'serie');
    return Layout.getContent(
      context,
      content,
      nameAppBar,
      fActBut,
    );
  }
}
