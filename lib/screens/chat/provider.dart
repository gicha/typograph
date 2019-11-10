import 'package:flutter/material.dart';
import 'package:typograph/blocs/blocs.dart';

class ChatProvider {
  ChatProvider({
    @required this.focus,
    @required this.inputController,
    @required this.chatBloc,
    @required this.scrollController,
  });

  // blocs
  final ChatBloc chatBloc;
  final FocusNode focus;
  final TextEditingController inputController;
  final ScrollController scrollController;
  // controllers

}
