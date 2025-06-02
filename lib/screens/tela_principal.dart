import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/providers/tela_atual_provider.dart';
import 'package:tp2/providers/theme_provider.dart';
import 'package:tp2/screens/produtos_screen.dart';

class TelaPrincipal extends StatelessWidget{
  const TelaPrincipal({super.key});

  final List<Widget> _telas = const [
    ProdutosScreen(),
    //ClientesScreen(),
    //VendedoresScreen(),
    //MovimentacoesScreen(),
    //GraficosScreen(),
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
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulos[telaAtual.indice]),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(themeProvider.themeMode == ThemeMode.dark
            ? Icons.brightness_7
            : Icons.brightness_2,),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
            tooltip: 'Alterar tema',
          )
        ],
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