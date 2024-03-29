import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:typograph/res/text_style.dart';
import 'package:typograph/screens/auth/index.dart';
import 'package:typograph/widgets/loading.dart';

import 'blocs/blocs.dart';

import 'generated/i18n.dart';
import 'res/res.dart';
import 'screens/main/index.dart';
import 'screens/splash/index.dart';

bool isInDebugMode = false;
void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    if (isInDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };

  runZoned<Future<void>>(() async {
    startHome();
  }, onError: (error, stackTrace) async {
    print('Caught error: $error');
    print(stackTrace);
  });
}

void startHome() async {
  InitBloc bloc = InitBloc.getInstance();
  NotificationBloc notificationBloc = NotificationBloc.getInstance();
  DialogBloc dialogBloc = DialogBloc.getInstance();

  bloc.dispatch(InitInitEvent());

  final i18n = I18n.delegate;
  runApp(
    Builder(
      builder: (context) {
        return DynamicTheme(
          defaultBrightness: Brightness.light,
          data: (brightness) => darkTheme,
          themedWidgetBuilder: (context, theme) {
            return CupertinoApp(
              showSemanticsDebugger: false,
              debugShowCheckedModeBanner: false,
              navigatorObservers: [],
              theme: CupertinoThemeData(
                  brightness: theme.brightness,
                  primaryColor: theme.primaryColor,
                  scaffoldBackgroundColor: theme.scaffoldBackgroundColor,
                  barBackgroundColor: theme.scaffoldBackgroundColor,
                  primaryContrastingColor: theme.primaryColor,
                  textTheme: CupertinoTextThemeData(textStyle: theme.textTheme.title)),
              localizationsDelegates: [
                i18n,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: i18n.supportedLocales,
              localeResolutionCallback: i18n.resolution(fallback: new Locale("ru", "RU")),
              home: Theme(
                data: theme,
                child: Builder(
                  builder: (context) {
                    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
                      return Center(child: Text("Ошибка: ${errorDetails.exception}"));
                    };
                    return MultiBlocListener(
                      listeners: [
                        BlocListener<NotificationBloc, NotificationState>(
                          bloc: notificationBloc,
                          listener: (context, state) {
                            if (state.text != null)
                              showDialog(context: context, builder: (context) => AlertDialog(title: Text(state.text)));
                          },
                        ),
                        BlocListener(
                          bloc: dialogBloc,
                          listener: (context, state) {
                            if (state is OpenedDialogState)
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(state.text),
                                      actions: <Widget>[
                                        FlatButton(
                                          onPressed: () {
                                            state.confirm();
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            I18n.of(context).confirm,
                                            style: ITTextStyle(color: Theme.of(context).primaryColor),
                                          ),
                                        ),
                                        FlatButton(
                                          onPressed: () => Navigator.pop(context),
                                          child: Text(I18n.of(context).cancel),
                                        )
                                      ],
                                    );
                                  });
                          },
                        ),
                      ],
                      child: BlocProvider(
                        builder: (context) => bloc,
                        child: BlocBuilder(
                          bloc: bloc,
                          builder: (context, state) {
                            if (state == InitState.noUser) return AuthScreen();
                            if (state == InitState.loading)
                              return Scaffold(backgroundColor: ITColors.bg, body: ITLoading());
                            if (state == InitState.notInitedLoading) return SplashScreen();
                            if (state == InitState.inited) return MainScreen();
                            return Container();
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    ),
  );
}
