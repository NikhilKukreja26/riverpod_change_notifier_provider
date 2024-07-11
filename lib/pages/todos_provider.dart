import 'package:change_notifier_provider/models/todo_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodosNotifier extends ChangeNotifier {
  List<Todo> todos = [];

  void addTodo(String desc) {
    todos.add(Todo.add(desc: desc));
    notifyListeners();
  }

  void toggleTodo(String id) {
    final todo = todos.firstWhere((e) => e.id == id);
    todo.completed = !todo.completed;
    notifyListeners();
  }

  void removeTodo(String id) {
    todos.removeWhere((e) => e.id == id);
    notifyListeners();
  }
}

final todosProvider = ChangeNotifierProvider<TodosNotifier>((ref) {
  return TodosNotifier();
});
