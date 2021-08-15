class TodoAction {
  final String _text;
  final _id;

  static List<TodoAction> _actionLists = [];

  TodoAction(): _id = DateTime.now().toIso8601String(), _text= '' {
    _actionLists.add(this);
  }
  TodoAction.fromString(String textString): _id =  DateTime.now().toIso8601String(), _text= textString {
    _actionLists.add(this);
  }

  String getAction() {
    return _text;
  }

  String getActionId () {
    return _id;
  }

  List<TodoAction> getList() {
    return TodoAction._actionLists;
  }
}