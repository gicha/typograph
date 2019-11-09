import 'package:sembast/sembast.dart';
import 'package:typograph/blocs/blocs.dart';
import 'package:typograph/models/models.dart';
import 'package:typograph/models/serializers.dart';
import 'package:typograph/screens/auth/index.dart';
import 'package:typograph/utils/config.dart';
import 'package:typograph/utils/database.dart';

class AuthProvider {
  AuthProvider(this.authBloc);
  final AuthBloc authBloc;
  login(context, {email, password}) async {
    authBloc.dispatch(ProcessAuthEvent());
    // String user = await AuthApi.login(email, password);
    // if (res?.token != null) {
    //   Api.init(res.token);
    //   var store = StoreRef<String, dynamic>.main();
    //   store.record("userSession").put(DataBase.db, serializers.serializeWith(UserSession.serializer, res));
    //   Config.userSession = res;
    //   InitBloc.getInstance().dispatch(ForceInitEvent());
    // } else
    //   authBloc.dispatch(IdleAuthEvent());
  }
}
