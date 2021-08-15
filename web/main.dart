import 'dart:html';
import 'TodoAction.dart';


void onInputChange (event) {
  print('${event.target.value} Testing');
}

void onActionDelete (event, TodoAction action) {
    var lists = querySelector('ul#to-do-list');
    var actionsLists = action.getList();
    actionsLists.removeWhere((element) => element.getActionId() == action.getActionId());
    lists?.children.removeWhere((element) => element.id == action.getActionId());
}

void onFormSubmit (event) {
  event.stopPropagation();
  event.preventDefault();
  var inputElement = querySelector('#to-do-input');

  var value = (inputElement as InputElement).value;
  if(value != null) {
    var new_to_do_action = TodoAction.fromString(value);
    var lists = querySelector('ul#to-do-list');

    var listElement = LIElement();
    var spanElement = SpanElement();
    var deleteButton = ButtonElement();
    deleteButton.text = 'Delete';
    deleteButton.onClick.listen((event) => onActionDelete(event, 
      new_to_do_action
    ));
    spanElement.text = new_to_do_action.getAction();
    listElement.id = new_to_do_action.getActionId();
    listElement.children.addAll([spanElement, deleteButton]);
    lists?.children.add(listElement);
  }

  inputElement.value = '';
}

void main() {
  var form = querySelector('#to-do-form');
  form?.onSubmit.listen(onFormSubmit);

}
