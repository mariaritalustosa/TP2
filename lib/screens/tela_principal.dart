import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/screens/produtos_screen.dart';
import 'package:tp2/screens/clientes_screen.dart';
import 'package:tp2/screens/vendedores_screen.dart';
import 'package:tp2/screens/movimentacoes_screen.dart';
import 'package:tp2/providers/theme_provider.dart';
import 'package:tp2/screens/graficos_screen.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Principal'),
        centerTitle: true,
        automaticallyImplyLeading: false, 
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.themeMode == ThemeMode.dark
                  ? Icons.brightness_7
                  : Icons.brightness_2,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
            tooltip: 'Alterar tema',
          ),
        ],
      ),
      body: const Center(
        child: Text('Selecione uma opção abaixo'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              heroTag: 'produtos',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProdutosScreen()),
                );
              },
              tooltip: 'Produtos',
              child: const Icon(Icons.store),
            ),
            FloatingActionButton(
              heroTag: 'clientes',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ClientesScreen()),
                );
              },
              tooltip: 'Clientes',
              child: const Icon(Icons.person),
            ),
            FloatingActionButton(
              heroTag: 'vendedores',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const VendedoresScreen()),
                );
              },
              tooltip: 'Vendedores',
              child: const Icon(Icons.person_outline),
            ),
            FloatingActionButton(
              heroTag: 'movimentacoes',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MovimentacoesScreen()),
                );
              },
              tooltip: 'Movimentações',
              child: const Icon(Icons.swap_horiz),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (_) => const GraficosScreen()),
                  );
              },
              tooltip: 'Gráficos',
              child: Icon(Icons.bar_chart),
              ),
          ],
        ),
      ),
    );
  }
}
