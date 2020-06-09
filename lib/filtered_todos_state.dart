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
  const factory FilteredTodosState.loading({
    @Default(false) bool completed,
    @Default(<Todo>[]) List<Todo> todos,
  }) = FilteredTodosStateLoading;
}

class FilteredTodosController extends StateNotifier<FilteredTodosState>
    with LocatorMixin {
  FilteredTodosController() : super(const FilteredTodosState.loading());

  @override
  void update(Locator watch) {
    super.update(watch);

    watch<TodosState>().maybeWhen((todos) {
      state = FilteredTodosState(
        completed: state.completed,
        todos: filteredTodos(todos, completed: state.completed),
      );
    }, orElse: () => null);
  }

  void toggle() {
    final completed = !state.completed;
    read<TodosState>().maybeWhen((todos) {
      state = FilteredTodosState(
        completed: completed,
        todos: filteredTodos(todos, completed: completed),
      );
    }, orElse: () => null);
  }

  List<Todo> filteredTodos(List<Todo> todos, {bool completed}) {
    return todos
        .where((todo) => completed ? todo.completed : !todo.completed)
        .toList();
  }
}
