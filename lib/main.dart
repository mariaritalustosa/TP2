import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/providers/tela_atual_provider.dart';
import 'package:tp2/screens/tela_principal.dart';
import 'package:tp2/themes/themes.dart';
import 'package:tp2/providers/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => TelaAtualProvider()),
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
  ],
    child: const MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'CRUD de compras e vendas de Produtos',
      theme: AppTheme.lightTheme,
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.themeMode,
      home: const TelaPrincipal(),
    );
  }
}