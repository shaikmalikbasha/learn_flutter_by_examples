import 'package:flutter/material.dart';

class MyAppWithTabs extends StatelessWidget {
  const MyAppWithTabs({super.key});

  @override
  Widget build(BuildContext context) {
    // Standard practice: Material 3 is now the default in 2026
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My App"),
          leading: Icon(Icons.menu_rounded),
          // Only use PreferredSize here if you need a non-standard Tab height
          bottom: const TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment
                .start, // Required for scrollable tabs in Material 3
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(text: "Tab 1"),
              Tab(text: "Tab 2"),
              Tab(text: "Tab 3"),
              Tab(text: "Tab 4"),
              Tab(text: "Tab 5"),
              Tab(text: "Tab 6"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            KeepAliveTab(text: "Tab 1 content"),
            KeepAliveTab(text: "Tab 2 content"),
            KeepAliveTab(text: "Tab 3 content"),
            KeepAliveTab(text: "Tab 4 content"),
            KeepAliveTab(text: "Tab 5 content"),
            KeepAliveTab(text: "Tab 6 content"),
          ],
        ),
      ),
    );
  }
}

// Helper widget to prevent state loss when switching tabs
class KeepAliveTab extends StatefulWidget {
  final String text;
  const KeepAliveTab({super.key, required this.text});

  @override
  State<KeepAliveTab> createState() => _KeepAliveTabState();
}

class _KeepAliveTabState extends State<KeepAliveTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; // Keeps the state alive

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(child: Text(widget.text));
  }
}
