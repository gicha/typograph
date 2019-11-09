import 'package:typograph/res/res.dart';
import 'package:flutter/material.dart';
import 'package:typograph/screens/auth/index.dart';

import 'blocs/bloc.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  AuthProvider authProvider;
  AuthBloc authBloc;
  @override
  void initState() {
    authBloc = AuthBloc();
    authProvider = AuthProvider(authBloc);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ITColors.bg,
      body: AuthScreen(authProvider: authProvider),
    );
  }
}
