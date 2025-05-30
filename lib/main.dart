import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/providers/tela_atual_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: 
  (_) => TelaAtualProvider(),
  child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD de compras e vendas de Produtos',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const TelaPrincipal(),
    );
  }
}

class TelaPrincipal extends StatelessWidget{
  const TelaPrincipal({super.key});

  final List<Widget> _telas = const [
    ProdutosScreen(),
    ClientesScreen(),
    VendedoresScreen(),
    MovimentacoesScreen(),
    GraficosScreen(),
  ];

  final List<String> _titulos = const[
    'Produtos',
    'Clientes',
    'Vendedores',
    'Movimentações',
    'Gráficos',
  ];

  @override
  Widget build(BuildContext context){
    final telaAtual = Provider.of<TelaAtualProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_titulos[telaAtual.indice]),
        centerTitle: true,
      ),

      body: _telas[telaAtual.indice],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: telaAtual.indice,
        onTap: telaAtual.mudarIndice,
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Produtos',
            ),
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