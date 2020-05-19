import 'package:flutter/material.dart';
import 'package:checkcine/routes/app_routes.dart';
import 'package:responsive/responsive.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              ResponsiveRow(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 350,
                    width: 350,
                    child: Image.asset("assets/images/icon_logo.png"),
                  ),
                  Container(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Check Cine\n",
                        style: TextStyle(
                          fontSize: 70.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w200,
                          fontFamily: "Roboto",
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Lista de Filmes e Séries',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w100),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
               Padding(
                padding: EdgeInsets.only(top: 175),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF2B6A4B),
                  ),
                  child: FlatButton(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Entrar",
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Roboto",
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.HOME);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
