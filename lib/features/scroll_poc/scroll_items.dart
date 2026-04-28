import 'package:flutter/material.dart';

class InfiniteScrollApp extends StatelessWidget {
  const InfiniteScrollApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'ScrollApp', home: InfiniteScrollPage());
  }
}

class InfiniteScrollPage extends StatefulWidget {
  const InfiniteScrollPage({super.key});
  @override
  _InfiniteScrollPageState createState() => _InfiniteScrollPageState();
}

class _InfiniteScrollPageState extends State<InfiniteScrollPage> {
  final ScrollController _scrollController = ScrollController();

  List<int> items = [];
  bool isLoading = false;
  int page = 0;
  final int limit = 10;

  @override
  void initState() {
    super.initState();
    _loadMore();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !isLoading) {
        _loadMore();
      }
    });
  }

  Future<void> _loadMore() async {
    setState(() => isLoading = true);

    List<int> newData = await fetchDummyData(page, limit);

    setState(() {
      page++;
      items.addAll(newData);
      isLoading = false;
    });
  }

  // 🔹 Dummy API method
  Future<List<int>> fetchDummyData(int page, int limit) async {
    await Future.delayed(Duration(seconds: 2)); // simulate network delay

    return List.generate(limit, (index) => page * limit + index);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Infinite Scroll Cards")),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          if (index < items.length) {
            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(title: Text("Item ${items[index]}")),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: isLoading ? CircularProgressIndicator() : SizedBox(),
              ),
            );
          }
        },
      ),
    );
  }
}
