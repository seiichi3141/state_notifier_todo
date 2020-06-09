# Flutterとstate_notifierとfreezedで作るTodoアプリ

こんにちは@seiichi3141です。最近state_notifierを始めました。

今まではflutter_blocを使っていたんですが、state_notifierとfreezedのコンボでだいぶ記述量が減ると知って試してからすっかり気に入っています。

ということで今回はstate_notifierとfreezedで簡単なTodoアプリを作ってみます。

# 使用するライブラリ

| Package |  |
|:-----------|------------:|
| flutter_state_notofier | StateNotifierやStateNotifierProviderを使うため |
| freezed_annotation | freezedでコード生成するためのアノテーション |
| provider | Providerへのアクセスを容易にするため |
| uuid | TodoアイテムへのID付け |

```
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^0.1.3
  flutter_state_notifier: ^0.4.2
  freezed_annotation: ^0.7.1
  provider: ^4.1.3
  uuid: ^2.0.4

dev_dependencies:
  flutter_test:
    sdk: flutter
  freezed: ^0.10.9
  build_runner: ^1.10.0

```

## Todo model

Todoを表すModelを実装します。freezedアノテーションをつけ、コンストラクタやcopyWithなどを自動生成するようにします。

```dart
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

@freezed
abstract class Todo with _$Todo {
  const factory Todo({
    int id,
    String title,
    bool completed,
  }) = TodoData;
}
```

## Todos State

TodosStateを実装します。TodosStateもfreezedアノテーションをつけ、データを持つTodoStateDataとローディング中を示すTodosStateLoadingの二つの状態を定義する。

TodosStateのクラスをチェックし、TodosStateLoadingであればまだ読み込み中、TodosStateDataであればデータの読み込みが終わったという判断ができるようになります。

```dart
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
```

このTodosStateへの操作はStateNotifierを継承したTodosControllerを通してやります。TodosControllerはLocatorMixinを宣言しておきcontextにあるproviderへのアクセスを容易にしておきます。
ここでは仮にinitStateで5秒間ウエイトを入れ、その後初期データとしていくつかのTodoをstateへ設定しています。
本番ではここでRepositoryなりDBからロードすることになるはずです。

また、TodosControllerにはadd/toggleを外部に公開し、todoの追加、完了をできるようにします。

stateはimmutableでメンバ変数を直接変更することはできないので、stateを更新するときは現在のstateからcopyWithでコピーするか、新規のstateで上書きすることになります。

```dart
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
```

## FilteredTodosState

TodosStateをそのまま表示に使うこともできますが、フィルタリングしたリストを表示したいと思います。そのため画面の表示用にTodoのリストをフィルタリングした結果を持つFilteredTodosStateを実装をします。

また、FilteredTodosStateには今のフィルタリングのパラメータとしてcompleted変数を持っててもらいます。

TodosStateと同じようにFilteredTodosStateDataとFilteredTodosStateLoadingの二つの状態を定義しました。

```dart
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
```

FilteredTodosControllerを実装します。LocatorMixinを宣言するとBuildContextからStateやControllerを探してきてくれるread関数やwatch関数を使えるようになります。

LocatorMixinを宣言しているとupdate関数をoverrideして使えるようになります。ここでwatchしたStateやControllerは、その変化を検出できるようになります。

ここではTodosStateをwatchしtodosが更新されるたびにfilteredTodos関数を実行して最新の情報へアップデートするようにしました。

toggle関数でstateのcompletedを変更し、TodoのリストもTodosStateの最新の情報を使ってアップデートするようにしました。

```dart
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
```

## *.freezed.dartの生成

```
flutter pub pub run build_runner build
```

