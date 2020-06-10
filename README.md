# Flutterとstate_notifierとfreezedで作るTodoアプリ

こんにちは@seiichi3141です。最近state_notifierを始めました。

今まではflutter_blocを使っていたんですが、state_notifierとfreezedのコンボでだいぶ記述量が減ると知って試してからすっかり気に入って、開発中のアプリもほとんど書き換えてしまいました。

今回はそのstate_notifierとfreezedで簡単なTodoリストアプリを作ってその便利さ紹介できたらいいなと思っています。

リポジトリは[こちら](https://github.com/seiichi3141/state_notifier_todo)です。

# 概要

* ModelやStateにfreezedを使って手軽にimmutableやcopyWithを実現する
* StateNotifierを継承したControllerを実装してstateを管理する
* ScreenはStateを監視して表示、Controllerを介してstate操作を行う
* ProviderでStateやControllerの受け渡しを簡潔にする

# Todoリストの機能

* Todoを追加できる
* Todoの未完了-完了を切り替えられる
* リスト表示画面では未完了のリスト、完了のリストの表示を切り替えることができる

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

# モデル

## Todo

Todoを表すModelを実装します。freezedアノテーションをつけ、コンストラクタやcopyWithなどを自動生成するようにします。

```dart
import 'package:flutter/foundation.dart'; // *.freezed.dartで必要なのでimportしておく
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

@freezed
abstract class Todo with _$Todo {
  const factory Todo({
    String id,  // uuidで割りつける予定
    String title,
    @Default(false) bool completed,
  }) = TodoData;
}
```

# ステートとコントローラ

## TodosState

TodosStateを実装します。freezedアノテーションをつけ、データを持つTodoStateDataとローディング中を示すTodosStateLoadingの二つの状態を定義します。

TodosStateのクラスをチェックし、TodosStateLoadingであればまだ読み込み中、TodosStateDataであればデータの読み込みが終わったという判断ができるようになります。

TodosStateDataにはすべてのTodoが入るtodosを持っててもらいます。

```dart
part 'todos_state.freezed.dart';

@freezed
abstract class TodosState with _$TodosState {
  const factory TodosState({
    @Default(<Todo>[]) List<Todo> todos,
  }) = TodosStateData;
  const factory TodosState.loading() = TodosStateLoading;
}
```

## TodosContoller

このTodosStateへの操作はStateNotifierを継承したTodosControllerを通してやります。TodosControllerはLocatorMixinを宣言しておきcontextにあるproviderへのアクセスを容易にしておきます。
ここでは仮にinitStateで5秒間ウエイトを入れ、その後初期データとしていくつかのTodoをstateへ設定しています。
本番ではここでRepositoryなりDBなりからロードすることになるはずです。

```dart
class TodosController extends StateNotifier<TodosState> with LocatorMixin {
  TodosController() : super(const TodosState.loading());

  final _uuid = Uuid();

  @override
  void initState() async {
    super.initState();

    await Future<void>.delayed(const Duration(seconds: 3));

    // 初期データを設定、TodosStateLoadingからTodoStateDataへ変わるのでローディング完了の状態となる
    state = TodosState(
      todos: [
        Todo(id: _uuid.v4(), title: '朝食を食べる'),
        Todo(id: _uuid.v4(), title: 'ラジオ体操をやる'),
        Todo(id: _uuid.v4(), title: '薬を飲む'),
      ],
    );
  }
}
```

また、TodosControllerではadd/toggleを外部に公開し、todoの追加、未完了/完了切り替えをできるようにします。

stateはimmutableなのでメンバ変数を直接変更することはできません。なので、stateを更新するときは現在のstateからcopyWithでコピーするか、新規のstateで上書きすることになります。

```dart
  void add(String title) {
    final currentState = state;
    if (currentState is TodosStateData) {
      // todosのクローンに新しいTodoを追加してstateを更新
      final todos = currentState.todos.toList()
        ..add(
          Todo(id: _uuid.v4(), title: title),
        );
      state = currentState.copyWith(
        todos: todos,
      );
    }
  }

  void toggle(Todo todo) {
    final currentState = state;
    if (currentState is TodosStateData) {
      // Todoを検索してcomplatedをtoggleし、stateを更新
      final clone = currentState.todos.map((t) {
        if (t == todo) {
          return t.copyWith(
            completed: !t.completed,
          );
        }
        return t;
      }).toList();
      state = TodosState(
        todos: clone,
      );
    }
  }
```

## FilteredTodosState

TodosStateをそのまま表示に使うこともできますが、今回はフィルタリングしたリストを表示したいと考えています。そのために画面の表示用にTodoのリストをフィルタリングした結果を持つFilteredTodosStateを実装をします。

現在のフィルタリングのパラメータとしてcompleted変数を、フィルタリングされたTodoのリストとしてtodos持っててもらいます。

```dart
part 'filtered_todos_state.freezed.dart';

@freezed
abstract class FilteredTodosState with _$FilteredTodosState {
  const factory FilteredTodosState({
    @Default(false) bool completed,
    @Default(<Todo>[]) List<Todo> todos,
  }) = FilteredTodosStateData;
}
```

## FilteredTodosController

FilteredTodosControllerを実装します。フィルタのパラメータ変更機能を提供します。

LocatorMixinを宣言するとBuildContextからStateやControllerを探してきてくれるread関数やwatch関数を使えるようになります。update関数をoverrideして使えるようにもなります。ここでwatchしたStateやControllerは、その変化を検出できるようになります。

ここではTodosStateをwatchしtodosが更新されるたびにfilteredTodos関数を実行して最新の情報へアップデートするようにしました。

```dart
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
}
```

toggle関数でstateのcompletedを変更し、Todoのリストもそれに合わせてアップデートします。

```dart
  void toggle() {
    final completed = !state.completed;
    read<TodosState>().maybeWhen((todos) {
      state = state.copyWith(
        completed: completed,
        todos: _filteredTodos(todos, completed: completed),
      );
    }, orElse: () => null);
  }
```

## *.freezed.dartの生成

build_runnerを動作させて、freezedアノテーションを付けたclassを実装する*.freezed.dartファイルを生成します。

```
flutter pub pub run build_runner build
```

# スクリーン

## FilteredTodos

フィルタリングされたTodoのリストを表示するためのWidgetを実装します。

providerパッケージの機能であるcontext.watchを使って、TodosStateの監視を行います。freezedの機能のwhen関数で現在のstateによって返すWidgetを変えることができます。

loadingの場合はCircularProgressIndicatorを返してローディング中だとわかるようにします。

Dataのstateだった場合はローディングが終わっています。context.selectを使ってFilteredTodosStateのtodosを監視し、その内容でListViewを構築して返します。

```dart
class FilteredTodos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.watch<TodosState>().when(
      // TodosStateDataの場合
      (_) {
        final todos = context
            .select<FilteredTodosState, List<Todo>>((state) => state.todos);
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: todos.length,
          itemBuilder: (_, index) {
            final todo = todos[index];
            return _buildCard(context, todo);
          },
        );
      },
      // TodosStateLoadingの場合
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
```

ListViewのアイテムとして使うListTileには完了したかどうかを示すアイコンを表示します。今回はTodoのcompletedによって色を切り替えています。

アイコンが押された時にはcontext.readでTodosControllerを見つけ出してtoggleを実行するようにしています。

これにより、

toggleが実行される->TodosStateが更新される->FilteredTodosControllerがそれを検知しstateを更新する->FilteredTodos Widgetがそれを検知し表示を更新する

といった流れでTodosStateの変化に合わせてリストに表示されるTodoが更新されるようになります。

```dart
  Widget _buildCard(BuildContext context, Todo todo) {
    return Card(
      child: ListTile(
        title: Text(todo.title),
        trailing: IconButton(
          icon: Icon(
            Icons.done,
            color: todo.completed ? Colors.green : Colors.grey,
          ),
          onPressed: () => context.read<TodosController>().toggle(todo),
        ),
      ),
    );
  }
}
```

## FilteredTodosScreen

先ほど実装したFilteredTodos Widgetの表示や、未完了/完了の切り替え、新しいTodoの追加を行うための画面、FilteredTodosScreenを実装します。

AppBarとFilteredTodosを構築している箇所です。

AppBarにはactionsにIcons.done_allを使ったIconButtonを追加して、未完了/完了のどちらを表示しているかを表しています。FilteredTodosStateのcompletedを監視してその色を決めています。

押された時にはFilteredTodosControllerのtoggleを実行させてリストを更新させます。

```dart
class FilteredTodosScreen extends StatelessWidget {
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Todo'),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.done_all,
              color: context.select<FilteredTodosState, bool>(
                      (state) => state.completed)
                  ? Colors.white
                  : Colors.grey),
          onPressed: () {
            context.read<FilteredTodosController>().toggle();
          },
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(child: FilteredTodos()),
        _buildPanel(context),
      ],
    );
  }
```

新しいTodoを追加するためのTexitFieldとFloatingActionButtonを実装しているところです。

追加ボタンが押されたときに、TodosControllerのaddにTexitFieldの内容を渡して新しいTodoを追加させ、TextFieldの内容をクリアさせています。

```dart
  Widget _buildPanel(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                hintText: 'タイトル',
                filled: false,
              ),
            ),
          ),
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              var title = _textEditingController.value.text;
              if (title.isEmpty) {
                title = 'No Title';
              }
              context.read<TodosController>().add(title);
              _textEditingController.clear();
            },
          ),
        ],
      ),
    );
  }
```

# プロバイダー

## main.dart

このままMaterialAppにFilterdTodosScreenを渡して表示させようとするとcontextにStateやControllerが見当たらないと怒られてしまいます。

まず、App全体で利用するだろうTodosState/TodosControllerはMaterialAppをStateNotifierProviderでWrapして使えるようします。

また、FilteredTodosState/FilteredTodosControllerはそれを利用するFilteredTodosScreenをStateNotifierProviderでWrapしてFilteredTodosControllerを使えるようにしておきます。

```dart
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<TodosController, TodosState>(
      create: (_) => TodosController(),
      child: MaterialApp(
        title: 'State Notifier Todo Demo',
        debugShowCheckedModeBanner: false,
        home:
            StateNotifierProvider<FilteredTodosController, FilteredTodosState>(
          create: (_) => FilteredTodosController(),
          child: FilteredTodosScreen(),
        ),
      ),
    );
  }
}
```

# 実行

実装は以上です。動かしてみましょう。

# まとめ

state_notifierとfreezedを使ってTodoリストを実装することができました。

Todoのリストを管理しているおおもとはTodosState/TodosControllerです。FilteredTodosState/FilteredTodosControllerはその情報をもとに独自のパラメータを利用してリストを加工しているにすぎません。例えばこのアプリにTodo検索の機能を追加したいと考えたとき、SearchTodosState/SearchTodosControllerを追加して入力されたキーワードをもとにリストを加工してそのstateに持たせることができるでしょう。App以下であればTodosControllerを介してTodosStateを更新すれば、それを監視しているStateやScreenだけがその変化によって振る舞いを変えてくれます。

freezedのおかげでModelやStateの実装も楽にできました。freezedにはjson_serializationとの連携もありますので、DBの実装もかなり楽になると思います。

一度試してみてはいかがでしょうか。
