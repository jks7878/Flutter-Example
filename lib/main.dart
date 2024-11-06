import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_example/screens/first_screen.dart';
import 'package:flutter_example/screens/second_screen.dart';
import 'package:flutter_example/screens/third_screen.dart';
import 'package:flutter_example/next_screen.dart';
import 'package:flutter_example/models/user.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Counter demo',
        home: const MyHomePage(title: "Counter Example")
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final User _user = User(
      id: "testUser",
      name: "Test",
      email: "test@email.com",
      age: 30
  );

  final List<Widget> _pages = [
    Center(child: const FirstScreen()),
    Center(child: const SecondScreen()),
    Center(child: const ThirdScreen()),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        shadowColor: Colors.black,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        foregroundColor: Colors.red,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
                'doge.png',
                fit: BoxFit.contain,
                height: 36
            ),
          ]
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
                accountName: Text(_user.name),
                accountEmail: Text(_user.email)
            ),
            ListTile(
              title: Text("테스트1"),
              onTap: () {
                Navigator.of(context).pop(); // Drawer를 닫기 위해 pop 호출
                Get.to(() => NextScreen()); // NextScreen으로 이동
              }
            ),
            ListTile(
                title: Text("테스트2")
            ),
            ListTile(
                title: Text("테스트3")
            )
          ],
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.email),
              label: 'Mail'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'MY',
            ),
          ]
      )
    );
  }
}
