import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/providers/tela_atual_provider.dart';
import 'package:tp2/screens/tela_principal.dart';

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