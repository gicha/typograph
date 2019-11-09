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
      await initializeDateFormatting();
      var store = StoreRef<String, dynamic>.main();
      Config.userId = await store.record("userId").get(DataBase.db);
      if (Config.userId != null) {
        ITSocket.init();
      } else {
        File file = await ImagePicker.pickImage(source: ImageSource.camera);
        ITSocket.init(base64: "data:image/jpg;base64," + base64Encode(file.readAsBytesSync()));
      }
    }
    if (event is ForceInitEvent) {
      var store = StoreRef<String, dynamic>.main();
      Config.userId = await store.record("userId").put(DataBase.db, Config.userId);
      yield InitState.inited;
    }
  }
}
