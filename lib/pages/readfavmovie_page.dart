import 'package:flutter/material.dart';
import 'package:checkcine/layout.dart';
import 'package:checkcine/widgets/read-item.widget.dart';

class ReadFavoriteMovie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String nameAppBar = "Filme";
    final content = ReadItem();

    return Layout.getContent(
      context,
      content,
      nameAppBar,
    );
  }
}
