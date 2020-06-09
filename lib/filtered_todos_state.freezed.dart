// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'filtered_todos_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$FilteredTodosStateTearOff {
  const _$FilteredTodosStateTearOff();

  FilteredTodosStateData call(
      {bool completed = false, List<Todo> todos = const <Todo>[]}) {
    return FilteredTodosStateData(
      completed: completed,
      todos: todos,
    );
  }

  FilteredTodosStateLoading loading(
      {bool completed = false, List<Todo> todos = const <Todo>[]}) {
    return FilteredTodosStateLoading(
      completed: completed,
      todos: todos,
    );
  }
}

// ignore: unused_element
const $FilteredTodosState = _$FilteredTodosStateTearOff();

mixin _$FilteredTodosState {
  bool get completed;
  List<Todo> get todos;

  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(bool completed, List<Todo> todos), {
    @required Result loading(bool completed, List<Todo> todos),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(bool completed, List<Todo> todos), {
    Result loading(bool completed, List<Todo> todos),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(FilteredTodosStateData value), {
    @required Result loading(FilteredTodosStateLoading value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(FilteredTodosStateData value), {
    Result loading(FilteredTodosStateLoading value),
    @required Result orElse(),
  });

  $FilteredTodosStateCopyWith<FilteredTodosState> get copyWith;
}

abstract class $FilteredTodosStateCopyWith<$Res> {
  factory $FilteredTodosStateCopyWith(
          FilteredTodosState value, $Res Function(FilteredTodosState) then) =
      _$FilteredTodosStateCopyWithImpl<$Res>;
  $Res call({bool completed, List<Todo> todos});
}

class _$FilteredTodosStateCopyWithImpl<$Res>
    implements $FilteredTodosStateCopyWith<$Res> {
  _$FilteredTodosStateCopyWithImpl(this._value, this._then);

  final FilteredTodosState _value;
  // ignore: unused_field
  final $Res Function(FilteredTodosState) _then;

  @override
  $Res call({
    Object completed = freezed,
    Object todos = freezed,
  }) {
    return _then(_value.copyWith(
      completed: completed == freezed ? _value.completed : completed as bool,
      todos: todos == freezed ? _value.todos : todos as List<Todo>,
    ));
  }
}

abstract class $FilteredTodosStateDataCopyWith<$Res>
    implements $FilteredTodosStateCopyWith<$Res> {
  factory $FilteredTodosStateDataCopyWith(FilteredTodosStateData value,
          $Res Function(FilteredTodosStateData) then) =
      _$FilteredTodosStateDataCopyWithImpl<$Res>;
  @override
  $Res call({bool completed, List<Todo> todos});
}

class _$FilteredTodosStateDataCopyWithImpl<$Res>
    extends _$FilteredTodosStateCopyWithImpl<$Res>
    implements $FilteredTodosStateDataCopyWith<$Res> {
  _$FilteredTodosStateDataCopyWithImpl(FilteredTodosStateData _value,
      $Res Function(FilteredTodosStateData) _then)
      : super(_value, (v) => _then(v as FilteredTodosStateData));

  @override
  FilteredTodosStateData get _value => super._value as FilteredTodosStateData;

  @override
  $Res call({
    Object completed = freezed,
    Object todos = freezed,
  }) {
    return _then(FilteredTodosStateData(
      completed: completed == freezed ? _value.completed : completed as bool,
      todos: todos == freezed ? _value.todos : todos as List<Todo>,
    ));
  }
}

class _$FilteredTodosStateData
    with DiagnosticableTreeMixin
    implements FilteredTodosStateData {
  const _$FilteredTodosStateData(
      {this.completed = false, this.todos = const <Todo>[]})
      : assert(completed != null),
        assert(todos != null);

  @JsonKey(defaultValue: false)
  @override
  final bool completed;
  @JsonKey(defaultValue: const <Todo>[])
  @override
  final List<Todo> todos;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FilteredTodosState(completed: $completed, todos: $todos)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FilteredTodosState'))
      ..add(DiagnosticsProperty('completed', completed))
      ..add(DiagnosticsProperty('todos', todos));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FilteredTodosStateData &&
            (identical(other.completed, completed) ||
                const DeepCollectionEquality()
                    .equals(other.completed, completed)) &&
            (identical(other.todos, todos) ||
                const DeepCollectionEquality().equals(other.todos, todos)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(completed) ^
      const DeepCollectionEquality().hash(todos);

  @override
  $FilteredTodosStateDataCopyWith<FilteredTodosStateData> get copyWith =>
      _$FilteredTodosStateDataCopyWithImpl<FilteredTodosStateData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(bool completed, List<Todo> todos), {
    @required Result loading(bool completed, List<Todo> todos),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(completed, todos);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(bool completed, List<Todo> todos), {
    Result loading(bool completed, List<Todo> todos),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(completed, todos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(FilteredTodosStateData value), {
    @required Result loading(FilteredTodosStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(FilteredTodosStateData value), {
    Result loading(FilteredTodosStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class FilteredTodosStateData implements FilteredTodosState {
  const factory FilteredTodosStateData({bool completed, List<Todo> todos}) =
      _$FilteredTodosStateData;

  @override
  bool get completed;
  @override
  List<Todo> get todos;
  @override
  $FilteredTodosStateDataCopyWith<FilteredTodosStateData> get copyWith;
}

abstract class $FilteredTodosStateLoadingCopyWith<$Res>
    implements $FilteredTodosStateCopyWith<$Res> {
  factory $FilteredTodosStateLoadingCopyWith(FilteredTodosStateLoading value,
          $Res Function(FilteredTodosStateLoading) then) =
      _$FilteredTodosStateLoadingCopyWithImpl<$Res>;
  @override
  $Res call({bool completed, List<Todo> todos});
}

class _$FilteredTodosStateLoadingCopyWithImpl<$Res>
    extends _$FilteredTodosStateCopyWithImpl<$Res>
    implements $FilteredTodosStateLoadingCopyWith<$Res> {
  _$FilteredTodosStateLoadingCopyWithImpl(FilteredTodosStateLoading _value,
      $Res Function(FilteredTodosStateLoading) _then)
      : super(_value, (v) => _then(v as FilteredTodosStateLoading));

  @override
  FilteredTodosStateLoading get _value =>
      super._value as FilteredTodosStateLoading;

  @override
  $Res call({
    Object completed = freezed,
    Object todos = freezed,
  }) {
    return _then(FilteredTodosStateLoading(
      completed: completed == freezed ? _value.completed : completed as bool,
      todos: todos == freezed ? _value.todos : todos as List<Todo>,
    ));
  }
}

class _$FilteredTodosStateLoading
    with DiagnosticableTreeMixin
    implements FilteredTodosStateLoading {
  const _$FilteredTodosStateLoading(
      {this.completed = false, this.todos = const <Todo>[]})
      : assert(completed != null),
        assert(todos != null);

  @JsonKey(defaultValue: false)
  @override
  final bool completed;
  @JsonKey(defaultValue: const <Todo>[])
  @override
  final List<Todo> todos;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FilteredTodosState.loading(completed: $completed, todos: $todos)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FilteredTodosState.loading'))
      ..add(DiagnosticsProperty('completed', completed))
      ..add(DiagnosticsProperty('todos', todos));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FilteredTodosStateLoading &&
            (identical(other.completed, completed) ||
                const DeepCollectionEquality()
                    .equals(other.completed, completed)) &&
            (identical(other.todos, todos) ||
                const DeepCollectionEquality().equals(other.todos, todos)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(completed) ^
      const DeepCollectionEquality().hash(todos);

  @override
  $FilteredTodosStateLoadingCopyWith<FilteredTodosStateLoading> get copyWith =>
      _$FilteredTodosStateLoadingCopyWithImpl<FilteredTodosStateLoading>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(bool completed, List<Todo> todos), {
    @required Result loading(bool completed, List<Todo> todos),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading(completed, todos);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(bool completed, List<Todo> todos), {
    Result loading(bool completed, List<Todo> todos),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(completed, todos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(FilteredTodosStateData value), {
    @required Result loading(FilteredTodosStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(FilteredTodosStateData value), {
    Result loading(FilteredTodosStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FilteredTodosStateLoading implements FilteredTodosState {
  const factory FilteredTodosStateLoading({bool completed, List<Todo> todos}) =
      _$FilteredTodosStateLoading;

  @override
  bool get completed;
  @override
  List<Todo> get todos;
  @override
  $FilteredTodosStateLoadingCopyWith<FilteredTodosStateLoading> get copyWith;
}
