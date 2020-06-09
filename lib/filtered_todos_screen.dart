import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_notifier_todo/filtered_todos_state.dart';
import 'package:state_notifier_todo/todos_state.dart';

class FilteredTodosScreen extends StatefulWidget {
  @override
  _FilteredTodosScreenState createState() => _FilteredTodosScreenState();
}

class _FilteredTodosScreenState extends State<FilteredTodosScreen> {
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
        Expanded(child: _buildList(context)),
        _buildPanel(context),
      ],
    );
  }

  Widget _buildList(BuildContext context) {
    return context.watch<FilteredTodosState>().when((completed, todos) {
      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: todos.length,
        itemBuilder: (_, index) {
          final todo = todos[index];
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
        },
      );
    }, loading: (_, __) => const Center(child: CircularProgressIndicator()));
  }

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
}
