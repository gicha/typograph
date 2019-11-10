import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:typograph/blocs/blocs.dart';
import 'package:typograph/res/res.dart';
import 'package:typograph/screens/auth/provider.dart';
import 'package:typograph/socket/socket.dart';

import '../../../res/res.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key key, @required this.provider}) : super(key: key);
  final AuthProvider provider;

  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  AuthProvider get provider => widget.provider;
  ChatBloc get chatBloc => provider.chatBloc;
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: chatBloc,
        builder: (BuildContext context, ChatState state) {
          return Container(
            width: width,
            height: height,
            child: Center(
              child: GestureDetector(
                onTap: () async {
                  File file =
                      await ImagePicker.pickImage(source: ImageSource.camera);
                  ITSocket.init(
                      base64: "data:image/jpg;base64," +
                          base64Encode(file.readAsBytesSync()));
                  InitBloc.getInstance().dispatch(LoadingInitEvent());
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: ITColors.text.withOpacity(.2),
                      shape: BoxShape.circle),
                  width: 100,
                  height: 100,
                  child: Center(
                    child: Icon(
                      Icons.photo_camera,
                      color: ITColors.primary,
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
