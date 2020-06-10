// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'todos_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$TodosStateTearOff {
  const _$TodosStateTearOff();

  TodosStateData call({List<Todo> todos = const <Todo>[]}) {
    return TodosStateData(
      todos: todos,
    );
  }

  TodosStateLoading loading() {
    return const TodosStateLoading();
  }
}

// ignore: unused_element
const $TodosState = _$TodosStateTearOff();

mixin _$TodosState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Todo> todos), {
    @required Result loading(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Todo> todos), {
    Result loading(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(TodosStateData value), {
    @required Result loading(TodosStateLoading value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(TodosStateData value), {
    Result loading(TodosStateLoading value),
    @required Result orElse(),
  });
}

abstract class $TodosStateCopyWith<$Res> {
  factory $TodosStateCopyWith(
          TodosState value, $Res Function(TodosState) then) =
      _$TodosStateCopyWithImpl<$Res>;
}

class _$TodosStateCopyWithImpl<$Res> implements $TodosStateCopyWith<$Res> {
  _$TodosStateCopyWithImpl(this._value, this._then);

  final TodosState _value;
  // ignore: unused_field
  final $Res Function(TodosState) _then;
}

abstract class $TodosStateDataCopyWith<$Res> {
  factory $TodosStateDataCopyWith(
          TodosStateData value, $Res Function(TodosStateData) then) =
      _$TodosStateDataCopyWithImpl<$Res>;
  $Res call({List<Todo> todos});
}

class _$TodosStateDataCopyWithImpl<$Res> extends _$TodosStateCopyWithImpl<$Res>
    implements $TodosStateDataCopyWith<$Res> {
  _$TodosStateDataCopyWithImpl(
      TodosStateData _value, $Res Function(TodosStateData) _then)
      : super(_value, (v) => _then(v as TodosStateData));

  @override
  TodosStateData get _value => super._value as TodosStateData;

  @override
  $Res call({
    Object todos = freezed,
  }) {
    return _then(TodosStateData(
      todos: todos == freezed ? _value.todos : todos as List<Todo>,
    ));
  }
}

class _$TodosStateData with DiagnosticableTreeMixin implements TodosStateData {
  const _$TodosStateData({this.todos = const <Todo>[]}) : assert(todos != null);

  @JsonKey(defaultValue: const <Todo>[])
  @override
  final List<Todo> todos;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TodosState(todos: $todos)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TodosState'))
      ..add(DiagnosticsProperty('todos', todos));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TodosStateData &&
            (identical(other.todos, todos) ||
                const DeepCollectionEquality().equals(other.todos, todos)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(todos);

  @override
  $TodosStateDataCopyWith<TodosStateData> get copyWith =>
      _$TodosStateDataCopyWithImpl<TodosStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Todo> todos), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(todos);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Todo> todos), {
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(todos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(TodosStateData value), {
    @required Result loading(TodosStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(TodosStateData value), {
    Result loading(TodosStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class TodosStateData implements TodosState {
  const factory TodosStateData({List<Todo> todos}) = _$TodosStateData;

  List<Todo> get todos;
  $TodosStateDataCopyWith<TodosStateData> get copyWith;
}

abstract class $TodosStateLoadingCopyWith<$Res> {
  factory $TodosStateLoadingCopyWith(
          TodosStateLoading value, $Res Function(TodosStateLoading) then) =
      _$TodosStateLoadingCopyWithImpl<$Res>;
}

class _$TodosStateLoadingCopyWithImpl<$Res>
    extends _$TodosStateCopyWithImpl<$Res>
    implements $TodosStateLoadingCopyWith<$Res> {
  _$TodosStateLoadingCopyWithImpl(
      TodosStateLoading _value, $Res Function(TodosStateLoading) _then)
      : super(_value, (v) => _then(v as TodosStateLoading));

  @override
  TodosStateLoading get _value => super._value as TodosStateLoading;
}

class _$TodosStateLoading
    with DiagnosticableTreeMixin
    implements TodosStateLoading {
  const _$TodosStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TodosState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'TodosState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is TodosStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Todo> todos), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Todo> todos), {
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(TodosStateData value), {
    @required Result loading(TodosStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(TodosStateData value), {
    Result loading(TodosStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TodosStateLoading implements TodosState {
  const factory TodosStateLoading() = _$TodosStateLoading;
}
