import 'dart:io';
import 'package:checkcine/provider/favorites.provider-movie.dart';
import 'package:checkcine/provider/favorites.provider-serie.dart';
import 'package:checkcine/widgets/camp_form.widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:checkcine/classes/favorite.dart';
import 'package:provider/provider.dart';

class AddItem extends StatefulWidget {
  final String type;
  AddItem({@required this.type});

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  File imageFile;
  dynamic _form = GlobalKey<FormState>();
  Map<String, Object> _formData = {};

  Widget _decideImageView() {
    if (imageFile == null && _formData['cover'] == null) {
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
      if (imageFile != null) {
        return Image.file(imageFile, height: 250, width: 175);
      } else {
        return Image.file(_formData['cover'], height: 250, width: 175);
      }
    }
  }

  void _loadFormData(Favorite favEdit) {
    if (favEdit != null) {
      _formData['id'] = favEdit.id;
      _formData['title'] = favEdit.title;
      _formData['category'] = favEdit.category;
      _formData['description'] = favEdit.description;
      _formData['cover'] = favEdit.cover;
      _formData['watched'] = favEdit.watched;
      _formData['type'] = favEdit.type;
    }
  }

  Future<void> _openGallary(BuildContext ctx) async {
    var picture = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );

    FocusScope.of(context).unfocus(focusPrevious: true);
    setState(() {
      imageFile = picture;
      _formData['cover'] = imageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Favorite favEdit = ModalRoute.of(context).settings.arguments;
    _loadFormData(favEdit);
    //print(favEdit.title);
    return ListView(
      children: <Widget>[
        Form(
          key: _form,
          child: Column(
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
                      child: FlatButton(
                        child: _decideImageView(),
                        onPressed: () {
                          _openGallary(context);
                        },
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SizedBox(
                        height: 25,
                      ),
                      CampForm(
                        heightSB: 30,
                        widthSB: 175,
                        heightC: 40,
                        widthC: 175,
                        textSB: 'Título:',
                        paddingB: 0,
                        paddingL: 10,
                        paddingT: 5,
                        paddingR: 10,
                        formData: _formData,
                      ),
                      Divider(),
                      CampForm(
                        heightSB: 30,
                        widthSB: 175,
                        heightC: 40,
                        widthC: 175,
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
              CampForm(
                heightSB: 30,
                widthSB: 375,
                heightC: 250,
                widthC: 375,
                textSB: 'Descrição',
                paddingB: 10,
                paddingL: 10,
                paddingT: 15,
                paddingR: 10,
                maxLines: 1024,
                maxLength: 1024,
                formData: _formData,
              ),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 15, left: 35, bottom: 100),
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  color: Color(0xFF368B61),
                  borderRadius: BorderRadius.all(
                    Radius.circular(3),
                  ),
                ),
                child: FlatButton(
                  child: Center(
                    child: Text(
                      "Salvar",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  onPressed: () {
                    bool isValid = _form.currentState.validate();

                    if (isValid) {
                      _form.currentState.save();
                      if (widget.type == 'movie') {
                        Provider.of<FavoriteMovieProvider>(context,
                                listen: false)
                            .put(
                          Favorite(
                            id: _formData['id'],
                            title: _formData['title'],
                            watched: _formData['watched'],
                            description: _formData['description'],
                            category: _formData['category'],
                            cover: (imageFile != null)
                                ? imageFile
                                : _formData['cover'],
                          ),
                        );
                      } else {
                        Provider.of<FavoriteSerieProvider>(context,
                                listen: false)
                            .put(
                          Favorite(
                            id: _formData['id'],
                            title: _formData['title'],
                            watched: _formData['watched'],
                            description: _formData['description'],
                            category: _formData['category'],
                            cover: (imageFile != null)
                                ? imageFile
                                : _formData['cover'],
                          ),
                        );
                      }
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 100),
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                    color: Color(0xFF368B61),
                    borderRadius: BorderRadius.all(Radius.circular(3))),
                child: FlatButton(
                  child: Center(
                    child: Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context, false),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}
