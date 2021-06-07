import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrcaner/src/Provider/scan_list_provider.dart';
import 'package:qrcaner/src/Provider/ui_provider.dart';

import 'package:qrcaner/src/pages/home_page.dart';
import 'package:qrcaner/src/pages/mapa_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      
      providers: [
      ChangeNotifierProvider(create: (_) => UiProvider()),
      ChangeNotifierProvider(create: (_) => ScanListProvider()),
      ],
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
        'home': (_) => HomePage(), 
        'mapa': (_) => MapaPage()
        },
        theme: ThemeData(
        primaryColor: Colors.green,
        floatingActionButtonTheme:
        FloatingActionButtonThemeData(
        backgroundColor: Colors.indigo)
        ),
      ),
    );
  }
}
