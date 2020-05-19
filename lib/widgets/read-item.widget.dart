import 'dart:io';
import 'package:flutter/material.dart';
import 'package:checkcine/classes/favorite.dart';

import 'camp_form_noedit.dart';

class ReadItem extends StatefulWidget {
  @override
  _ReadItemState createState() => _ReadItemState();
}

class _ReadItemState extends State<ReadItem> {
  File imageFile;
  Map<String, Object> _formData = {};

  Widget _decideImageView() {
    if (_formData['cover'] == null) {
      return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "ADD ",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto",
          ),
        ),
      );
    } else {
      return Image.file(_formData['cover'], height: 250, width: 175);
    }
  }

  void _loadFormData(Favorite fav) {
    if (fav != null) {
      _formData['id'] = fav.id;
      _formData['title'] = fav.title;
      _formData['category'] = fav.category;
      _formData['description'] = fav.description;
      _formData['cover'] = fav.cover;
      _formData['type'] = fav.type;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Favorite fav = ModalRoute.of(context).settings.arguments;
    _loadFormData(fav);
    //print(favEdit.title);
    return ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Container(
                    height: 250,
                    width: 175,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF2B6A4B),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Container(
                      child: Center(
                        child: _decideImageView(),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CampFormNoEdit(
                      heightSB: 30,
                      widthSB: 200,
                      heightC: 40,
                      widthC: 200,
                      textSB: 'Título:',
                      paddingB: 0,
                      paddingL: 10,
                      paddingT: 5,
                      paddingR: 10,
                      formData: _formData,
                    ),
                    Divider(),
                    CampFormNoEdit(
                      heightSB: 30,
                      widthSB: 200,
                      heightC: 40,
                      widthC: 200,
                      textSB: 'Categoria:',
                      paddingB: 10,
                      paddingL: 10,
                      paddingT: 5,
                      paddingR: 10,
                      formData: _formData,
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              height: 20,
            ),
            CampFormNoEdit(
              heightSB: 20,
              widthSB: 375,
              heightC: 250,
              widthC: 375,
              textSB: 'Descrição',
              paddingB: 10,
              paddingL: 10,
              paddingT: 15,
              paddingR: 10,
              formData: _formData,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(right: 15, left: 15, top: 80),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                color: Color(0xFF368B61),
                borderRadius: BorderRadius.all(Radius.circular(3))),
            child: FlatButton(
              child: Center(
                child: Text(
                  "Voltar",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              onPressed: () => Navigator.pop(context, false),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}
