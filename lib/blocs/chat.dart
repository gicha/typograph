part of blocs;

enum LoadStatus { loading, loaded, error }

abstract class ChatEvent {}

//событие получения сообщений
class FetchChat extends ChatEvent {}

//событие очистки сообщений
class CleanChat extends ChatEvent {}

//событие отправки сообщений
class SendMessage extends ChatEvent {
  final String message;
  SendMessage({this.message});
}

class DerivedMessage extends ChatEvent {
  final Message message;
  DerivedMessage({this.message});
}

class ChatState {
  List<Message> chat = [];
  String newMessage;
  bool hasReachedMax;
  LoadStatus loadStatus = LoadStatus.loaded;

  ChatState();

  ChatState copyWith({
    List<Message> chat,
    String newMessage,
    bool hasReachedMax,
    LoadStatus loadStatus = LoadStatus.loaded,
  }) {
    return ChatState()
      ..chat = chat ?? this.chat
      ..newMessage = newMessage ?? this.newMessage
      ..hasReachedMax = hasReachedMax ?? this.hasReachedMax
      ..loadStatus = loadStatus ?? this.loadStatus;
  }
}

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  static ChatBloc _instance;
  static ChatBloc getInstance() {
    if (_instance == null) _instance = ChatBloc();
    return _instance;
  }

  @override
  ChatState get initialState => ChatState();
  NotificationBloc notificationBloc = NotificationBloc.getInstance();

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is FetchChat) {
      yield currentState.copyWith(loadStatus: LoadStatus.loading);
      await Future.delayed(Duration(seconds: 2));
      // yield currentState.copyWith(chat: chat, loadStatus: LoadStatus.loaded);
    }
    if (event is CleanChat) {
      yield currentState.copyWith(chat: []);
    }
    if (event is SendMessage) {
      yield currentState.copyWith(loadStatus: LoadStatus.loading, newMessage: event.message);
      await Future.delayed(Duration(seconds: 2));
      // currentState.chat.add(await MessageApi.send(event.message));
      yield currentState.copyWith(chat: currentState.chat, loadStatus: LoadStatus.loaded, newMessage: null);
    }
  }
}
