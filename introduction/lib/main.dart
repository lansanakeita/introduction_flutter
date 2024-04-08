import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reservations',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Où nous partons?'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, 
        title: Text(widget.title, style: TextStyle(color: Colors.black)),
        bottom: TabBar(
          controller: _tabController,
          unselectedLabelColor: Colors.pink, 
          labelColor: Colors.pink,
          indicatorColor: Colors.pink,
          tabs: const <Widget>[
            Tab(icon: Icon(Icons.home, color: Colors.pink), text: 'Campagne'), 
            Tab(icon: Icon(Icons.houseboat_outlined, color: Colors.pink), text: 'Sur leau'), 
            Tab(icon: Icon(Icons.panorama, color: Colors.pink), text: 'Avec vous'),
          ],
        ),
      ),
      backgroundColor: Colors.white, 
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/home.png'), 
                SizedBox(height: 10),
                Text(
                      'Paris, France',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                Text(
                  '3 - 8 Septembre', 
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '140€ par nuit', 
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Center(child: Text(' Page')),
          Center(child: Text(' Page')),
        ],
      ),
    );
  }
}
