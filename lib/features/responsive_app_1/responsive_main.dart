import 'package:flutter/material.dart';

// ---------------- APP ROOT ----------------

class MyResponsiveApp extends StatelessWidget {
  const MyResponsiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveHomePage(),
    );
  }
}

// ---------------- RESPONSIVE HOME ----------------

class ResponsiveHomePage extends StatelessWidget {
  const ResponsiveHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;

        if (width < 600) {
          return const MobileLayout();
        } else if (width < 1024) {
          return const TabletLayout();
        } else {
          return const DesktopLayout();
        }
      },
    );
  }
}

// ---------------- MOBILE ----------------

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(columns: 1);
  }
}

// ---------------- TABLET ----------------

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(columns: 2);
  }
}

// ---------------- DESKTOP ----------------

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(columns: 4);
  }
}

// ---------------- BASE SCAFFOLD ----------------

class BaseScaffold extends StatelessWidget {
  final int columns;

  const BaseScaffold({super.key, required this.columns});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Responsive Flutter App"),
        backgroundColor: Colors.blue,
      ),

      drawer: columns == 1 ? const AppDrawer() : null,

      body: Row(
        children: [
          // Sidebar (only for tablet/desktop)
          if (columns > 1) const SizedBox(width: 220, child: AppDrawer()),

          // Main Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ResponsiveGrid(columns: columns),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- DRAWER ----------------

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade50,
      child: ListView(
        children: const [
          DrawerHeader(child: Text("Menu", style: TextStyle(fontSize: 22))),
          ListTile(leading: Icon(Icons.home), title: Text("Home")),
          ListTile(leading: Icon(Icons.person), title: Text("Profile")),
          ListTile(leading: Icon(Icons.settings), title: Text("Settings")),
        ],
      ),
    );
  }
}

// ---------------- GRID ----------------

class ResponsiveGrid extends StatelessWidget {
  final int columns;

  const ResponsiveGrid({super.key, required this.columns});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 20,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.1,
      ),
      itemBuilder: (context, index) {
        return ContentCard(index: index);
      },
    );
  }
}

// ---------------- CARD ----------------

class ContentCard extends StatelessWidget {
  final int index;

  const ContentCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.widgets, size: 40, color: Colors.blue.shade400),
            const SizedBox(height: 10),
            Text(
              "Card $index",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 6),
            const Text(
              "Responsive content example",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
