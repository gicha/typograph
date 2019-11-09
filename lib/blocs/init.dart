part of blocs;

/// Init bloc
/// Used when app starts
/// Prepared and initialize app data
/// {@category Global blocs}
abstract class InitEvent {}

class InitInitEvent extends InitEvent {}

class ForceInitEvent extends InitEvent {}

class RenewInitEvent extends InitEvent {}

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
      // Api.init();
      // await initializeDateFormatting();

      // var store = StoreRef<String, dynamic>.main();
      // var storeSession = await store.record("userSession").get(DataBase.db);
      // List<Performance> performances = await PerformanceApi.all();
      // if (performances != null) {
      //   PerformanceBloc.getInstance().dispatch(FetchPerformanceEvent(performances: performances));
      // }
      // UserSession userSession;
      // if (storeSession != null) userSession = serializers?.deserializeWith(UserSession.serializer, storeSession);
      // try {
      //   await AuthApi.renew(userSession.renewToken).then((UserSession userSession) {
      //     store.record("userSession").put(DataBase.db, serializers.serializeWith(UserSession.serializer, userSession));
      //     Config.userSession = userSession;
      //   });
      // } catch (e) {
      //   yield InitState.noUser;
      //   return;
      // }
      // Api.init(userSession.token);
      yield InitState.inited;
      return;
    }
    if (event is ForceInitEvent) yield InitState.inited;
  }
}
