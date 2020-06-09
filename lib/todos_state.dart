import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:state_notifier_todo/todo.dart';
import 'package:uuid/uuid.dart';

part 'todos_state.freezed.dart';

@freezed
abstract class TodosState with _$TodosState {
  const factory TodosState({
    @Default(<Todo>[]) List<Todo> todos,
  }) = TodosStateData;
  const factory TodosState.loading({
    @Default(<Todo>[]) List<Todo> todos,
  }) = TodosStateLoading;
}

class TodosController extends StateNotifier<TodosState> with LocatorMixin {
  TodosController() : super(const TodosState.loading());

  final _uuid = Uuid();

  @override
  void initState() async {
    super.initState();

    await Future<void>.delayed(const Duration(seconds: 3));

    state = TodosState(
      todos: [
        Todo(id: _uuid.v4(), title: '朝食を食べる'),
        Todo(id: _uuid.v4(), title: 'ラジオ体操をやる'),
        Todo(id: _uuid.v4(), title: '薬を飲む'),
      ],
    );
  }

  void add(String title) {
    final todos = state.todos.toList()
      ..add(
        Todo(id: _uuid.v4(), title: title),
      );
    state = state.copyWith(
      todos: todos,
    );
  }

  void toggle(Todo todo) {
    final todos = state.todos.map((t) {
      if (t == todo) {
        return t.copyWith(
          completed: !t.completed,
        );
      }
      return t;
    }).toList();
    state = state.copyWith(
      todos: todos,
    );
  }
}
