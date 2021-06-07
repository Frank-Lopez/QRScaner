import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrcaner/src/Provider/scan_list_provider.dart';
import 'package:qrcaner/src/Provider/ui_provider.dart';

import 'package:qrcaner/src/pages/direcciones_page.dart';
import 'package:qrcaner/src/pages/mapas_page.dart';
import 'package:qrcaner/src/widget/custon_navigatorbar.dart';
import 'package:qrcaner/src/widget/scan_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        actions: [
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Provider.of<ScanListProvider>(context, listen: false)
                .borrarTodos();


              })
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustonNavigatorBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansPorTipo('geo');
        return MapasPage();

      case 1:
        scanListProvider.cargarScansPorTipo('http');
        return DireccionesPage();

      default:
        return MapasPage();
    }
  }
}
