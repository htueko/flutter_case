import 'package:flutter/material.dart';
import 'package:flutter_case/common/presentation/style/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: appTheme.currentThemeMode,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    appTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Theme'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              appTheme.toggleTheme();
            },
            icon: appTheme.isDarkTheme()
                ? Icon(Icons.nights_stay)
                : Icon(Icons.wb_sunny),
          ),
        ],
      ),
      body: Center(
        child: Text('Text Theme'),
      ),
    ));
  }
}
