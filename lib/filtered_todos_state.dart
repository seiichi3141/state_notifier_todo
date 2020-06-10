import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:state_notifier_todo/todo.dart';
import 'package:state_notifier_todo/todos_state.dart';

part 'filtered_todos_state.freezed.dart';

@freezed
abstract class FilteredTodosState with _$FilteredTodosState {
  const factory FilteredTodosState({
    @Default(false) bool completed,
    @Default(<Todo>[]) List<Todo> todos,
  }) = FilteredTodosStateData;
}

class FilteredTodosController extends StateNotifier<FilteredTodosState>
    with LocatorMixin {
  FilteredTodosController() : super(const FilteredTodosState());

  @override
  void update(Locator watch) {
    super.update(watch);

    // TodosStateを監視、stateがTodosStateDataなら更新されたtodosが渡されてくる、そのほかのstateは無視する
    watch<TodosState>().maybeWhen((todos) {
      state = state.copyWith(
        completed: state.completed,
        todos: _filteredTodos(todos, completed: state.completed),
      );
    }, orElse: () => null);
  }

  List<Todo> _filteredTodos(List<Todo> todos, {bool completed}) {
    return todos
        .where((todo) => completed ? todo.completed : !todo.completed)
        .toList();
  }

  void toggle() {
    final completed = !state.completed;
    read<TodosState>().maybeWhen((todos) {
      state = state.copyWith(
        completed: completed,
        todos: _filteredTodos(todos, completed: completed),
      );
    }, orElse: () => null);
  }
}
