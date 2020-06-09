// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$TodoTearOff {
  const _$TodoTearOff();

  TodoData call({String id, String title, bool completed = false}) {
    return TodoData(
      id: id,
      title: title,
      completed: completed,
    );
  }
}

// ignore: unused_element
const $Todo = _$TodoTearOff();

mixin _$Todo {
  String get id;
  String get title;
  bool get completed;

  $TodoCopyWith<Todo> get copyWith;
}

abstract class $TodoCopyWith<$Res> {
  factory $TodoCopyWith(Todo value, $Res Function(Todo) then) =
      _$TodoCopyWithImpl<$Res>;
  $Res call({String id, String title, bool completed});
}

class _$TodoCopyWithImpl<$Res> implements $TodoCopyWith<$Res> {
  _$TodoCopyWithImpl(this._value, this._then);

  final Todo _value;
  // ignore: unused_field
  final $Res Function(Todo) _then;

  @override
  $Res call({
    Object id = freezed,
    Object title = freezed,
    Object completed = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      title: title == freezed ? _value.title : title as String,
      completed: completed == freezed ? _value.completed : completed as bool,
    ));
  }
}

abstract class $TodoDataCopyWith<$Res> implements $TodoCopyWith<$Res> {
  factory $TodoDataCopyWith(TodoData value, $Res Function(TodoData) then) =
      _$TodoDataCopyWithImpl<$Res>;
  @override
  $Res call({String id, String title, bool completed});
}

class _$TodoDataCopyWithImpl<$Res> extends _$TodoCopyWithImpl<$Res>
    implements $TodoDataCopyWith<$Res> {
  _$TodoDataCopyWithImpl(TodoData _value, $Res Function(TodoData) _then)
      : super(_value, (v) => _then(v as TodoData));

  @override
  TodoData get _value => super._value as TodoData;

  @override
  $Res call({
    Object id = freezed,
    Object title = freezed,
    Object completed = freezed,
  }) {
    return _then(TodoData(
      id: id == freezed ? _value.id : id as String,
      title: title == freezed ? _value.title : title as String,
      completed: completed == freezed ? _value.completed : completed as bool,
    ));
  }
}

class _$TodoData with DiagnosticableTreeMixin implements TodoData {
  const _$TodoData({this.id, this.title, this.completed = false})
      : assert(completed != null);

  @override
  final String id;
  @override
  final String title;
  @JsonKey(defaultValue: false)
  @override
  final bool completed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Todo(id: $id, title: $title, completed: $completed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Todo'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('completed', completed));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TodoData &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.completed, completed) ||
                const DeepCollectionEquality()
                    .equals(other.completed, completed)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(completed);

  @override
  $TodoDataCopyWith<TodoData> get copyWith =>
      _$TodoDataCopyWithImpl<TodoData>(this, _$identity);
}

abstract class TodoData implements Todo {
  const factory TodoData({String id, String title, bool completed}) =
      _$TodoData;

  @override
  String get id;
  @override
  String get title;
  @override
  bool get completed;
  @override
  $TodoDataCopyWith<TodoData> get copyWith;
}
