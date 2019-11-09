part of blocs;

enum LoadStatus { loading, loaded, error }

abstract class ChatEvent {}

//событие получения сообщений
class FetchChat extends ChatEvent {
  final List<Message> chat;
  FetchChat({@required this.chat});
}

class NewMessageChat extends ChatEvent {
  final Message message;
  NewMessageChat({@required this.message});
}

//событие отправки сообщений
class SendMessage extends ChatEvent {
  final String message;
  SendMessage({@required this.message});
}

class TypingMessage extends ChatEvent {
  final String message;
  TypingMessage({@required this.message});
}

class NewUserTyping extends ChatEvent {
  final UserTyping userTyping;
  NewUserTyping({@required this.userTyping});
}

class DerivedMessage extends ChatEvent {}

class ChatState {
  List<Message> chat = [];
  UserTyping userTyping;
  String newMessage;
  LoadStatus newMessageStatus = LoadStatus.loaded;
  LoadStatus loadStatus = LoadStatus.loaded;

  ChatState();

  ChatState copyWith({
    List<Message> chat,
    UserTyping userTyping,
    String newMessage,
    LoadStatus newMessageStatus = LoadStatus.loaded,
    LoadStatus loadStatus = LoadStatus.loaded,
  }) {
    return ChatState()
      ..chat = chat ?? this.chat
      ..userTyping = userTyping ?? this.userTyping
      ..newMessage = newMessage ?? this.newMessage
      ..newMessageStatus = newMessageStatus ?? this.newMessageStatus
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
    if (event is FetchChat) yield currentState.copyWith(chat: event.chat, loadStatus: LoadStatus.loaded);
    if (event is NewMessageChat) {
      currentState.chat.add(event.message);
      yield currentState.copyWith(chat: currentState.chat, loadStatus: LoadStatus.loaded);
    }
    if (event is DerivedMessage) yield currentState.copyWith(newMessageStatus: LoadStatus.loaded, newMessage: null);
    if (event is SendMessage) {
      yield currentState.copyWith(newMessageStatus: LoadStatus.loading, newMessage: event.message);
      ITSocket.send(event.message);
    }
    if (event is TypingMessage) ITSocket.typing(event.message);
    if (event is NewUserTyping) yield currentState.copyWith(userTyping: event.userTyping);
  }
}
