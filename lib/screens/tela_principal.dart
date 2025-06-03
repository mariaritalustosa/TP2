import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/providers/tela_atual_provider.dart';
import 'package:tp2/providers/theme_provider.dart';
import 'package:tp2/screens/produtos_screen.dart';
import 'clientes_screen.dart';

class TelaPrincipal extends StatefulWidget{
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState(); 
  }

class _TelaPrincipalState extends State<TelaPrincipal>{
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
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => ProdutosScreen()),
              );
            },
          ),
           ListTile(
            leading: Icon(Icons.person),
            title: Text('Clientes'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => ClientesScreen()),
              );
            },
          ),
          /** 
          ListTile(
            leading: Icon(Icons.store),
            title: Text('Vendedores'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => VendedoresScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.swap_horiz),
            title: Text('Movimentações'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => MovimentacoesScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text('Gráficos'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => GraficosScreen()),
              );
            },
          ), */
        ],
      ),
    );
  }
}
