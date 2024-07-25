import 'package:flutter/material.dart';

class AnimatedListItems extends StatefulWidget {
  const AnimatedListItems({super.key});

  @override
  AnimatedListItemsState createState() => AnimatedListItemsState();
}

class AnimatedListItemsState extends State<AnimatedListItems> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<int> _items = [1,2];
  int _counter = 3;

  void _addItem() {
    _items.insert(_items.length, _counter++);
    _listKey.currentState!.insertItem(_items.length-1);
  }

  void _removeItem(int index) {
    final int removedItem = _items.removeAt(index);
    _listKey.currentState!.removeItem(
      index,
      (context, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: ListTile(
            title: Text(
              'Item $removedItem',
              style: const TextStyle(fontSize: 20),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:20.0),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: AnimatedList(
              key: _listKey,
              initialItemCount: _items.length,
              itemBuilder: (context, index, animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: ListTile(
                    title: Text(
                      'Item ${_items[index]}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.purple[200]),
                      onPressed: () => _removeItem(index),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                _addItem();
              },
              style: ElevatedButton.styleFrom(
               backgroundColor: Colors.purple[100],
              ),
              child: const Text('Add item', style: TextStyle(color: Colors.black),),
            ),
          ),
        ],
      ),
    );
  }
}