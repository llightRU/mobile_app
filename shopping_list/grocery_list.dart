import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/grocery_item.dart';
import './new_item.dart';
import 'package:http/http.dart' as http;
import '../keys/url.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() {
    return _GroceryListState();
  }
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];
  var _isLoading = true;
  var _error = '';
  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
        fire_base_http, 'shopping-list.json');

    try{
      final response = await http.get(url);

      if (response.statusCode == 200){
        if(response.body == 'null'){
          setState(() {
            _isLoading = true;
          });
          return;
        }
        final Map<String, dynamic> listData =
        json.decode(response.body);
        final List<GroceryItem> loadedItems = [];
        for (final item in listData.entries) {
          print(item);
          final category = categories.entries.firstWhere((catItem) => catItem.value.title == item.value['category']).value;
          loadedItems.add(
            GroceryItem(
                id: item.key,
                category: category,
                name: item.value['name'],
                quantity:item.value['quantity']),
          );
        }
        setState(() {
          _groceryItems = loadedItems;
          _isLoading = false;
        });
      }
      else{
        _error = 'Failed to get data. Status code: ${response.statusCode}';
      }
    }
    catch(error) {
      _error = 'Failed to fetch data.Please try again later';
    }

    
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );
    if (newItem == null){
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) async {
    final index = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });

    final url = Uri.https(
        fire_base_http, 'shopping-list/${item.id}.json');
    final response = await http.delete(url);
    if (response.statusCode >= 400){
      setState(() {
      _groceryItems.insert(index,item);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No items added yet'),
    );

    if (_isLoading){
      content = const Center(child: CircularProgressIndicator(),);
    }

    if (_error != null){
      content = Center(
      child: Text(_error),
    );
    }

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          onDismissed: (direction) {
            _removeItem(_groceryItems[index]);
          },
          background: Container(
            color: Colors.red.withOpacity(0.7), // Background color with opacity
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          key: ValueKey(_groceryItems[index].id),
          child: ListTile(
            title: Text(_groceryItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: _groceryItems[index].category.color,
            ),
            trailing: Text(_groceryItems[index].quantity.toString()),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
