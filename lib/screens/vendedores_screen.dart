import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/database/app_database.dart';
import 'package:drift/drift.dart' as drift;
import 'package:tp2/screens/tela_principal.dart';


class VendedoresScreen extends StatefulWidget {
  const VendedoresScreen({super.key});

  @override
State<VendedoresScreen> createState() => _VendedoresScreenState();
}

class _VendedoresScreenState extends State<VendedoresScreen>{

  late AppDatabase database;
  late Future <List<Vendedore>> vendedoresFuture;

  @override
  void initState(){
    super.initState();
    database = Provider.of<AppDatabase>(context, listen: false);
    _carregarVendedores();
  }

  void _carregarVendedores(){
    setState((){
      vendedoresFuture = database.getAllVendedores();
    });
  }

  Future<void> _adicionarVendedor() async {
    final nomeController = TextEditingController();

    final confirmado = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Adicionar Vendedor'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
          ],
        ),
        actions: [
          TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text('Cancelar'),
          ),
          ElevatedButton(
          onPressed: () async{
            final nome = nomeController.text.trim();

            if(nome.isNotEmpty){
              await database.insertVendedor(
                VendedoresCompanion(
                  nome: drift.Value(nome),
                ),
              );
              Navigator.pop(context, true);
            }
          },
          child: Text('Salvar'),
          ),
        ],
      ),
    );
    if(confirmado == true){
      _carregarVendedores();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TelaPrincipal()),);
          }
        ),
      ),
      body: FutureBuilder<List<Vendedore>>(
        future: vendedoresFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError){
            return Center(child: Text('Erro ao carregar os vendedores ${snapshot.error}'),);
          }

          final vendedores = snapshot.data ?? [];

          if(vendedores.isEmpty){
            return const Center(child: Text('Nenhum vendedor cadastrado.'),);
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemCount: vendedores.length,
            itemBuilder: (context, index){
                  final vendedor = vendedores[index];
                   return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      title: Text('ID: ${vendedor.id} - Nome: ${vendedor.nome}'),
                    ),
                   );
            },
          );
            },
          ),
            floatingActionButton: FloatingActionButton(
              onPressed: _adicionarVendedor,
              child: Icon(Icons.add),
              tooltip: 'Adicionar Vendedor',
      ),
    );
  }
}
