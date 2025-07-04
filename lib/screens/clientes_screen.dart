import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/database/app_database.dart';
import 'package:drift/drift.dart' as drift;
import 'package:tp2/screens/tela_principal.dart';


class ClientesScreen extends StatefulWidget {
  const ClientesScreen({super.key});

  @override
  State<ClientesScreen> createState() => _ClientesScreenState();
}

class _ClientesScreenState extends State<ClientesScreen>{

  late AppDatabase database;
  late Future <List<Cliente>> clientesFuture;

  @override
  void initState(){
    super.initState();
    database = Provider.of<AppDatabase>(context, listen: false);
    _carregarClientes();
  }

  void _carregarClientes(){
    setState((){
      clientesFuture = database.getAllClientes();
    });
  }

  Future<void> _adicionarCliente() async {
    final nomeController = TextEditingController();

    final confirmado = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Adicionar Cliente', style: Theme.of(context).textTheme.titleMedium,),
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
            if(nome.length < 5){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('O nome deve ter pelo menos 5 caracteres')),
                );
                return;
            }
            try{
              await database.insertCliente(
                ClientesCompanion(nome: drift.Value(nome)),
              );
              Navigator.pop(context, true);
            } catch(e){
              print('Erro ao inserir cliente: $e');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Erro ao inserir cliente')),
              );
            }
            },
          child: Text('Salvar'),
          ),
        ],
      ),
    );
    if(confirmado == true){
      _carregarClientes();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).appBarTheme.iconTheme?.color),
          onPressed: () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TelaPrincipal()),);
          }
        ),
        title: Text('Clientes', style: Theme.of(context).appBarTheme.titleTextStyle),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: FutureBuilder<List<Cliente>>(
        future: clientesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError){
            return Center(child: Text('Erro ao carregar os clientes: ${snapshot.error}'),);
          }

          final clientes = snapshot.data ?? [];

          if(clientes.isEmpty){
            return const Center(child: Text('Nenhum cliente foi cadastrado.'),);
          }

          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 16),
            itemCount: clientes.length,
            itemBuilder: (context, index){
              final cliente = clientes[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      title: Text('ID: ${cliente.id} - ${cliente.nome}',
                      style: Theme.of(context).textTheme.bodyMedium),
                    ),
                  );
            },
          );
        },
      ),
        floatingActionButton: FloatingActionButton(
        onPressed: _adicionarCliente,
        child: Icon(Icons.add),
        tooltip: 'Adicionar Clientes ao Banco de Dados',
      ),
      );
  }
}
