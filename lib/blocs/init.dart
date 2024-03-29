part of blocs;

/// Init bloc
/// Used when app starts
/// Prepared and initialize app data
/// {@category Global blocs}
abstract class InitEvent {}

class InitInitEvent extends InitEvent {}

class ForceInitEvent extends InitEvent {}

class LoadingInitEvent extends InitEvent {}

class LoginInitEvent extends InitEvent {}

enum InitState { notInitedLoading, loading, inited, noUser, afterRegistration }

class InitBloc extends Bloc<InitEvent, InitState> {
  static InitBloc _instance;

  static InitBloc getInstance() {
    if (_instance == null) _instance = InitBloc();
    return _instance;
  }

  @override
  InitState get initialState => InitState.notInitedLoading;

  @override
  Stream<InitState> mapEventToState(InitEvent event) async* {
    if (event is InitInitEvent) {
      yield InitState.notInitedLoading;
      await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
      if (Platform.isAndroid)
        debugDefaultTargetPlatformOverride = TargetPlatform.android;
      else
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      await DataBase().open();
      await initializeDateFormatting();
      var store = StoreRef<String, dynamic>.main();
      Config.userId = await store.record("userId").get(DataBase.db);
      if (Config.userId != null) {
        ITSocket.init();
      } else
        yield InitState.noUser;
    }
    if (event is LoadingInitEvent) yield InitState.loading;
    if (event is ForceInitEvent) {
      var store = StoreRef<String, dynamic>.main();
      Config.userId = await store.record("userId").put(DataBase.db, Config.userId);
      yield InitState.inited;
    }
    if (event is LoginInitEvent) {
      Config.userId = null;
      yield InitState.noUser;
    }
  }
}
