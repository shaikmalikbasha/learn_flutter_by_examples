import 'package:flutter/material.dart';
import 'package:learn_flutter_by_examples/features/school_app_1/chat.dart';
import 'package:learn_flutter_by_examples/features/school_app_1/dashboard.dart';
import 'package:learn_flutter_by_examples/features/school_app_1/home.dart';
import 'package:learn_flutter_by_examples/features/school_app_1/settings.dart';

class SchoolApp extends StatelessWidget {
  const SchoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SchoolApp',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SchoolAppHome(),
    );
  }
}

class SchoolAppHome extends StatefulWidget {
  const SchoolAppHome({super.key});

  @override
  State<SchoolAppHome> createState() => _SchoolAppHomeState();
}

class _SchoolAppHomeState extends State<SchoolAppHome> {
  int _selectedIndex = 0;

  // Using IndexedStack → preserves state of each tab
  final List<Widget> _tabs = const [
    HomePage(),
    DashboardPage(),
    ChatPage(),
    SettingsPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String _getTitle() {
    switch (_selectedIndex) {
      case 0:
        return 'Home';
      case 1:
        return 'Dashboard';
      case 2:
        return 'Chat';
      case 3:
        return 'Settings';
      default:
        return 'SchoolApp';
    }
  }

  void showNotifications() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getTitle()),
        backgroundColor: Colors.white,
        elevation: 2,
        foregroundColor: Colors.black,
        // leading: IconButton(
        //   onPressed: () {
        //     Scaffold.of(context).openDrawer();
        //   },
        //   icon: const Icon(Icons.menu_rounded),
        // ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              backgroundImage: AssetImage('images/logo.png'),
            ),
          ),
        ],
      ),

      backgroundColor: Colors.white,

      // ✅ Keeps state of tabs (better than direct indexing)
      body: IndexedStack(index: _selectedIndex, children: _tabs),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Welcome, Shaik Malik Basha\n@itz_me_mr_developer",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            ListTile(title: Text("Home"), leading: Icon(Icons.home)),
            ListTile(title: Text("Instagram"), leading: Icon(Icons.camera_alt)),
          ],
        ),
      ),
    );
  }
}
