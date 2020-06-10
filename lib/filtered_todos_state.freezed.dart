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
}

// ignore: unused_element
const $FilteredTodosState = _$FilteredTodosStateTearOff();

mixin _$FilteredTodosState {
  bool get completed;
  List<Todo> get todos;

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
