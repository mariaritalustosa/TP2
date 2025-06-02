import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/providers/tela_atual_provider.dart';
import 'package:tp2/providers/theme_provider.dart';
import 'package:tp2/screens/produtos_screen.dart';

class TelaPrincipal extends StatelessWidget{
  const TelaPrincipal({super.key});

  @override
  Widget build(BuildContext context){
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Principal'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(themeProvider.themeMode == ThemeMode.dark
            ? Icons.brightness_7
            : Icons.brightness_2,),
            onPressed: () {
              themeProvider.toggleTheme();
            },
            tooltip: 'Alterar tema',
          )
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.inventory),
            title: Text('Produtos'),
            BottomNavigationBarItem(icon: Icon(Icons.person),
            label: 'Clientes',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.store),
            label: 'Vendedores',
            ),
          BottomNavigationBarItem(icon: 
          Icon(Icons.swap_horiz),
          label: 'Movimentações',
          ),
          BottomNavigationBarItem(icon: 
          Icon(Icons.bar_chart),
          label: 'Gráficos',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}