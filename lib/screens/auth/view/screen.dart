import 'package:typograph/generated/i18n.dart';
import 'package:typograph/res/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:typograph/screens/main/blocs/index.dart';
import 'package:typograph/utils/utils.dart';
import 'package:typograph/widgets/custom_behavor.dart';
import 'package:typograph/widgets/loading.dart';

import '../index.dart';
import '../provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({
    @required this.authProvider,
  });

  final AuthProvider authProvider;

  @override
  AuthScreenState createState() {
    return AuthScreenState(authProvider);
  }
}

class AuthScreenState extends State<AuthScreen> {
  AuthScreenState(this.authProvider);
  final AuthProvider authProvider;
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocus = FocusNode();

  submit(context) {
    if (emailController.value.text.length == 0 || passwordController.value.text.length == 0) {
      Scaffold.of(context).removeCurrentSnackBar();
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(I18n.of(context).allFields)));
    } else if (!Utils.validateEmail(emailController.value.text)) {
      Scaffold.of(context).removeCurrentSnackBar();
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(I18n.of(context).wrongEmail)));
    } else if (passwordController.value.text.length < 8) {
      Scaffold.of(context).removeCurrentSnackBar();
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(I18n.of(context).minPassLength)));
    } else
      authProvider.login(
        context,
        email: emailController.value.text,
        password: passwordController.value.text,
      );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: authProvider.authBloc,
      builder: (BuildContext context, AuthState currentState) {
        if (currentState is ProcessAuthState)
          return ITLoading();
        else {
          List<Widget> body = [
            SizedBox(height: height * .1),
            title(),
            SizedBox(height: height * .025),
            buildForm(),
            SizedBox(height: height * .025),
            buildLoginButton(),
            SizedBox(height: height * .025),
            toRegistrationButton(),
          ];
          return ScrollConfiguration(
            behavior: CustomBehavior(),
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(body.length, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: width * .08),
                    child: body[index],
                  );
                }),
              ),
            ),
          );
        }
      },
    );
  }

  Widget title() {
    return Container(
      height: 64,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            child: Text(
              I18n.of(context).title,
              style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Oswald',
                  color: Theme.of(context).textTheme.title.color),
            ),
          ),
          Positioned(
            bottom: -10,
            child: Text(
              I18n.of(context).title,
              style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Oswald',
                  color: Theme.of(context).textTheme.title.color.withOpacity(.1)),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildForm() {
    return Form(
      autovalidate: true,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: emailController,
            focusNode: emailFocus,
            decoration: InputDecoration(labelText: I18n.of(context).email),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (term) => passwordFocus.requestFocus(),
          ),
          SizedBox(height: 12),
          TextFormField(
            controller: passwordController,
            focusNode: passwordFocus,
            obscureText: true,
            decoration: InputDecoration(labelText: I18n.of(context).password),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (term) => submit(context),
          ),
        ],
      ),
    );
  }

  Widget buildLoginButton() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          I18n.of(context).login,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: ITColors.text),
        ),
        GestureDetector(
          onTap: () => submit(context),
          child: Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: ITColors.primary),
            height: 64,
            width: 64,
            child: Center(
              child: Icon(
                Icons.keyboard_arrow_right,
                color: ITColors.bg,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget toRegistrationButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () => MainScreenBloc.getInstance().dispatch(ChangeAuthStatusMainEvent(AuthStatus.regisration)),
          child: Text(
            I18n.of(context).register,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                color: Theme.of(context).accentColor),
          ),
        ),
      ],
    );
  }
}
